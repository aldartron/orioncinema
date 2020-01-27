package com.aldartron.orioncinema;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories
@SpringBootApplication
public class OrionCinemaApplication {

    public static void main(String[] args) {
        SpringApplication.run(OrionCinemaApplication.class, args);
    }

}
