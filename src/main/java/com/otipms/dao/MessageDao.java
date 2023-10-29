package com.otipms.dao;

import java.util.List;
import java.util.Map;

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
	
	//쪽지 읽음 표시
	public void updateMessageChecked(Message message);
	//쪽지 상세 보기(발신,수신,참조,비밀참조 인원)
	public List<Message> detailMessageEmployee(int messageNo);
	//쪽지 상세 보기(쪽지 중요 여부)
	public int detailMessageImportant(Map<String, Object> paramMap);
	//쪽지 상세 보기(쪽지 내용)
	public Message detailMessageContent(int messageNo);
	//쪽지 상세 보기(쪽지 첨부파일)
	public List<Message> detailMessageMediaFile(int messageNo);
}
