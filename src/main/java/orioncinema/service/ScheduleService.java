package orioncinema.service;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import orioncinema.dao.HallDao;
import orioncinema.dao.MovieDao;
import orioncinema.dao.SeatDao;
import orioncinema.dao.SessionDao;
import orioncinema.entity.Hall;
import orioncinema.entity.Movie;
import orioncinema.entity.Seat;
import orioncinema.entity.Session;
import orioncinema.util.DateHelper;
import orioncinema.util.Day;

import java.util.*;


@Service
public class ScheduleService {

    private HallDao hallDao;
    private SessionDao sessionDao;
    private SeatDao seatDao;
    private MovieService movieService;

    // Дни для липучего заголовка
    public List<Day> getDaysSequence() {
        int diff = Days.daysBetween(new DateTime(DateHelper.getFakeDate().getTime()), new DateTime(sessionDao.getLastSession().getDatetime())).getDays();
        return Day.getDays(DateHelper.getFakeDate(), diff+1);
    }

    public List<Hall> getHalls() {
        return hallDao.getAllHalls();
    }

    // Сеансы по дням для фильма
    public Map<Day, List<Session>> getScheduleForMovie(Movie movie) {
        Map<Day, List<Session>> schedule = new LinkedHashMap<Day, List<Session>>();
        List<Day> days = getScheduleDays(movie);
        for (Day day : days) {
            List<Session> sessions = sessionDao.getSessionsByMovieAndDate(movie, day.getCalendar().getTime());
            if (!sessions.isEmpty())
                schedule.put(day, sessions);
        }
        return schedule;
    }

    // Сеансы по фильмам для конкретного дня
    public Map<Movie, List<Session>> getScheduleForDate(Date date) {
        Map<Movie, List<Session>> schedule = new LinkedHashMap<Movie, List<Session>>();
        List<Movie> movies = movieService.getMoviesByDate(date);
        for (Movie movie : movies) {
            List<Session> sessions = sessionDao.getSessionsByMovieAndDate(movie, date);
            if (!sessions.isEmpty())
                schedule.put(movie, sessions);
        }
        return schedule;
    }

    // Дни для расписания
    public List<Day> getScheduleDays(Movie movie) {
        Set<Calendar> days = new HashSet<Calendar>();
        // Составление списка с датами точности до дня
        for (Session session : movie.getSessions()) {
            Calendar day = Calendar.getInstance();
            day.setTime(session.getDatetime());
            Calendar newDay = Calendar.getInstance();
            newDay.set(day.get(Calendar.YEAR), day.get(Calendar.MONTH), day.get(Calendar.DATE));
            days.add(newDay);
        }

        Calendar minDay = null;
        for (Calendar day : days) {
            if (minDay == null || day.before(minDay))
                minDay = day;
        }

        return Day.getDays(minDay.before(DateHelper.getFakeDate()) ? DateHelper.getFakeDate() : minDay, days.size());
    }

    public List<Seat> getBusySeatsBySession(Session session) {
        return seatDao.getBusySeatsBySession(session);
    }

    @Autowired
    public void setHallDao(HallDao hallDao) {this.hallDao = hallDao;}

    @Autowired
    public void setSessionDao(SessionDao sessionDao) {this.sessionDao = sessionDao;}

    @Autowired
    public void setSeatDao(SeatDao seatDao) {
        this.seatDao = seatDao;
    }

    @Autowired
    public void setMovieService(MovieService movieService) {
        this.movieService = movieService;
    }
}
