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
import com.otipms.dto.Messenger;
import com.otipms.service.AlarmService;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;
import com.otipms.service.MessengerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketChatHandler extends TextWebSocketHandler{
	
	@Autowired
	private MessengerService messengerService;
	
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	private Map<Integer, WebSocketSession> userSessions = new HashMap<>();
	//클라이언트가 서버에 접속 성공시 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	    String payload = message.getPayload();
	    log.info("메세지 도착: {} : " + payload);
	    ObjectMapper objectMapper = new ObjectMapper();
	    Map<String, String> messageMap = objectMapper.readValue(payload, Map.class);
	 
	    String mrNoStr = messageMap.get("mrNo");
	    int mrNo = Integer.parseInt(mrNoStr);

	    String empIdStr = messageMap.get("empId");
	    int myempId = Integer.parseInt(empIdStr);

	    String messageContent = messageMap.get("messageContent");
	    String messageDate = messageMap.get("messageDate");
	    
	    Messenger messenger = messengerService.getEmpNotMe(mrNo, myempId);
	    
	    int empId = messenger.getEmpId();
	    WebSocketSession targetSession = userSessions.get(empId);
	    
	    log.info("targetSession : " + targetSession);
	    
	    Map<String, String> sendMessage = new HashMap<>();
	    sendMessage.put("mrNo", mrNoStr);
	    sendMessage.put("empId", empIdStr);
	    sendMessage.put("messageContent", messageContent);
	    sendMessage.put("messageDate", messageDate);
	    
	    String sendMessageJson = objectMapper.writeValueAsString(sendMessage);
	    log.info("sendMessageJson : " + sendMessageJson);
	 
	    for (WebSocketSession single : sessions) {
	        
	        single.sendMessage(new TextMessage(sendMessageJson));
	    }
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결 종료 시 userSessions에서 제거
        int empId = extractEmpId(session);
        if (empId != -1) {
            userSessions.remove(empId);
        }
        
		sessions.remove(session);
	}
	
	
	private int extractEmpId(WebSocketSession session) {
	    Map<String, Object> attributes = session.getAttributes();
	    if (attributes.containsKey("empId")) {
	        // 세션의 속성으로 사용자 ID가 설정되어 있을 경우 추출
	        return (int) attributes.get("empId");
	    } else {
	        // 사용자 ID가 설정되어 있지 않을 경우 -1 반환
	        return -1;
	    }
	}
}
