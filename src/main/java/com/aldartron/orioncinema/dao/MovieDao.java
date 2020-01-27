package com.aldartron.orioncinema.dao;

import com.aldartron.orioncinema.entity.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface MovieDao extends JpaRepository<Movie, Long> {

    Movie findByPlacardName(String placardName);

    @Query("from Movie where endDate >= :date and startDate <= :date order by startDate")
    List<Movie> findByDate(Date date);

}
