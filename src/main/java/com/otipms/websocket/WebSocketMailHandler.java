package com.otipms.websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.otipms.dao.AlarmDao;
import com.otipms.dto.Alarm;
import com.otipms.security.EmpDetails;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketMailHandler extends TextWebSocketHandler{
	
	@Autowired
	private AlarmDao alarmDao;
	public void setAlarmDAO(AlarmDao alarmDao) {
		this.alarmDao = alarmDao;
	}
	
	
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//클라이언트가 서버에 접속 성공시 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("소켓 연결 완료 : " + session);
		sessions.add(session); //리스트에 접속한 session들을 담음
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("소켓 연결 종료");
		sessions.remove(session);
	}
}
