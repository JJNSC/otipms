package com.otipms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.otipms.dao.BoardDao;
import com.otipms.dto.Board;
import com.otipms.dto.BoardComment;
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
	public int getTotalBoardNum(String boardType, String inquiryType, String searchType, String searchKeyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardType", boardType);
		map.put("inquiryBoardType", inquiryType);
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		int totalBoardNum = boardDao.countBoard(map);
		return totalBoardNum;
	}

	//페이저로 페이징된 게시글 목록 조회
	@Override
	public List<Board> getBoardList(Pager boardPager, String boardType, String inquiryType, String searchType,
									String searchKeyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardPager", boardPager);
		map.put("boardType", boardType);
		map.put("inquiryBoardType", inquiryType);
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
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

	//댓글 작성
	@Override
	public void writeComment(BoardComment boardComment) {
		boardDao.insertBoardComment(boardComment);
		boardDao.minusBoardHitcount(boardComment.getBoardNo());
	}

	//댓글 조회
	@Override
	public List<BoardComment> boardCommentList(String boardNo) {
		return boardDao.selectBoardComment(Integer.parseInt(boardNo));
	}

	//게시글 삭제
	@Override
	public void deleteBoard(String boardNo) {
		boardDao.updateBoardDeleted(Integer.parseInt(boardNo));
	}

	//댓글 삭제
	@Override
	public void deleteBoardComment(String commentNo) {
		boardDao.updateBoardCommentDeleted(Integer.parseInt(commentNo));
	}

	//게시글 수정
	@Override
	public void modifyBoard(Board board) {
		boardDao.updateBoard(board);
	}
	
}
