package com.cocopm.web.serviceimpls;

import com.cocopm.web.domains.PlayerDTO;
import com.cocopm.web.mappers.PlayerMapper;
import com.cocopm.web.services.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlayerServiceImpl implements PlayerService {
    @Autowired
    PlayerMapper playerMapper;
    @Override
    public List<PlayerDTO> retrieve() {
        return playerMapper.selectAll();
    }
}
