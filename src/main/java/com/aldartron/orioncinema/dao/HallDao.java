package com.aldartron.orioncinema.dao;

import com.aldartron.orioncinema.entity.Hall;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HallDao extends JpaRepository<Hall, Long> {}
