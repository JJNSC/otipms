package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.otipms.interceptor.Login;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyScheduleController {

	@RequestMapping("/mySchedule")
	public String mySchedule(Model model) {
		log.info("개인일정");
		model.addAttribute("employee", LoginController.loginEmployee);
	    model.addAttribute("base64Img", LoginController.profileImg);
	    model.addAttribute("mf", LoginController.multipartFile);
		return "mySchedule/mySchedule";
	}
	
}
