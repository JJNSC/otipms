package com.otipms.websocket;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.otipms.controller.LoginController;
import com.otipms.dao.AlarmDao;
import com.otipms.dto.Alarm;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Message;
import com.otipms.service.AlarmService;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketMailHandler extends TextWebSocketHandler{
	
	@Autowired
	private AlarmService alarmService;
	
	@Autowired
	private MessageService messageService;
	
	
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//클라이언트가 서버에 접속 성공시 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("알람 소켓 연결 완료 : " + session);
		sessions.add(session); //리스트에 접속한 session들을 담음
		log.info("접속한 알람 소켓 인원 : " + sessions.size());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String memId = message.getPayload();
	    log.info("메세지 도착: {} : " + memId);
	    //Thread.sleep(500);
	    List<Message> messages = messageService.getMyReceivedMessageA(memId);
		List<Alarm> alarms = alarmService.selectAlarmCountByEmpIdI(memId);
	    // 세션에 알림 개수와 알림 내용을 전달
	    Map<String, Object> notificationData = new HashMap<>();
	    notificationData.put("alcount", alarms.size());
	    notificationData.put("alarms", alarms);
	    notificationData.put("mscount", messages.size());
	    notificationData.put("messages", messages);
	    TextMessage sendMsg = new TextMessage(new ObjectMapper().writeValueAsString(notificationData));
	    
	    // 모든 연결된 세션에 알림 및 메세지를 보냅니다.
	    for (WebSocketSession single : sessions) {
	        single.sendMessage(sendMsg);
	    }
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("알람 소켓 연결 종료");
		sessions.remove(session);
		log.info("접속한 알람 소켓 인원 : " + sessions.size());
	}
	
}
