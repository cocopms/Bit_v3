package com.domainname.web.mappers;

import com.domainname.web.domains.PlayerDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlayerMapper {
    List<PlayerDTO> selectAll();
}