package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class InfoBoardController {
	
	@RequestMapping("/infoBoard")
	public String infoBoard() {
		log.info("공지사항게시판");
		return "board";
	}
}
