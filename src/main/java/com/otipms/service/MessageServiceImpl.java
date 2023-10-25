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



}
