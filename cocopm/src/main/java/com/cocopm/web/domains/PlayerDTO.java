package com.cocopm.web.domains;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class PlayerDTO {
    public String playerId,playerName, teamId, ePlayerName, nickname, joinYyyy, position, backNo, nation, birthDate, solar, height, weight;
}