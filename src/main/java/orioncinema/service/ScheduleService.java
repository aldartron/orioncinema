package orioncinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import orioncinema.dao.MovieDao;
import orioncinema.util.Day;

import java.util.List;


@Service
public class ScheduleService {

    private MovieDao movieDao;

    // Дни для липучего заголовка
    public List<Day> getDaysSequence() {
        final int dayCount = 7;
        return Day.getDays(dayCount);
    }

    @Autowired
    public void setMovieDao(MovieDao movieDao) {
        this.movieDao = movieDao;
    }
}
