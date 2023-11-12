package com.otipms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.otipms.dao.BoardDao;
import com.otipms.dto.Board;
import com.otipms.dto.BoardComment;
import com.otipms.dto.Employee;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Pager;
import com.otipms.dto.Team;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	public BoardDao boardDao;

	//게시글 작성
	@Override
	public int writeBoard(Board board) {
		boardDao.insertBoard(board);
		return boardDao.selectBoardNoInserted();
	}

	//게시판 유형 별 게시글 목록 수 조회
	@Override
	public int getTotalBoardNum(String boardType, String inquiryType, int teamNo, String searchType, String searchKeyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardType", boardType);
		map.put("inquiryBoardType", inquiryType);
		map.put("teamNo", teamNo);
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		int totalBoardNum = boardDao.countBoard(map);
		return totalBoardNum;
	}

	//페이저로 페이징된 게시글 목록 조회
	@Override
	public List<Board> getBoardList(Pager boardPager, String boardType, String inquiryType, int teamNo, String searchType,
									String searchKeyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardPager", boardPager);
		map.put("boardType", boardType);
		map.put("inquiryBoardType", inquiryType);
		map.put("teamNo", teamNo);
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		List<Board> boardList = boardDao.selectBoardByPage(map);
		for(Board board : boardList) {
			board.setCommentCount(boardDao.countBoardComment(board.getBoardNo()));
			List<MediaFile> mediaFiles = boardDao.selectBoardMediaFile(board.getBoardNo());
			if(mediaFiles.size() != 0) {
				board.setMediaFileName("첨부파일 있음");
			}
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

	//로그인한 회원 아이디로 팀 이름 가져오기
	@Override
	public Team getTeamName(int empId) {
		return boardDao.selectTeamName(empId);
	}

	//게시글 작성 시 파일 저장
	@Override
	public void addBoardMediaFile(MediaFile mediaFile) {
		boardDao.addBoardMediaFile(mediaFile);
	}

	//게시글 수정 시 파일 삭제
	@Override
	public void deleteBoardMediaFile(MediaFile mediaFile) {
		boardDao.deleteBoardMediaFile(mediaFile);
	}
	
	//게시글 파일 조회
	@Override
	public List<MediaFile> getBoardMediaList(String boardNo) {
		return boardDao.selectBoardMediaFile(Integer.parseInt(boardNo));
	}

	//게시글 작성자 정보 조회
	@Override
	public Employee getBoardWriterInfo(int empId) {
		return boardDao.selectBoardWriterInfo(empId);
	}
	
}
