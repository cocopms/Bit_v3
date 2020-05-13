package com.cocopm.web.domains;

import lombok.Data;

@Data
public class ScheduleDTO {
    private String stadiumId;
    private String scheDate;
    private String gubun;
    private String hometeamId;
    private String awayteamId;
    private String homeScore;
    private String awayScore;
}