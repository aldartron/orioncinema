package orioncinema.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import orioncinema.entity.Hall;
import orioncinema.entity.Seat;

import java.util.List;

@Transactional
@Repository
public class SeatDaoImpl implements  SeatDao {

    private SessionFactory sessionFactory;

    public List<Seat> getSeatsByHallAndRow(Hall hall, int row) {
        Query query = getSession().createQuery("from Seat where hall.id = :hallId and row = :row order by col");
        query.setParameter("hallId", hall.getId());
        query.setParameter("row", row);
        return query.list();
    }

    public List<Seat> getBusySeatsBySession(orioncinema.entity.Session session) {
        Query query = getSession().createQuery(
                "select ticket.seat from Ticket ticket where ticket.session.id = :sessionId"
        );
        query.setParameter("sessionId", session.getId());
        return query.list();
    }

    public Seat getSeatById(long seatId) {
        return getSession().get(Seat.class, seatId);
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
}
