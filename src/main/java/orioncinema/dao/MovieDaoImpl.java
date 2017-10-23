package orioncinema.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import orioncinema.entitiy.Movie;

import java.util.List;

@Repository
public class MovieDaoImpl implements MovieDao {

    private SessionFactory sessionFactory;

    private Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public Movie getMovieById(int id) {
        return getSession().get(Movie.class, id);
    }

    public List<Movie> getMovies() {
        List<Movie> movies = getSession().createQuery("from Movie").list();
        return movies;
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
