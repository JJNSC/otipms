package com.otipms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Board;
import com.otipms.dto.BoardComment;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Team;

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

	/**
	 * 게시글 삭제로 갱신
	 * @param boardNo
	 */
	public void updateBoardDeleted(int boardNo);

	/**
	 * 댓글 삭제로 갱신
	 * @param commentNo
	 */
	public void updateBoardCommentDeleted(int commentNo);

	/**
	 * 기존 게시글 갱신
	 * @param board
	 */
	public void updateBoard(Board board);

	/**
	 * 사원 번호로 팀이름 조회
	 * @param empId
	 * @return
	 */
	public Team selectTeamName(int empId);
	
	/**
	 * 팀 게시판 추가
	 * @param teamNo
	 */
	public void insertTeamBoardType(int teamNo);

	/**
	 * 게시글 작성 시 파일 추가
	 * @param mediaFile
	 */
	public void addBoardMediaFile(MediaFile mediaFile);

	/**
	 * 게시글 수정 시 파일 수정
	 * @param mediaFile
	 */
	public void deleteBoardMediaFile(MediaFile mediaFile);
	
	/**
	 * 게시글 파일 조회
	 * @param boardNo
	 * @return
	 */
	public List<MediaFile> selectBoardMediaFile(int boardNo);
	
	/**
	 * 추가된 게시글 번호 조회
	 * @return
	 */
	public int selectBoardNoInserted();
	//최초 게시판 종류 등록
	public void insertInitialBoardType(Board board);
	
}
