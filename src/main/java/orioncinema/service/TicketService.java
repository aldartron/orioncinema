package orioncinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import orioncinema.dao.SeatDao;
import orioncinema.dao.TicketDao;
import orioncinema.entity.Seat;
import orioncinema.entity.Session;
import orioncinema.entity.Ticket;

import java.util.ArrayList;
import java.util.List;

@Service
public class TicketService {

    private TicketDao ticketDao;
    private SeatDao seatDao;

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

    @Autowired
    public void setTicketDao(TicketDao ticketDao) {
        this.ticketDao = ticketDao;
    }

    @Autowired
    public void setSeatDao(SeatDao seatDao) {
        this.seatDao = seatDao;
    }
}
