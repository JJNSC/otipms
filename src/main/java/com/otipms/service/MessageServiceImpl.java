package com.otipms.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	private AlarmDao alarmDao;
	
	@Override
	public List<Message> getMyReceivedMessage(int empId) {
		return messageDao.selectMyReceivedMessage(empId);
	}
	
	//비동기
	@Override
	public List<Message> getMyReceivedMessageA(String empId){
		Integer empIdInt = Integer.parseInt(empId);
		return messageDao.selectMyReceivedMessageA(empIdInt);
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

	@Override
	public void updateMessageRealTrash(Message message) {
		messageDao.updateRealTrashMessage(message);
	}
	
	//쪽지 읽음 표시
	@Override
	public void updateMessageChecked(Message message) {
		messageDao.updateMessageChecked(message);
	}
	
	@Override
	public void updateMessageCheckedRec(Message message) {
		messageDao.updateMessageCheckedRec(message);
	}
	
	@Override
	public void readAll(int empId) {
		messageDao.readAll(empId);
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
	public List<Message> readMail(int messageNo){
		return messageDao.readMail(messageNo);
	}
	
	@Override
	public void deleteMessage(int messageNo, int empId) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("messageNo", messageNo);
		paramMap.put("empId", empId);
		
		messageDao.deleteMessage(paramMap);
	}
	
	@Override
	public MediaFile getMediaFile(int mediaFileNo) {
		return messageDao.selectMediaFileByMediaFileNo(mediaFileNo);
	}
	
	@Override
	public int writeMessage(Message message) {
		return messageDao.writeMessage(message);
	}

	@Override
	public void writeCC(List<CC> ccList) {
		for (CC cc : ccList) {
			messageDao.writeCC(cc);
			if (cc.getCcType() != 2){
				Message message = messageDao.selectMessagebyMessageNo(cc.getMessageNo());
            	Alarm alarm = new Alarm();
            	alarm.setAlarmEmpId(cc.getEmpId());
            	alarm.setAlarmContentCode(message.getEmpRank()+" "+message.getEmpName()+"님으로부터 쪽지가 도착했습니다.");
            	alarm.setAlarmContent(message.getMessageTitle());
            	Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
            	alarm.setAlarmDate(currentTimestamp);
            	alarm.setAlarmChk(0);
            	alarm.setAlarmMessageNo(cc.getMessageNo());
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
	public int selectEmpIdByMessageNo(int messageNo) {
		
		int empId = messageDao.selectEmpIdByMessageNo(messageNo);
		return empId;
	}
	@Override
	public void updateFile(int messageNo, int empId) {
	    MediaFile mediaFile = new MediaFile();
	    mediaFile.setMessageNo(messageNo);
	    mediaFile.setEmpId(empId);
	    messageDao.updateMailMedia(mediaFile);
	}
	
	@Override
	public Message getCCbyAlarm(Map<String, Object> paramMap) {
		
		return messageDao.selectMyCCByMessageNo(paramMap);
	}
	@Override
	public Message getMessageNoByCCNo(Map<String,Object> paramMap) {
		return messageDao.selectMessageNoByCC(paramMap);
	}
}
