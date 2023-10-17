package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mail")
public class MailController {
	@RequestMapping("/receivedMail")
	public String receivedMail() {
		log.info("dd");
		return "mail/receivedMail";
	}
	
	@RequestMapping("/sentMail")
	public String sentMail() {
		log.info("dd");
		return "mail/sentMail";
	}
	
	@RequestMapping("/importantMail")
	public String importantMail() {
		log.info("dd");
		return "mail/importantMail";
	}
	
	@RequestMapping("/temporaryMail")
	public String temporaryMail() {
		log.info("dd");
		return "mail/temporaryMail";
	}
	
	@RequestMapping("/trashMail")
	public String trashMail() {
		log.info("dd");
		return "mail/trashMail";
	}
	
	@RequestMapping("/mail")
	public String mail() {
		log.info("dd");
		return "mail/mail";
	}
	
	@RequestMapping("/detailMail")
	public String detailMail() {
		log.info("dd");
		return "mail/detailMail";
	}
	
	@RequestMapping("/writeMail")
	public String writeMail() {
		log.info("dd");
		return "mail/writeMail";
	}
	
	
	//메일함 내용들
	//수신 쪽지함
	@RequestMapping("/reloadReceivedMail")
	public String reloadReceivedMail() {
		log.info("dd");
		return "mail/reloadReceivedMail";
	}
	
	//발신 쪽지함
	@RequestMapping("/reloadSentMail")
	public String reloadSentMail() {
		log.info("dd");
		return "mail/reloadSentMail";
	}
	
	//중요 쪽지함
	@RequestMapping("/reloadImportantMail")
	public String reloadImportantMail() {
		log.info("dd");
		return "mail/reloadImportantMail";
	}
	
	//임시 저장함
	@RequestMapping("/reloadTemporaryMail")
	public String reloadTemporaryMail() {
		log.info("dd");
		return "mail/reloadTemporaryMail";
	}
	
	//쪽지 휴지통
	@RequestMapping("/reloadTrashMail")
	public String reloadTrashMail() {
		log.info("dd");
		return "mail/reloadTrashMail";
	}
}
