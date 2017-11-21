package orioncinema.dao;

import orioncinema.entity.Movie;

import java.util.Date;
import java.util.List;

public interface MovieDao {

    Movie getMovieById(int id);
    Movie getMovieByName(String name);
    List<Movie> getAllMovies();
    List<Movie> getMoviesByDate(Date date);
}
