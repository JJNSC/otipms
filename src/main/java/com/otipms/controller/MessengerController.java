package com.otipms.controller;

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

import com.otipms.dto.Employee;
import com.otipms.dto.Messenger;
import com.otipms.security.EmpDetails;
import com.otipms.service.MessengerService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
@CrossOrigin(origins = "*")
public class MessengerController {
	
	@Autowired
	private MessengerService messengerService;
	
	@RequestMapping("/chat")
	public String chat(Model model, Authentication authentication) {
		
		return "chat/chat";
	}
	
	@GetMapping("/chatRoom")
	public String chatRoom(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		Employee employee = empDetails.getEmployee();
		List<Messenger> chatRoom = messengerService.selectChatRoom(empDetails.getEmployee().getEmpId());
		
		log.info("chatRoom : " + chatRoom);
		model.addAttribute("employee", employee);
		model.addAttribute("chatRoom", chatRoom);
		
		return "chat/chatRoom";
	}
	
	
	@GetMapping("/chatContent")
	public String chatContent(@RequestParam("mrNo") int mrNo, Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		Employee employee = empDetails.getEmployee();
		
		Messenger chatRoomEmp = messengerService.getEmpNotMe(mrNo, empId);
		log.info("notMeEmp : " + chatRoomEmp);
		List<Messenger> chatContent = messengerService.getChatContent(mrNo);
		
		model.addAttribute("employee", employee);
		model.addAttribute("chatRoomEmp", chatRoomEmp);
		model.addAttribute("chatContent", chatContent);
		model.addAttribute("mrNo", mrNo);
		
		return "chat/chatContent";
	}
	
	@PostMapping("/sendMessage")
	public String sendMessage(@RequestParam int mrNo, @RequestParam int empId, @RequestParam String message) {
		messengerService.insertChat(mrNo, empId, message);
		Messenger messenger = new Messenger();
		
		messenger.setMrNo(mrNo);
		messenger.setMrLastChat(message);
		
		messengerService.updateLastChat(messenger);
		
		return "chat/chat";
	}
	
	@PostMapping("/deleteChat")
	public String deleteChat(@RequestParam int mrNo) {
		messengerService.deleteChat(mrNo);
		
		return "redirect:chat";
	}
	
	@RequestMapping("/findEmployee")
	public String findEmployee() {
		
		return "chat/findEmployee";
	}
}
