package com.cocopmss.web;

import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootConfiguration
@RestController
public class HomeController {
	@GetMapping("/")
	public String hello() {
		return "헬로 인텔리제이!!";
	}
}