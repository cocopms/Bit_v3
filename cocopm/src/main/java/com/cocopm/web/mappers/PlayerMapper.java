package com.cocopm.web.mappers;

import com.cocopm.web.domains.PlayerDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlayerMapper {
    List<PlayerDTO> selectAll();
}
