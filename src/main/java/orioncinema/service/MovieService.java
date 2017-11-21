package orioncinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import orioncinema.dao.MovieDao;
import orioncinema.entity.Movie;

import java.util.Date;
import java.util.List;

@Service
public class MovieService {

    private MovieDao movieDao;

    @Autowired
    public void setMovieDao(MovieDao movieDao) {
        this.movieDao = movieDao;
    }

    // Movie by placard name
    public Movie getMovieByName(String name) {
        return movieDao.getMovieByName(name);
    }

    public List<Movie> getMoviesByDate(Date date) {
        if (date == null) {
            return movieDao.getAllMovies();
        } else return movieDao.getMoviesByDate(date);
    }

}
