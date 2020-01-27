package com.aldartron.orioncinema.service;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.aldartron.orioncinema.dao.SeatDao;
import com.aldartron.orioncinema.dao.MovieSessionDao;
import com.aldartron.orioncinema.dao.TicketDao;
import com.aldartron.orioncinema.entity.Seat;
import com.aldartron.orioncinema.entity.MovieSession;
import com.aldartron.orioncinema.entity.Ticket;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@Service
public class TicketService {

    private TicketDao ticketDao;
    private SeatDao seatDao;
    private MovieSessionDao movieSessionDao;

    public List<List<Ticket>> getTicketGridBySession(MovieSession movieSession) {
        var grid = new ArrayList<List<Ticket>>();

        for(int i = 1; i <= movieSession.getHall().getRowNumber(); i++) {
            var seatRow = seatDao.findAllByHallAndRow(movieSession.getHall(), i);
            var ticketRow = new ArrayList<Ticket>();
            for (var seat : seatRow) {
                ticketRow.add(new Ticket(movieSession, seat));
            }
            grid.add(ticketRow);
        }

        return grid;
    }

    private void saveTicket(int seatId, int sessionId) {
        var ticket = new Ticket(movieSessionDao.findById(sessionId), seatDao.findById(seatId));
        ticketDao.save(ticket);
    }

    @Transactional
    public void buyTickets(int sessionId, int[] seats) {
        for (int seatId : seats) {
            saveTicket(seatId, sessionId);
        }
    }

}
