package orioncinema.dao;

import orioncinema.entity.Hall;
import orioncinema.entity.Seat;

import java.util.List;

public interface SeatDao {

    List<Seat> getSeatsByHallAndRow(Hall hall, int row);

}
