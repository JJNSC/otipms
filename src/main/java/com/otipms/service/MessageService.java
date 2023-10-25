package com.otipms.service;

import java.util.List;

import com.otipms.dto.Message;

public interface MessageService {
	public List<Message> getMyReceivedMessage(int empId);
}
