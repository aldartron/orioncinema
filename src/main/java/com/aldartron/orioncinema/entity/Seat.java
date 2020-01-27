package com.aldartron.orioncinema.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "seats")
public class Seat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column private long id;
    @ManyToOne
    @JoinColumn(name = "hall_id") private Hall hall;
    @Column(name = "row_num") private int row;
    @Column(name = "col_num") private int col;
    @Column(name = "is_vip") private boolean isVip;

}
