package orioncinema.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import orioncinema.entity.Hall;

import java.util.List;

@Transactional
@Repository
public class HallDaoImpl implements HallDao {

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Hall> getAllHalls() {
        return sessionFactory.getCurrentSession().createQuery("from Hall").list();
    }
}
