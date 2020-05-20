package com.cocopm.web.controllers;
import com.cocopm.web.domains.PlayerDTO;
import com.cocopm.web.services.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins="*", allowedHeaders = "*") //연결
@RestController
@RequestMapping("/players")
public class PlayerController {
    @Autowired PlayerService playerService;
    @Autowired PlayerDTO player;
    @GetMapping("")
    public List<PlayerDTO> list(){
        return playerService.retrieve();
    }
    @PostMapping("/{playerId}/access")
    public PlayerDTO login(
            @PathVariable String  playerId,
            @RequestBody PlayerDTO player
    ){
        System.out.println("뷰와 연결이 성공 !!! 아이디는 "+ playerId);
        System.out.println("뷰와 연결이 성공 !!! 비밀번호는 "+ params.getBackNo());
        return player;
    }
}