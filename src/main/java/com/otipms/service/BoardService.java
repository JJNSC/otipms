package com.otipms.service;

import java.util.List;

import com.otipms.dto.Board;
import com.otipms.dto.BoardComment;
import com.otipms.dto.Pager;
import com.otipms.dto.Team;

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
	 * 페이징이 필요한 게시글 총 수
	 * @param boardType
	 * @param inquiryType
	 * @param teamNo
	 * @param searchType
	 * @param searchKeyword
	 * @return
	 */
	public int getTotalBoardNum(String boardType, String inquiryType, int teamNo, String searchType, String searchKeyword);

	/**
	 * 페이징 처리된 게시글 목록 조회
	 * @param boardPager
	 * @param boardType
	 * @param inquiryType
	 * @param teamNo
	 * @param searchType
	 * @param searchKeyword
	 * @return
	 */
	public List<Board> getBoardList(Pager boardPager, String boardType, String inquiryType, int teamNo, String searchType, String searchKeyword);

	/**
	 * 게시글 조회
	 * @param boardNo
	 * @return
	 */
	public Board detailBoard(String boardNo);

	/**
	 * 댓글 작성
	 * @param boardComment
	 */
	public void writeComment(BoardComment boardComment);

	/**
	 * 댓글 조회
	 * @param boardNo
	 * @return
	 */
	public List<BoardComment> boardCommentList(String boardNo);

	/**
	 * 게시글 삭제
	 * @param boardNo
	 */
	public void deleteBoard(String boardNo);

	/**
	 * 댓글 삭제
	 * @param commentNo
	 */
	public void deleteBoardComment(String commentNo);

	/**
	 * 게시글 수정
	 * @param board
	 */
	public void modifyBoard(Board board);

	/**
	 * 로그인한 회원 아이디로 팀 이름 가져오기
	 * @param empId
	 * @return
	 */
	public Team getTeamName(int empId);
}
