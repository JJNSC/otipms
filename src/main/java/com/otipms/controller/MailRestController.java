package com.otipms.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.otipms.dao.MessageDao;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Message;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/mail")
public class MailRestController {
	
	
	@Autowired
	private MessageService messageService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private MessageDao messageDao;
	
	//쪽지 수신함
	@GetMapping(value="/receivedMails", produces = "application/json; charset=UTF-8")
	public ResponseEntity<String> receivedMail(@RequestParam int empId) throws JsonProcessingException {
		List<Message> receivedMails = messageService.getMyReceivedMessage(empId);
		for(Message messages : receivedMails) {
			messages.setMediaFile(messageDao.MessageMediaFile(messages.getMessageNo()));
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(receivedMails);
		return new ResponseEntity<>(json, HttpStatus.OK);
	}
	
	//쪽지 발신함
	@GetMapping(value="/sentMails", produces = "application/json; charset=UTF-8")
	public ResponseEntity<String> sentMails(@RequestParam int empId) throws JsonProcessingException {
		List<Message> sentMails = messageService.getMySentMessage(empId);
		for(Message messages : sentMails) {
			messages.setMediaFile(messageDao.MessageMediaFile(messages.getMessageNo()));
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(sentMails);
		return new ResponseEntity<>(json, HttpStatus.OK);
	}
	
	//중요 쪽지함
	@GetMapping(value="/importantMails", produces = "application/json; charset=UTF-8")
	public ResponseEntity<String> importantMails(@RequestParam int empId) throws JsonProcessingException {
		List<Message> importantMails = messageService.getMyImportantMessage(empId);
		for(Message messages : importantMails) {
			messages.setMediaFile(messageDao.MessageMediaFile(messages.getMessageNo()));
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(importantMails);
		return new ResponseEntity<>(json, HttpStatus.OK);
	}
	
	//임시 저장함
	@GetMapping(value="/temporaryMails" , produces = "application/json; charset=UTF-8")
	public ResponseEntity<String> temporaryMails(@RequestParam int empId) throws JsonProcessingException {
		List<Message> temporaryMails = messageService.getMyTemporaryMessage(empId);
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(temporaryMails);
		return new ResponseEntity<>(json, HttpStatus.OK);
	}
	
	//쪽지 휴지통
	@GetMapping(value="/trashMails", produces = "application/json; charset=UTF-8")
	public ResponseEntity<String> trashMails(@RequestParam int empId) throws JsonProcessingException {
		List<Message> trashMails = messageService.getMyTrashMessage(empId);
		for(Message messages : trashMails) {
			messages.setMediaFile(messageDao.MessageMediaFile(messages.getMessageNo()));
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(trashMails);
		return new ResponseEntity<>(json, HttpStatus.OK);
	}
}
