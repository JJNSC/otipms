package com.otipms.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.AlarmDao;
import com.otipms.dao.MessageDao;
import com.otipms.dto.Alarm;
import com.otipms.dto.CC;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Message;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private AlarmDao alarmDao;
	
	@Override
	public List<Message> getMyReceivedMessage(int empId) {
		return messageDao.selectMyReceivedMessage(empId);
	}
	
	@Override
	public List<Message> getMySentMessage(int empId) {
		return messageDao.selectMySentMessage(empId);
	}
	
	@Override
	public List<Message> getMyImportantMessage(int empId) {
		return messageDao.selectMyImportantMessage(empId);
	}
	
	@Override
	public List<Message> getMyTemporaryMessage(int empId) {
		return messageDao.selectMyTemporaryMessage(empId);
	}
	
	@Override
	public List<Message> getMyTrashMessage(int empId) {
		return messageDao.selectMyTrashMessage(empId);
	}

	@Override
	public Message getMessageByMessageNo(int messageNo) {
		return messageDao.selectMessagebyMessageNo(messageNo);
	}

	@Override
	public void toggleMessageImportance(Message message) {
		messageDao.updateImportantMessage(message);
	}

	@Override
	public void updateMessageTrash(Message message) {
		messageDao.updateTrashMessage(message);
	}

	//쪽지 읽음 표시
	@Override
	public void updateMessageChecked(Message message) {
		messageDao.updateMessageChecked(message);
	}

	//상세보기
	@Override
	public List<Message> detailMessageEmployee(int messageNo) {
		
		return messageDao.detailMessageEmployee(messageNo);
	}
	
	// (상세쪽지에서 중요버튼 누르는거 해야함)
	@Override
	public int detailMessageImportant(Map<String, Object> paramMap) {
		return 0;
	}

	@Override
	public Message detailMessageContent(int messageNo) {
		return messageDao.detailMessageContent(messageNo);
	}

	@Override
	public List<Message> detailMessageMediaFile(int messageNo) {
		return messageDao.detailMessageMediaFile(messageNo);
	}

	@Override
	public int writeMessage(Message message) {
		return sqlSession.insert("writeMessage", message);
	}

	@Override
	public void writeCC(List<CC> ccList) {
		for (CC cc : ccList) {
            messageDao.writeCC(cc);
            if(cc.getCcType() != 2) {
            	Alarm alarm = new Alarm();
            	alarm.setEmpId(cc.getEmpId());
            	alarm.setAlarmContentCode("쪽지 알림");
            	alarm.setAlarmContent("쪽지가 도착했습니다.");
            	Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
            	alarm.setAlarmDate(currentTimestamp);
            	alarm.setAlarmChk(0);
            	alarm.setMessageNo(cc.getMessageNo());
            	alarmDao.insertAlarm(alarm);
            }
        }
	}

	@Override
    public void uploadAndSave(List<MediaFile> mediaFile) {
        for (MediaFile file : mediaFile) {
        	messageDao.writeMailMedia(file);
        }
    }
	
	@Override
	public void updateFile(int messageNo, int empId) {
	    MediaFile mediaFile = new MediaFile();
	    mediaFile.setMessageNo(messageNo);
	    mediaFile.setEmpId(empId);
	    messageDao.updateMailMedia(mediaFile);
	}

}
