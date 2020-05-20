package com.cocopm.web.services;

import com.cocopm.web.domains.PlayerDTO;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface PlayerService {
    List<PlayerDTO> retrieve();
}
