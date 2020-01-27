package com.aldartron.orioncinema.dao;

import com.aldartron.orioncinema.entity.Movie;
import com.aldartron.orioncinema.entity.MovieSession;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MovieSessionDao extends JpaRepository<MovieSession, Long> {

    MovieSession findById(long id);

    @Query("from MovieSession where movie = :movie and cast(datetime as string) like :dateWithPercent order by datetime")
    List<MovieSession> findAllByMovieAndDatetime(
            Movie movie,
            String dateWithPercent
    );

    MovieSession findTopByOrderByDatetimeDesc();

}
