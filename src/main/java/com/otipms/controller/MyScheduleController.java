package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyScheduleController {
	@RequestMapping("/mySchedule")
	public String mySchedule() {
		log.info("개인일정");
		return "mySchedule/mySchedule";
	}
}
