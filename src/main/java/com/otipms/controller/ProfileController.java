package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProfileController {
	@RequestMapping("/profile")
	public String profile() {
		log.info("프로필");
		return "profile/profile";
	}
}
