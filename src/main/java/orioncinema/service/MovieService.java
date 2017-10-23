package orioncinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import orioncinema.dao.MovieDaoImpl;
import orioncinema.entitiy.Movie;

import java.util.List;

@Component
@Service
public class MovieService {

    private MovieDaoImpl movieDao;

    @Autowired
    public void setMovieDao(MovieDaoImpl movieDao) {
        this.movieDao = movieDao;
    }

    public List<Movie> getAllMovies() {
        return movieDao.getMovies();
    }

}
