package com.otipms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.CC;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Message;

@Mapper
public interface MessageDao {
	public List<Message> selectMyReceivedMessage(int empId);
	public List<Message> selectMySentMessage(int empId);
	public List<Message> selectMyImportantMessage(int empId);
	public List<Message> selectMyTemporaryMessage(int empId);
	public List<Message> selectMyTrashMessage(int empId);
	
	//비동기
	public List<Message> selectMyReceivedMessageA(Integer empId);
	
	
	
	
	public Message selectMessagebyMessageNo(int messageNo);
	public void updateImportantMessage(Message message);
	public void updateTrashMessage(Message message);
	public void updateRealTrashMessage(Message message);
	
	//쪽지 읽음 표시
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
	//쪽지 상세 보기 (읽은 사람 여부 및 시간)
	public List<Message> readMail(int messageNo);
	
	//쪽지 쓰기
	public int writeMessage(Message message);
	public void writeCC(CC cc);
	public void writeMailMedia(MediaFile mediaFile);
	public MediaFile selectMediaFileByMediaFileNo(int mediaFileNo);
	public void updateMailMedia(MediaFile mediaFile);
	
	//알림으로 읽은쪽지 읽음표시
	public Message selectMyCCByMessageNo(Map<String, Object> paramMap);
	//쪽지함에서 읽은걸로 알람정보 제거하기
	public Message selectMessageNoByCC(Map<String, Object> paramMap);
	
	//해당하는 쪽지에 미디어파일이 있나?
	public List<MediaFile> haveMediaFile(int messageNo);
}
