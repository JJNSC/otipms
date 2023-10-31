package com.otipms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Board;
import com.otipms.dto.BoardComment;

@Mapper
public interface BoardDao {
	/**
	 * 새 게시글 삽입
	 * @param board
	 */
	public void insertBoard(Board board);

	/**
	 * 게시판 별 게시글 총 개수 조회
	 * @param map
	 * @return
	 */
	public int countBoard(Map<String, Object> map);

	/**
	 * 페이저로 게시글 목록 조회
	 * @param map
	 * @return
	 */
	public List<Board> selectBoardByPage(Map<String, Object> map);
	
	/**
	 * 게시글 댓글 수 조회
	 * @param boardNo
	 * @return
	 */
	public int countBoardComment(int boardNo);

	/**
	 * 게시글 조회
	 * @param boardNo
	 * @return
	 */
	public Board selectBoard(int boardNo);

	/**
	 * 조회수 갱신
	 * @param boardNo
	 */
	public int updateBoardHitcount(int boardNo);
	public int minusBoardHitcount(int boardNo);

	/**
	 * 새 댓글 삽입
	 * @param boardComment
	 */
	public void insertBoardComment(BoardComment boardComment);

	/**
	 * 댓글 조회
	 * @param boardNo
	 * @return
	 */
	public List<BoardComment> selectBoardComment(int boardNo);
}
