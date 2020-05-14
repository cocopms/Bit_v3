package com.domainname.web.services;

import com.domainname.web.domains.PlayerDTO;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface PlayerService {
    List<PlayerDTO> retrieveAll();
}
