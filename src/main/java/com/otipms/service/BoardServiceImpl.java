package com.otipms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.BoardDao;
import com.otipms.dto.Board;
import com.otipms.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	public BoardDao boardDao;

	//게시글 작성
	@Override
	public void writeBoard(Board board) {
		boardDao.insertBoard(board);
	}

	//게시판 유형 별 게시글 목록 수 조회
	@Override
	public int getTotalBoardNum(String boardType, String inquiryType) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardType", boardType);
		map.put("inquiryBoardType", inquiryType);
		int totalBoardNum = boardDao.countBoard(map);
		return totalBoardNum;
	}

	//페이저로 페이징된 게시글 목록 조회
	@Override
	public List<Board> getBoardList(Pager boardPager, String boardType, String inquiryType) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardPager", boardPager);
		map.put("boardType", boardType);
		map.put("inquiryBoardType", inquiryType);
		List<Board> boardList = boardDao.selectBoardByPage(map);
		for(Board board : boardList) {
			board.setCommentCount(boardDao.countBoardComment(board.getBoardNo()));
		}
		return boardList;
	}
	
}
