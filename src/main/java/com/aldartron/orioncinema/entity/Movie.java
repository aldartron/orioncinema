package com.aldartron.orioncinema.entity;

import com.aldartron.orioncinema.util.DateHelper;
import lombok.Data;

import javax.persistence.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "movies")
public class Movie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String title;
    private String annotation;
    @Column(name = "placard_name") private String placardName;
    @Column(name = "trailer_link") private String trailerLink;
    @Column(name = "start") private Date startDate;
    @Column(name = "end") private Date endDate;
    private String cast;
    private String director;
    private String genre;
    private int duration;
    private int age;
    private String country;
    private String year;
    @Column(name = "original_title") private String originalTitle;
    @Column(name = "is_high") private boolean isHigh;
    @Column(name = "kinopoisk_name") private String kinopoiskName;
    @OneToMany(mappedBy = "movie", fetch = FetchType.EAGER) private List<MovieSession> sessions = new ArrayList<>();

    public String getNiceStartDate() {
        return DateHelper.getNiceDate(startDate);
    }

    public String getNiceEndDate() {
        return DateHelper.getNiceDate(endDate);
    }

}
