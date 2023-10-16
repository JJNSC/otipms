package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MailController {
	@RequestMapping("/emailInbox")
	public String emailInbox() {
		log.info("dd");
		return "emailInbox";
	}
	
	@RequestMapping("/sentMail")
	public String sentMail() {
		log.info("dd");
		return "sentMail";
	}
	
	@RequestMapping("/importantMail")
	public String importantMail() {
		log.info("dd");
		return "importantMail";
	}
	
	@RequestMapping("/temporaryMail")
	public String temporaryMail() {
		log.info("dd");
		return "temporaryMail";
	}
	
	@RequestMapping("/trashMail")
	public String trashMail() {
		log.info("dd");
		return "trashMail";
	}
	
	@RequestMapping("/mail")
	public String mail() {
		log.info("dd");
		return "mail";
	}
	
	@RequestMapping("/detailMail")
	public String detailMail() {
		log.info("dd");
		return "detailMail";
	}
	
	@RequestMapping("/writeMail")
	public String writeMail() {
		log.info("dd");
		return "writeMail";
	}
	
	@RequestMapping("/chat")
	public String chat() {
		log.info("dd");
		return "chat";
	}
}
