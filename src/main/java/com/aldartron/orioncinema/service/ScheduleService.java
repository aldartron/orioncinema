package com.aldartron.orioncinema.service;

import com.aldartron.orioncinema.entity.MovieSession;
import lombok.AllArgsConstructor;
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.springframework.stereotype.Service;
import com.aldartron.orioncinema.dao.HallDao;
import com.aldartron.orioncinema.dao.SeatDao;
import com.aldartron.orioncinema.dao.MovieSessionDao;
import com.aldartron.orioncinema.entity.Hall;
import com.aldartron.orioncinema.entity.Movie;
import com.aldartron.orioncinema.entity.Seat;
import com.aldartron.orioncinema.util.DateHelper;
import com.aldartron.orioncinema.util.Day;

import java.text.SimpleDateFormat;
import java.util.*;

@AllArgsConstructor
@Service
public class ScheduleService {

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    private HallDao hallDao;
    private MovieSessionDao movieSessionDao;
    private SeatDao seatDao;
    private MovieService movieService;

    // Дни для липучего заголовка
    public List<Day> getDaysSequence() {
        int diff = Days.daysBetween(
                new DateTime(DateHelper.getFakeDate().getTime()),
                new DateTime(movieSessionDao.findTopByOrderByDatetimeDesc().getDatetime())
        ).getDays();
        return Day.getDays(DateHelper.getFakeDate(), diff + 1);
    }

    public List<Hall> getHalls() {
        return hallDao.findAll();
    }

    // Сеансы по дням для фильма
    public Map<Day, List<MovieSession>> getScheduleForMovie(Movie movie) {
        var schedule = new LinkedHashMap<Day, List<MovieSession>>();
        var days = getScheduleDays(movie);
        for (var day : days) {
            var sessions = movieSessionDao.findAllByMovieAndDatetime(
                    movie,
                    DATE_FORMAT.format(day.getCalendar().getTime()) + "%"
            );
            if (!sessions.isEmpty())
                schedule.put(day, sessions);
        }
        return schedule;
    }

    // Сеансы по фильмам для конкретного дня
    public Map<Movie, List<MovieSession>> getScheduleForDate(Date date) {
        var schedule = new LinkedHashMap<Movie, List<MovieSession>>();
        var movies = movieService.getMoviesByDate(date);
        for (var movie : movies) {
            var sessions = movieSessionDao.findAllByMovieAndDatetime(movie, DATE_FORMAT.format(date) + "%");
            if (!sessions.isEmpty())
                schedule.put(movie, sessions);
        }
        return schedule;
    }

    // Дни для расписания
    private List<Day> getScheduleDays(Movie movie) {
        var days = new HashSet<Calendar>();
        // Составление списка с датами точности до дня
        for (var session : movie.getSessions()) {
            Calendar day = Calendar.getInstance();
            day.setTime(session.getDatetime());
            Calendar newDay = Calendar.getInstance();
            newDay.set(day.get(Calendar.YEAR), day.get(Calendar.MONTH), day.get(Calendar.DATE));
            days.add(newDay);
        }

        Calendar minDay = null;
        for (var day : days) {
            if (minDay == null || day.before(minDay))
                minDay = day;
        }

        return Day.getDays(minDay.before(DateHelper.getFakeDate()) ? DateHelper.getFakeDate() : minDay, days.size());
    }

    public List<Seat> getBusySeatsBySession(MovieSession movieSession) {
        return seatDao.findAllBySessionAndBusy(movieSession);
    }

}
