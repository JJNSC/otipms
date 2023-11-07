package com.otipms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.otipms.service.AlarmService;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;
import com.otipms.service.MessengerService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class MessengerController {
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private AlarmService alarmService;
	
	@Autowired
	private MessengerService messengerService;
	
	@RequestMapping("/chat")
	public String chat() {
		log.info("dd");
		return "chat/chat";
	}
}
