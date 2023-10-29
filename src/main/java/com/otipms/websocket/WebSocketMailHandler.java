package com.otipms.websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.otipms.dao.AlarmDao;
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
		sessions.add(session); //리스트에 접속한 session들을 담음
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		//찾아 볼 것
		SecurityContextImpl o = (SecurityContextImpl) session.getAttributes().get("SPRING_SECURITY_CONTEXT");
		EmpDetails empDetails = (EmpDetails) o.getAuthentication().getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		
		for(WebSocketSession single : sessions) {
			String memId = message.getPayload();
			int count = alarmDao.selectAlarmCountByEmpId(empId);
			
			
			//리스트에 담긴 세션의 id와 메세지를 보내줄 세션의 id가 같고, uchkList가 0이 아닐 경우 메세지 전송
			if(single.getId().equals(session.getId()) && count != 0) {
				TextMessage sendMsg = new TextMessage(memId + "님 새 알림이 있습니다");
				single.sendMessage(sendMsg);
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessions.remove(session);
	}
}
