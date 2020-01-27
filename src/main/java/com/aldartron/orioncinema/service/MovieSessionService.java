package com.aldartron.orioncinema.service;

import com.aldartron.orioncinema.entity.MovieSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aldartron.orioncinema.dao.MovieSessionDao;

@AllArgsConstructor
@Service
public class MovieSessionService {

    private MovieSessionDao movieSessionDao;

    public MovieSession getSessionById(long id) {
        return movieSessionDao.findById(id);
    }

}
