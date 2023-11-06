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
		List<Message> plusreceivedMails = new ArrayList<>();
		for (Message message : receivedMails) {
			int mesmessageNo = message.getMessageNo();
			//지금 들어가고 있는 EmpId는 messageNo의 empId임 (로그인 한 사람 고정 값이라는 뜻)
			//가져와야 할 사원의 번호는 해당 messageNo에 해당하는 cc
			List<MediaFile> mediaFiles = messageDao.haveMediaFile(mesmessageNo);
			message.setMediaFile(mediaFiles);
			if(employeeService.getProfileImgByEmpId(message.getEmpId())!=null) {
	    		MediaFile mf = employeeService.getProfileImgByEmpId(message.getEmpId());
	    		message.setProfile(Base64.getEncoder().encodeToString(mf.getMediaFileData()));
	    		message.setMediaFileType(mf.getMediaFileType());
		    }else {
		    	MediaFile mf = employeeService.getDefaultImg();
		    	message.setProfile(Base64.getEncoder().encodeToString(mf.getMediaFileData()));
		    	message.setMediaFileType(mf.getMediaFileType());
		    }
			plusreceivedMails.add(message);
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(plusreceivedMails);
		return new ResponseEntity<>(json, HttpStatus.OK);
	}
	
	//쪽지 발신함
	@GetMapping(value="/sentMails", produces = "application/json; charset=UTF-8")
	public ResponseEntity<String> sentMails(@RequestParam int empId) throws JsonProcessingException {
		List<Message> sentMails = messageService.getMySentMessage(empId);
		List<Message> plussentMails = new ArrayList<>();
		for (Message message : sentMails) {
			int mesmessageNo = message.getMessageNo();
			List<MediaFile> mediaFiles = messageDao.haveMediaFile(mesmessageNo);
			message.setMediaFile(mediaFiles);
			if(employeeService.getProfileImgByEmpId(message.getEmpId())!=null) {
	    		MediaFile mf = employeeService.getProfileImgByEmpId(message.getEmpId());
	    		message.setProfile(Base64.getEncoder().encodeToString(mf.getMediaFileData()));
	    		message.setMediaFileType(mf.getMediaFileType());
		    }else {
		    	MediaFile mf = employeeService.getDefaultImg();
		    	message.setProfile(Base64.getEncoder().encodeToString(mf.getMediaFileData()));
		    	message.setMediaFileType(mf.getMediaFileType());
		    }
			plussentMails.add(message);
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(plussentMails);
		return new ResponseEntity<>(json, HttpStatus.OK);
	}
	
	//중요 쪽지함
	@GetMapping(value="/importantMails", produces = "application/json; charset=UTF-8")
	public ResponseEntity<String> importantMails(@RequestParam int empId) throws JsonProcessingException {
		List<Message> importantMails = messageService.getMyImportantMessage(empId);
		List<Message> plusimportantMails = new ArrayList<>();
		for (Message message : importantMails) {
			int mesmessageNo = message.getMessageNo();
			List<MediaFile> mediaFiles = messageDao.haveMediaFile(mesmessageNo);
			message.setMediaFile(mediaFiles);
			if(employeeService.getProfileImgByEmpId(message.getEmpId())!=null) {
	    		MediaFile mf = employeeService.getProfileImgByEmpId(message.getEmpId());
	    		message.setProfile(Base64.getEncoder().encodeToString(mf.getMediaFileData()));
	    		message.setMediaFileType(mf.getMediaFileType());
		    }else {
		    	MediaFile mf = employeeService.getDefaultImg();
		    	message.setProfile(Base64.getEncoder().encodeToString(mf.getMediaFileData()));
		    	message.setMediaFileType(mf.getMediaFileType());
		    }
			plusimportantMails.add(message);
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(plusimportantMails);
		return new ResponseEntity<>(json, HttpStatus.OK);
	}
	
	//임시 저장함
	@GetMapping(value="/temporaryMails" , produces = "application/json; charset=UTF-8")
	public ResponseEntity<String> temporaryMails(@RequestParam int empId) throws JsonProcessingException {
		List<Message> temporaryMails = messageService.getMyTemporaryMessage(empId);
		List<Message> plustemporaryMails = new ArrayList<>();
		for (Message message : temporaryMails) {
			int mesmessageNo = message.getMessageNo();
			List<MediaFile> mediaFiles = messageDao.haveMediaFile(mesmessageNo);
			message.setMediaFile(mediaFiles);
			if(employeeService.getProfileImgByEmpId(message.getEmpId())!=null) {
	    		MediaFile mf = employeeService.getProfileImgByEmpId(message.getEmpId());
	    		message.setProfile(Base64.getEncoder().encodeToString(mf.getMediaFileData()));
	    		message.setMediaFileType(mf.getMediaFileType());
		    }else {
		    	MediaFile mf = employeeService.getDefaultImg();
		    	message.setProfile(Base64.getEncoder().encodeToString(mf.getMediaFileData()));
		    	message.setMediaFileType(mf.getMediaFileType());
		    }
			plustemporaryMails.add(message);
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(plustemporaryMails);
		return new ResponseEntity<>(json, HttpStatus.OK);
	}
	
	//쪽지 휴지통
	@GetMapping(value="/trashMails", produces = "application/json; charset=UTF-8")
	public ResponseEntity<String> trashMails(@RequestParam int empId) throws JsonProcessingException {
		List<Message> trashMails = messageService.getMyTrashMessage(empId);
		List<Message> plustrashMails = new ArrayList<>();
		for (Message message : trashMails) {
			int mesmessageNo = message.getMessageNo();
			List<MediaFile> mediaFiles = messageDao.haveMediaFile(mesmessageNo);
			message.setMediaFile(mediaFiles);
			if(employeeService.getProfileImgByEmpId(message.getEmpId())!=null) {
	    		MediaFile mf = employeeService.getProfileImgByEmpId(message.getEmpId());
	    		message.setProfile(Base64.getEncoder().encodeToString(mf.getMediaFileData()));
	    		message.setMediaFileType(mf.getMediaFileType());
		    }else {
		    	MediaFile mf = employeeService.getDefaultImg();
		    	message.setProfile(Base64.getEncoder().encodeToString(mf.getMediaFileData()));
		    	message.setMediaFileType(mf.getMediaFileType());
		    }
			plustrashMails.add(message);
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(plustrashMails);
		return new ResponseEntity<>(json, HttpStatus.OK);
	}
}
