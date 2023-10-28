package com.otipms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.otipms.dto.Board;
import com.otipms.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
	public String boardType;

	@Autowired
	public BoardService boardService;
	
	@RequestMapping("/blank")
	public String blank() {
		log.info("빈페이지");
		return "blank";
	}
	
	@RequestMapping("/infoBoard")
	public String infoBoard(Model model) {
		log.info("공지사항게시판");
		model.addAttribute("boardType", "공지사항");
		this.boardType = "공지사항";

		model.addAttribute("employee", LoginController.loginEmployee);
		return "board/boardList";
	}
	
	@RequestMapping("/inquiryBoard")
	public String inquiryBoard(String boardType, Model model) {
		log.info("질의 게시판");
		this.boardType = boardType;
		model.addAttribute("boardType", "질의 게시판");

		model.addAttribute("employee", LoginController.loginEmployee);
		return "board/boardList";
	}
	
	@RequestMapping("/libertyBoard")
	public String libertyBoard(String boardType, Model model) {
		log.info("자유 게시판");
		this.boardType = boardType;
		model.addAttribute("boardType", "자유 게시판");
		
		model.addAttribute("employee", LoginController.loginEmployee);
		
		return "board/boardList";
	}
	
	@RequestMapping("/teamBoard")
	public String teamBoard(String boardType, Model model) {
		log.info("팀 게시판");
		this.boardType = boardType;
		model.addAttribute("boardType", "팀 게시판");
		
		model.addAttribute("employee", LoginController.loginEmployee);
		
		return "board/boardList";
	}
	
	@RequestMapping("/writeBoard")
	public String writeBoard(String boardType, Model model) {
		log.info("글쓰기");
		log.info("글쓰기 게시판 타입: " + boardType);
		model.addAttribute("boardType", boardType);
		model.addAttribute("employee", LoginController.loginEmployee);
		return "board/writeBoard";
	}
	
	@RequestMapping("/submitBoard") 
	public String submitBoard(String boardTitle, String myEditor) {
		log.info("에디터 제목: " + boardTitle);
		log.info("에디터 내용: " + myEditor);
		log.info("에디터 내용: " + myEditor.toString());
		
		Board board = new Board();
		board.setBoardTitle(boardTitle);
		board.setBoardContent(myEditor);
		board.setBoardTypeName(boardType);
		
		boardService.writeBoard(board);
		return "board/boardList";
	}
	
	@RequestMapping("/detailBoard")
	public String detailBoard(String boardType, Model model) {
		log.info("상세글");
		model.addAttribute("boardType", boardType);
		model.addAttribute("employee", LoginController.loginEmployee);
		return "board/detailBoard";
	}

}
