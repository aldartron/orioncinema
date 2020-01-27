package com.aldartron.orioncinema.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "tickets")
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column private long id;

    @ManyToOne
    @JoinColumn(name = "session_id")
    private MovieSession movieSession;

    @ManyToOne
    @JoinColumn(name = "seat_id")
    private Seat seat;

    public Ticket(MovieSession movieSession, Seat seat) {
        this.movieSession = movieSession;
        this.seat = seat;
    }

}
