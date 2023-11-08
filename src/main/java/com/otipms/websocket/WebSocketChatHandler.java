package com.otipms.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.otipms.dto.Alarm;
import com.otipms.dto.Message;
import com.otipms.service.AlarmService;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;
import com.otipms.service.MessengerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketChatHandler extends TextWebSocketHandler{
	
	@Autowired
	private AlarmService alarmService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private MessengerService messengerService;
	
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//클라이언트가 서버에 접속 성공시 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("소켓 연결 완료 : " + session);
		sessions.add(session); //리스트에 접속한 session들을 담음
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String messagePayload = message.getPayload();
	    ObjectMapper objectMapper = new ObjectMapper();
	    Map<String, Object> messageData = objectMapper.readValue(messagePayload, Map.class);

	    String empId = (String) messageData.get("empId");
	    String mrNo = (String) messageData.get("mrNo");
	    
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("소켓 연결 종료");
		sessions.remove(session);
	}
	
}
