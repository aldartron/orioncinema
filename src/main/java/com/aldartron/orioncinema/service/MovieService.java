package com.aldartron.orioncinema.service;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import com.aldartron.orioncinema.dao.MovieDao;
import com.aldartron.orioncinema.entity.Movie;

import java.util.Date;
import java.util.List;

@AllArgsConstructor
@Service
public class MovieService {

    private MovieDao movieDao;

    // Movie by placard name
    public Movie getMovieByName(String name) {
        return movieDao.findByPlacardName(name);
    }

    public List<Movie> getMoviesByDate(Date date) {
        if (date == null) {
            return movieDao.findAll();
        } else return movieDao.findByDate(date);
    }

}
