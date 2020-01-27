package com.aldartron.orioncinema.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "halls")
public class Hall {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column private long id;
    @Column private String name;
    @Column(name = "rows") private int rowNumber;
    @Column(name = "cols") private int colNumber;

    @OneToMany(mappedBy = "hall")
    private List<MovieSession> sessions = new ArrayList<MovieSession>();

    @OneToMany(mappedBy = "hall", fetch = FetchType.EAGER)
    private List<Seat> seats = new ArrayList<Seat>();

}
