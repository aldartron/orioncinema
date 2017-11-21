package orioncinema.dao;

import orioncinema.entity.Hall;
import orioncinema.entity.Seat;
import orioncinema.entity.Session;

import java.util.List;

public interface SeatDao {

    List<Seat> getSeatsByHallAndRow(Hall hall, int row);

    List<Seat> getBusySeatsBySession(Session session);

    Seat getSeatById(long seatId);
}
