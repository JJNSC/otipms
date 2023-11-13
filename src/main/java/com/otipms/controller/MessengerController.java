package com.otipms.controller;

import java.sql.Timestamp;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.otipms.aop.time.RuntimeCheck;
import com.otipms.dao.AlarmDao;
import com.otipms.dao.EmployeeDao;
import com.otipms.dto.Alarm;
import com.otipms.dto.Employee;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Messenger;
import com.otipms.security.EmpDetails;
import com.otipms.service.AlarmService;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessengerService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
@CrossOrigin(origins = "*")
public class MessengerController {
	
	@Autowired
	private MessengerService messengerService;
	
	@Autowired
	private AlarmService alarmService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private AlarmDao alarmDao;
	
	@Autowired
	private EmployeeDao employeeDao;
	
	@RuntimeCheck
	@RequestMapping("/chat")
	public String chat(Model model, Authentication authentication) {
		
		return "chat/chat";
	}
	
	@RuntimeCheck
	@GetMapping("/chatRoom")
	public String chatRoom(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		Employee employee = empDetails.getEmployee();
		List<Messenger> chatRoom = messengerService.selectChatRoom(empDetails.getEmployee().getEmpId());
		
		for(Messenger messenger : chatRoom) {
			MediaFile media = employeeService.getProfileImgByEmpId(messenger.getEmpId());
			messenger.setMediaFile(media);
			messenger.setMediaFileData(Base64.getEncoder().encodeToString(media.getMediaFileData()));
			messenger.setEmpStatus(employeeDao.islogined(messenger.getEmpId()));
		}
		
		
		model.addAttribute("employee", employee);
		model.addAttribute("chatRoom", chatRoom);
		return "chat/chatRoom";
	}
	
	@RuntimeCheck
	@GetMapping("/chatContent")
	public String chatContent(@RequestParam("mrNo") int mrNo, Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		Employee employee = empDetails.getEmployee();
		
		Messenger chatRoomEmp = messengerService.getEmpNotMe(mrNo, empId);
		MediaFile media = employeeService.getProfileImgByEmpId(chatRoomEmp.getEmpId());
		chatRoomEmp.setMediaFile(media);
		chatRoomEmp.setMediaFileData(Base64.getEncoder().encodeToString(media.getMediaFileData()));
		
		List<Messenger> chatContent = messengerService.getChatContent(mrNo);
		
		model.addAttribute("employee", employee);
		model.addAttribute("chatRoomEmp", chatRoomEmp);
		model.addAttribute("chatContent", chatContent);
		model.addAttribute("mrNo", mrNo);
		
		return "chat/chatContent";
	}
	
	@RuntimeCheck
	@PostMapping("/sendMessage")
	public String sendMessage(@RequestParam int mrNo, @RequestParam int empId, @RequestParam String message) {
		// 채팅 고유 번호 가져오는 서비스 + 채팅 추가
		int messengerNo = messengerService.insertChat(mrNo, empId, message);
		//빈 깡통 만들기
		Messenger messenger = new Messenger();
		
		//채팅방 번호 셋
		messenger.setMrNo(mrNo);
		//채팅 마지막 내용 저장
		messenger.setMrLastChat(message);
		
		//마지막 내용 저장하는 서비스 (좌상단)
		messengerService.updateLastChat(messenger);
		
		Employee employee = employeeService.getEmployeeInfo(empId);
		Messenger nmMessenger = messengerService.getEmpNotMe(mrNo, empId);
		
		Alarm alarm = new Alarm();
		alarm.setAlarmEmpId(nmMessenger.getEmpId());
		alarm.setAlarmContent(" ");
		alarm.setAlarmContentCode(employee.getEmpRank() + " " +employee.getEmpName()+"님으로부터 채팅이 도착했습니다.");
		alarm.setAlarmMessengerNo(messengerNo);
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
    	alarm.setAlarmDate(currentTimestamp);
    	alarm.setAlarmChk(0);
    	alarmDao.insertAlarmChat(alarm);
    	
		return "chat/chat";
	}
	
	@RuntimeCheck
	@PostMapping("/deleteChat")
	public String deleteChat(@RequestParam int mrNo, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		alarmService.deleteChatAlarmAll(empId);
		Messenger messenger = messengerService.getEmpNotMe(mrNo, empId);
		alarmService.deleteChatAlarmAll(messenger.getEmpId());
		
		messengerService.deleteChat(mrNo);
		
		return "redirect:chat";
	}
	
	@RuntimeCheck
	@RequestMapping("/findEmployee")
	public String findEmployee() {
		
		return "chat/findEmployee";
	}
}
