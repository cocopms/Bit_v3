package com.cocopm.web.mappers;

import com.cocopm.web.domains.PlayerDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository //impl 안만들고 이걸로 대신 = POJO
public interface PlayerMapper {
    public List<PlayerDTO> selectAll();
}