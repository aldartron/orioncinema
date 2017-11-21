package orioncinema.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import orioncinema.entity.Movie;
import orioncinema.service.ScheduleService;
import orioncinema.util.DateHelper;

import java.util.Collections;
import java.util.Date;
import java.util.List;

@Transactional
@Repository
public class MovieDaoImpl implements MovieDao {

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public Movie getMovieById(int id) {
        return (Movie) getSession().get(Movie.class, id);
    }

    public Movie getMovieByName(String name) {
        Query query = getSession().createQuery("from Movie where placard_name = :name");
        query.setParameter("name", name);
        return (Movie) query.uniqueResult();
    }

    public List<Movie> getMoviesByDate(Date date) {
        Query query = getSession().createQuery("from Movie where endDate >= :date and startDate <= :date order by startDate");
        query.setParameter("date", date);
        return query.list();
    }

    public List<Movie> getAllMovies() {
        return getSession()
                .createQuery("from Movie where endDate > :date order by startDate")
                .setParameter("date", DateHelper.getFakeDate().getTime()).list();
    }
}
