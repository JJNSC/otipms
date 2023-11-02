package com.otipms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.otipms.dto.Message;
import com.otipms.interceptor.Login;
import com.otipms.security.EmpDetails;
import com.otipms.service.AlarmService;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;
import com.otipms.service.ProjectService;
import com.otipms.service.TeamService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/mail")
public class MailRestController {
	
	
	@Autowired
	private MessageService messageService;
	
	//쪽지 수신함
	@GetMapping("/receivedMails")
	public List<Message> receivedMail(@RequestParam int empId) {
		
		return messageService.getMyReceivedMessage(empId);
	}
	
}
