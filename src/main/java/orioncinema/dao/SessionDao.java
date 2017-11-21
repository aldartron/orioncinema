package orioncinema.dao;

import orioncinema.entity.Movie;
import orioncinema.entity.Session;

import java.util.Date;
import java.util.List;

public interface SessionDao {

    Session getSessionById(long id);

    List<Session> getSessionsByMovie(Movie movie);

    List<Session> getSessionsByMovieAndDate(Movie movie, Date date);

    Session getLastSession();

}
