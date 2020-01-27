package com.aldartron.orioncinema.entity;

import com.aldartron.orioncinema.util.DateHelper;
import lombok.Data;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@Entity
@Table(name = "sessions")
public class MovieSession {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column private long id;
    @Column private Date datetime;
    @Column(name = "common_cost") private int commonCost;
    @Column(name = "vip_cost") private int vipCost;

    @ManyToOne
    @JoinColumn(name = "movie_id")
    private Movie movie;

    @ManyToOne
    @JoinColumn(name = "hall_id")
    private Hall hall;

    public String getNiceTime() {
        return new SimpleDateFormat("HH:mm").format(datetime);
    }

    public String getNiceDate() {
        return DateHelper.getNiceDate(datetime);
    }

}
