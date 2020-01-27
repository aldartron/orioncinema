package com.aldartron.orioncinema.dao;

import com.aldartron.orioncinema.entity.Hall;
import com.aldartron.orioncinema.entity.Seat;
import com.aldartron.orioncinema.entity.MovieSession;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SeatDao extends JpaRepository<Seat, Long> {

    List<Seat> findAllByHallAndRow(Hall hall, int row);

    @Query("select ticket.seat from Ticket ticket where ticket.movieSession = :movieSession")
    List<Seat> findAllBySessionAndBusy(MovieSession movieSession);

    Seat findById(long seatId);

}
