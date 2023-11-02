package com.otipms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.otipms.dto.Message;
import com.otipms.service.MessageService;

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
