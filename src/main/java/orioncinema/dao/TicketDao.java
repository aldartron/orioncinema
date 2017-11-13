package orioncinema.dao;

import orioncinema.entity.Session;
import orioncinema.entity.Ticket;

import java.util.List;

public interface TicketDao {

    Ticket getTicketById(int id);

    List<Ticket> getTicketsBySession(Session session);

}
