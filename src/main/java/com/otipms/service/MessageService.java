package com.otipms.service;

import java.util.List;

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
}
