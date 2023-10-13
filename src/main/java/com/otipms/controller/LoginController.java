package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	@RequestMapping("/")
	public String login() {
		log.info("dd");
		return "login";
	}
}
