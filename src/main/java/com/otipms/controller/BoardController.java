package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.otipms.interceptor.Login;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
	
	@Login
	@RequestMapping("/blank")
	public String blank() {
		log.info("빈페이지");
		return "blank";
	}
	
	@Login
	@RequestMapping("/infoBoard")
	public String infoBoard(String boardType, Model model) {
		log.info("공지사항게시판");
		model.addAttribute("boardType", "공지사항");
		return "board/boardList";
	}
	
	@Login
	@RequestMapping("/inquiryBoard")
	public String inquiryBoard(String boardType, Model model) {
		log.info("질의 게시판");
		model.addAttribute("boardType", "질의 게시판");
		return "board/boardList";
	}
	
	@Login
	@RequestMapping("/libertyBoard")
	public String libertyBoard(String boardType, Model model) {
		log.info("자유 게시판");
		model.addAttribute("boardType", "자유 게시판");
		return "board/boardList";
	}
	
	@Login
	@RequestMapping("/teamBoard")
	public String teamBoard(String boardType, Model model) {
		log.info("팀 게시판");
		model.addAttribute("boardType", "팀 게시판");
		return "board/boardList";
	}
	
	@Login
	@RequestMapping("/writeBoard")
	public String writeBoard(String boardType, Model model) {
		log.info("글쓰기 게시판 타입: " + boardType);
		model.addAttribute("boardType", boardType);
		log.info("글쓰기");
		return "board/writeBoard";
	}
	
	@Login
	@RequestMapping("/detailBoard")
	public String detailBoard(String boardType, Model model) {
		log.info("상세글");
		model.addAttribute("boardType", boardType);
		return "board/detailBoard";
	}
	
	@Login
	@RequestMapping("/writeBoardRef")
	public String writeBoardRef() {
		log.info("글쓰기");
		return "board/writeBoard_R";
	}
}
