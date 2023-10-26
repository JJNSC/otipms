package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TaskController {
	
	@RequestMapping("/myTask")
	public String myTask(Model model) {
		log.info("개인업무일정");
		model.addAttribute("employee", LoginController.loginEmployee);
		return "task/myTask";
	}
}
