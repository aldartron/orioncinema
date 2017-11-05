package orioncinema.dao;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import orioncinema.entity.Movie;
import orioncinema.entity.Session;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Transactional
@Repository
public class SessionDaoImpl implements SessionDao {

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private org.hibernate.Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }


    public List<Session> getSessionsByMovie(Movie movie) {
        Query query = getSession().createQuery("from Session where movie.id = :movieId order by datetime");
        query.setParameter("movieId", movie.getId());
        return query.list();
    }

    public List<Session> getSessionsByMovieAndDate(Movie movie, Date date) {
        Query query = getSession().createQuery("from Session where movie.id = :movieId and cast(datetime as string) like :datetime order by datetime");
        query.setParameter("movieId", movie.getId());
        query.setParameter("datetime", dateFormat.format(date) + "%");
        return query.list();
    }
}
