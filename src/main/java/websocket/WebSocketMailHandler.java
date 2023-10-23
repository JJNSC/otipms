package websocket;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.otipms.dto.Employee;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketMailHandler extends TextWebSocketHandler{
	
private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		log.info("#ChattingHandler, afterConnectionEstablished");
		sessionList.add(session);
		
		HttpSession httpSession = (HttpSession) session.getAttributes().get("org.springframework.web.servlet.support.SessionFlashMapManager.FLASH_MAPS");
		Employee loginUser = (Employee) httpSession.getAttribute("loginUser");

		if (loginUser != null) {
            log.info(loginUser.getEmpId() + "님이 입장하셨습니다.");
        } else {
            // 로그인하지 않은 사용자의 처리
        }
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		log.info("#ChattingHandler, handleMessage");
		log.info(session.getId() + ": " + message);
		
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(session.getPrincipal().getName() + ":" + message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		log.info("#ChattingHandler, afterConnectionClosed");

		sessionList.remove(session);
		
		log.info(session.getPrincipal().getName() + "님이 퇴장하셨습니다.");
	}
}
