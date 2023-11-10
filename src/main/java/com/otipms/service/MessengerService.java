package com.otipms.service;

import java.util.List;

import com.otipms.dto.Messenger;

public interface MessengerService {
	//현재 자신에 맞는 채팅방 불러오기
	public List<Messenger> selectChatRoom(int empId);
	//자신이 선택한 채팅방 정보
	public List<Messenger> getChatContent(int mrNo);
	
	//상대 사원정보 가져오기
	public Messenger getEmpNotMe(int mrNo, int empId);
	
	//채팅방 만들기
	public int insertChatRoom(int empId);
	
	//채팅 입력
	public void insertChat(int mrNo, int empId, String messengerContent);
	public void updateLastChat(Messenger messenger);
	
	//채팅방 삭제
	public void deleteChat(int mrNo);
}
