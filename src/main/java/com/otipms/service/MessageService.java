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
	
	
	//비동기
	public List<Message> getMyReceivedMessageA(String empId);
	
	public Message getMessageByMessageNo(int messageNo);
	public void toggleMessageImportance(Message message);
	public void updateMessageTrash(Message message);
	public void updateMessageRealTrash(Message message);
	
	public void updateMessageChecked(Message message);
	public void updateMessageCheckedRec(Message message);
	
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
	public void uploadAndSave(List<MediaFile> mediaFile);
	public MediaFile getMediaFile(int mediaFileNo);
	public void updateFile(int messageNo, int empId);
	
	
	//알람번호로 정확히 원하는 CC 쪽지 찾기
	public Message getCCbyAlarm(Map<String, Object> paramMap);
	//CCNo로 정확히 원하는 메세지 번호 찾기
	public Message getMessageNoByCCNo(Map<String,Object> paramMap);
}
