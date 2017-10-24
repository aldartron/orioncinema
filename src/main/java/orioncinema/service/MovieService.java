package orioncinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import orioncinema.dao.MovieDao;
import orioncinema.entity.Movie;

import java.util.List;

@Component
@Service
public class MovieService {

    private MovieDao movieDao;

    @Autowired
    public void setMovieDao(MovieDao movieDao) {
        this.movieDao = movieDao;
    }

    public List<Movie> getAllMovies() {
        return movieDao.getMovies();
    }

}
