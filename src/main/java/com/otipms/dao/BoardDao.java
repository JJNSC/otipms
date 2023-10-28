package com.otipms.dao;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Board;

@Mapper
public interface BoardDao {
	public void insertBoard(Board board);
}
