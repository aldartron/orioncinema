package orioncinema.dao;

import orioncinema.entity.Movie;

import java.util.List;

public interface MovieDao {

    public Movie getMovieById(int id);
    public List<Movie> getMovies();

}
