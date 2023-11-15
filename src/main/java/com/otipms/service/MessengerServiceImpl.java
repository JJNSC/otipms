package com.otipms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.controller.LoginController;
import com.otipms.dao.MessengerDao;
import com.otipms.dto.Messenger;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MessengerServiceImpl implements MessengerService {
	
	@Autowired
	public MessengerDao messengerDao;

	@Override
	public List<Messenger> selectChatRoom(int mrNo) {
		return messengerDao.selectChatRoom(mrNo);
	}

	@Override
	public List<Messenger> getChatContent(int mrNo) {
		return messengerDao.getChatContent(mrNo);
	}

	@Override
	public Messenger getEmpNotMe(int mrNo, int empId) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mrNo", mrNo);
		paramMap.put("empId", empId);
		
		Messenger messenger = messengerDao.getEmpNotMe(paramMap);
		return messenger;
	}

	@Override
	public int insertChatRoom(int empId) {
		
		Messenger messenger = new Messenger();
	    messenger.setMrNo(0);
		messengerDao.insertChatRoom(messenger);
	    int mrNo = messenger.getMrNo();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mrNo", mrNo);
		paramMap.put("empId", empId);
		
		Map<String, Object> paramMap2 = new HashMap<>();
		paramMap2.put("mrNo", mrNo);
		paramMap2.put("empId", LoginController.loginEmployee.getEmpId());
		
		messengerDao.insertChatRoomContent(paramMap);
		messengerDao.insertChatRoomContent(paramMap2);
		
		return mrNo;
	}

	@Override
	public int insertChat(int mrNo, int empId, String messengerContent) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mrNo", mrNo);  
		paramMap.put("empId", empId); 
		paramMap.put("messengerContent", messengerContent);
		
		
		messengerDao.insertChat(paramMap);
		
		int messengerNo = (int) paramMap.get("messengerNo");
		
		return messengerNo;
	}

	@Override
	public void updateLastChat(Messenger messenger) {
		messengerDao.updateLastChat(messenger);
	}

	@Override
	public void deleteChat(int mrNo) {
		messengerDao.deleteChatData(mrNo);
		messengerDao.deleteChatRoom(mrNo);
	}
	
	
}
