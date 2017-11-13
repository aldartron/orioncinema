package orioncinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import orioncinema.dao.HallDao;
import orioncinema.dao.MovieDao;
import orioncinema.dao.SessionDao;
import orioncinema.entity.Hall;
import orioncinema.entity.Movie;
import orioncinema.entity.Session;
import orioncinema.util.Day;

import java.util.*;


@Service
public class ScheduleService {

    private HallDao hallDao;
    private SessionDao sessionDao;

    public Calendar getFakeDate() {
        Calendar now = Calendar.getInstance();
        now.set(2017, Calendar.OCTOBER, 27, 20, 0);
        return now;
    }

    // Дни для липучего заголовка
    public List<Day> getDaysSequence() {
        final int dayCount = 7;

        // fake date
        return Day.getDays(getFakeDate(), dayCount);
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

        return Day.getDays(minDay.before(getFakeDate()) ? getFakeDate() : minDay, days.size());
    }

    @Autowired
    public void setHallDao(HallDao hallDao) {this.hallDao = hallDao;}

    @Autowired
    public void setSessionDao(SessionDao sessionDao) {this.sessionDao = sessionDao;}
}
