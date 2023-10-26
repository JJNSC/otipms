package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProfileController {
	
	@RequestMapping("/profile")
	public String profile(Model model) {
		log.info("프로필");
		model.addAttribute("employee", LoginController.loginEmployee);
		return "profile/profile";
	}
	
	@RequestMapping("/indexTest")
	public String indextTest(Model model) {
		log.info("메인 테스트 페이지");
		model.addAttribute("employee", LoginController.loginEmployee);
		return "indexTest";
	}
}
