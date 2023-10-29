package com.otipms.service;

import java.util.List;
import java.util.Map;

import com.otipms.dto.CC;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Message;

public interface MessageService {
	public List<Message> getMyReceivedMessage(int empId);
	public List<Message> getMySentMessage(int empId);
	public List<Message> getMyImportantMessage(int empId);
	public List<Message> getMyTemporaryMessage(int empId);
	public List<Message> getMyTrashMessage(int empId);
	public Message getMessageByMessageNo(int messageNo);
	public void toggleMessageImportance(Message message);
	public void updateMessageTrash(Message message);
	public void updateMessageChecked(Message message);
	
	//쪽지 상세 보기(발신,수신,참조,비밀참조 인원)
	public List<Message> detailMessageEmployee(int messageNo);
	//쪽지 상세 보기(쪽지 중요 여부)
	public int detailMessageImportant(Map<String, Object> paramMap);
	//쪽지 상세 보기(쪽지 내용)
	public Message detailMessageContent(int messageNo);
	//쪽지 상세 보기(쪽지 첨부파일)
	public List<Message> detailMessageMediaFile(int messageNo);
	
	public int writeMessage(Message message);
	public void writeCC(List<CC> ccList);
	public int writeMailMedia(List<MediaFile> mailMediaList);
}
