package com.otipms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Board;

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
}