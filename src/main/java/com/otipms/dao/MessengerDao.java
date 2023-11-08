package com.otipms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Messenger;

@Mapper
public interface MessengerDao {
	public List<Messenger> selectChatRoom(int empId);
	public List<Messenger> getChatContent(int mrNo);
	
	//나랑 대화하는 상대를 가져오기
	public Messenger getEmpNotMe(Map<String, Object> paramMap);
	
	//방 만들기
	public void insertChatRoom(Messenger messenger);
	//방 만들어지면서 환영채팅
	public void insertChatRoomContent(Map<String, Object> paramMap);
	
	//직접 채팅 입력
	public void insertChat(Map<String, Object> paramMap);
}
