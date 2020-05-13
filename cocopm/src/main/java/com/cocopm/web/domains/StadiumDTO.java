package com.cocopm.web.domains;

import lombok.Data;

@Data
public class StadiumDTO {
    private String stadiumId;
    private String stadiumName;
    private String hometeamId;
    private int seatCount;
    private String address;
    private String ddd;
    private String tel;
}