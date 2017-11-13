package orioncinema.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import orioncinema.entity.Ticket;

import java.util.List;

@Repository
public class TicketDaoImpl implements TicketDao {

    private SessionFactory sessionFactory;

    public Ticket getTicketById(int id) {
        return getSession().get(Ticket.class, id);
    }

    public List<Ticket> getTicketsBySession(orioncinema.entity.Session session) {
        Query query = getSession().createQuery("from Ticket where session.id = :sessionId");
        query.setParameter("hallId", session.getId());
        return query.list();
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
