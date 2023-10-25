package com.otipms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Message;

@Mapper
public interface MessageDao {
	public List<Message> selectMyReceivedMessage(int empId);
}
