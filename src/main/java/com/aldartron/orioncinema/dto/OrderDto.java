package com.aldartron.orioncinema.dto;

import lombok.Data;

@Data
public class OrderDto {

    private int sessionId;
    private int[] seats;

}
