package com.otipms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.MessageDao;
import com.otipms.dto.Message;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDao messageDao;

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




}
