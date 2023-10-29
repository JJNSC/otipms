package com.otipms.service;

import java.util.List;

import com.otipms.dto.Board;
import com.otipms.dto.Pager;

/**
 * 
 * @author 이은지
 *
 */
public interface BoardService {
	/**
	 * 게시글 작성
	 * @param board
	 */
	public void writeBoard(Board board);

	/**
	 * 게시판 유형별 총 게시글 목록 수 조회
	 * @param boardType
	 * @param inquiryType
	 * @return
	 */
	public int getTotalBoardNum(String boardType, String inquiryType);

	/**
	 * 페이징 처리된 게시글 목록 조회
	 * @param boardPager
	 * @return
	 */
	public List<Board> getBoardList(Pager boardPager, String boardType, String inquiryType);
}
