package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.otipms.interceptor.Login;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {
	@Login
	@RequestMapping("/chat")
	public String chat() {
		log.info("dd");
		return "chat/chat";
	}
}
