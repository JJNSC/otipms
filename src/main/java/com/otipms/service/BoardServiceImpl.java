package com.otipms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		log.info("아니 대체 DAO에서 inquiryBoardType이 뭐길래 전체로만 떠서 걸러지는 거야 뭐야" + inquiryType);
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

	//게시글 조회
	@Transactional
	@Override
	public Board detailBoard(String boardNo) {
		Board board = boardDao.selectBoard(Integer.parseInt(boardNo));
		if(board != null) {
			boardDao.updateBoardHitcount(Integer.parseInt(boardNo));
			return board;
		}
		return null;
	}
	
}
