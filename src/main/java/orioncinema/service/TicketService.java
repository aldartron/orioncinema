package orioncinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import orioncinema.dao.SeatDao;
import orioncinema.dao.SessionDao;
import orioncinema.dao.TicketDao;
import orioncinema.entity.Seat;
import orioncinema.entity.Session;
import orioncinema.entity.Ticket;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
public class TicketService {

    private TicketDao ticketDao;
    private SeatDao seatDao;
    private SessionDao sessionDao;

    public List<List<Ticket>> getTicketGridBySession(Session session) {
        List<List<Ticket>> grid = new ArrayList<List<Ticket>>();

        for(int i = 1; i <= session.getHall().getRowNumber(); i++) {
            List<Seat> seatRow = seatDao.getSeatsByHallAndRow(session.getHall(), i);
            List<Ticket> ticketRow = new ArrayList<Ticket>();
            for (Seat seat : seatRow) {
                ticketRow.add(new Ticket(session, seat));
            }
            grid.add(ticketRow);
        }

        return grid;
    }

    private void saveTicket(int seatId, int sessionId) {
        Ticket ticket = new Ticket(sessionDao.getSessionById(sessionId), seatDao.getSeatById(seatId));
        ticketDao.saveTicket(ticket);
    }

    @Transactional
    public void buyTickets(int sessionId, int[] seats) {
        for (int seatId : seats) {
            saveTicket(seatId, sessionId);
        }
    }

    @Autowired
    public void setTicketDao(TicketDao ticketDao) {
        this.ticketDao = ticketDao;
    }

    @Autowired
    public void setSeatDao(SeatDao seatDao) {
        this.seatDao = seatDao;
    }

    @Autowired
    public void setSessionDao(SessionDao sessionDao) {
        this.sessionDao = sessionDao;
    }

}
