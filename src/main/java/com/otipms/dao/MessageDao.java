package com.otipms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Message;

@Mapper
public interface MessageDao {
	public List<Message> selectMyReceivedMessage(int empId);
	public List<Message> selectMySentMessage(int empId);
	public List<Message> selectMyImportantMessage(int empId);
	public List<Message> selectMyTemporaryMessage(int empId);
	public List<Message> selectMyTrashMessage(int empId);
	public Message selectMessagebyMessageNo(int messageNo);
	public void updateImportantMessage(Message message);
	public void updateTrashMessage(Message message);
}
