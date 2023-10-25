package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.otipms.interceptor.Login;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyScheduleController {
	@Login
	@RequestMapping("/mySchedule")
	public String mySchedule() {
		log.info("개인일정");
		return "mySchedule/mySchedule";
	}
	
	@RequestMapping("/myTask")
	public String myTask() {
		log.info("개인업무일정");
		return "task/myTask";
	}
}
