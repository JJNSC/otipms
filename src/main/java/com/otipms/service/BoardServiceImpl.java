package com.otipms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.BoardDao;
import com.otipms.dto.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	public BoardDao boardDao;

	@Override
	public void writeBoard(Board board) {
		// TODO Auto-generated method stub
		boardDao.insertBoard(board);
		System.out.println(board.getBoardNo());
	}
	
}
