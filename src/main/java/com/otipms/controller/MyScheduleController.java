package com.otipms.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otipms.dto.Schedule;
import com.otipms.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyScheduleController {
	@Autowired
	private ScheduleService scheduleService;

	@RequestMapping("/mySchedule")
	public String mySchedule(Model model) {
		log.info("개인일정");
		model.addAttribute("employee", LoginController.loginEmployee);
	    model.addAttribute("base64Img", LoginController.profileImg);
	    model.addAttribute("mf", LoginController.multipartFile);
	    
	    List<Schedule> scheduleList = scheduleService.getScheduleList(LoginController.loginEmployee.getEmpId());
	    model.addAttribute("scheduleList", scheduleList);
		return "mySchedule/mySchedule";
	}
	
	/**
	 * 일정 달력 표시
	 * @return
	 */
	@RequestMapping("/getScheduleList")
	@ResponseBody
	public Map<String, Object> getScheduleList() {
		Map<String, Object> ajaxMap = new HashMap<>();
		List<Schedule> scheduleList = scheduleService.getScheduleList(LoginController.loginEmployee.getEmpId());
		ajaxMap.put("scheduleList", scheduleList);
		return ajaxMap;
	}
	
	/**
	 * 일정 추가
	 * @param scheduleName
	 * @param scheduleComment
	 * @param scheduleStartDate
	 * @param scheduleEndDate
	 * @param scheduleColor
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("createSchedule")
	public String createSchedule(
			@RequestParam String scheduleName,
			@RequestParam String scheduleComment,
			@RequestParam String scheduleStartDate,
			@RequestParam String scheduleEndDate,
			@RequestParam String scheduleColor) throws Exception {
		
		Schedule schedule = new Schedule();
		schedule.setEmpId(LoginController.loginEmployee.getEmpId());
		schedule.setScheduleName(scheduleName);
		schedule.setScheduleComment(scheduleComment);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		/*if(!startDate.equals("")) {
			task.setTaskStartDate(sdf.parse(startDate));
		}*/
		schedule.setScheduleStartDate(sdf.parse(scheduleStartDate));
		schedule.setScheduleEndDate(sdf.parse(scheduleEndDate));
		schedule.setScheduleColor(scheduleColor);
		
		scheduleService.addSchedule(schedule);
		
		return "redirect:/mySchedule";
	}
	/**
	 * 메인페이지에서 일정 추가
	 * @param scheduleName
	 * @param scheduleComment
	 * @param scheduleStartDate
	 * @param scheduleEndDate
	 * @param scheduleColor
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("createScheduleMainPage")
	public String createScheduleMainPage(
			@RequestParam String scheduleName,
			@RequestParam String scheduleComment,
			@RequestParam String scheduleStartDate,
			@RequestParam String scheduleEndDate,
			@RequestParam String scheduleColor,
			@RequestParam String role) throws Exception {
		
		Schedule schedule = new Schedule();
		schedule.setEmpId(LoginController.loginEmployee.getEmpId());
		schedule.setScheduleName(scheduleName);
		schedule.setScheduleComment(scheduleComment);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		/*if(!startDate.equals("")) {
			task.setTaskStartDate(sdf.parse(startDate));
		}*/
		schedule.setScheduleStartDate(sdf.parse(scheduleStartDate));
		schedule.setScheduleEndDate(sdf.parse(scheduleEndDate));
		schedule.setScheduleColor(scheduleColor);
		
		scheduleService.addSchedule(schedule);
		if(role.equals("ROLE_ADMIN")) {
			return "redirect:/indexAdmin";
		}else if(role.equals("ROLE_CLIENT")) {
			return "redirect:/indexClient";
		}else if(role.equals("ROLE_PM")) {
			return "redirect:/indexPM";
		}else {
			return "redirect:/indexPE";
		}
	}
	
	/**
	 * 체크 클릭시 수정
	 * @param scheduleChecked
	 * @param scheduleNo
	 * @return
	 */
	@RequestMapping("/changeScheduleChecked")
	@ResponseBody
	public String changeScheduleChecked(String scheduleChecked, String scheduleNo) {
		log.info(scheduleChecked);
		Schedule schedule = new Schedule();
		schedule.setScheduleNo(Integer.parseInt(scheduleNo));
		if(scheduleChecked.equals("true")) {
			schedule.setScheduleChecked(true);
		} else {
			schedule.setScheduleChecked(false);
		}
		scheduleService.updateChecked(schedule);
		return "메롱";
	}

	/**
	 * 일정 조회
	 * @param scheduleNo
	 * @return
	 */
	@RequestMapping("/getSchedule")
	@ResponseBody
	public Schedule getSchedule(String scheduleNo) {
		Schedule schedule = scheduleService.getSchedule(scheduleNo);
		return schedule;
	}
	
	/**
	 * 일정 수정
	 * @param scheduleNo
	 * @param scheduleName
	 * @param scheduleComment
	 * @param scheduleStartDate
	 * @param scheduleEndDate
	 * @param scheduleColor
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("updateSchedule")
	public String updateSchedule(
			@RequestParam String scheduleNo,
			@RequestParam String scheduleName,
			@RequestParam String scheduleComment,
			@RequestParam String scheduleStartDate,
			@RequestParam String scheduleEndDate,
			@RequestParam String scheduleColor) throws Exception {
		
		Schedule schedule = new Schedule();
		schedule.setScheduleNo(Integer.parseInt(scheduleNo));
		schedule.setScheduleName(scheduleName);
		schedule.setScheduleComment(scheduleComment);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		/*if(!startDate.equals("")) {
			task.setTaskStartDate(sdf.parse(startDate));
		}*/
		schedule.setScheduleStartDate(sdf.parse(scheduleStartDate));
		schedule.setScheduleEndDate(sdf.parse(scheduleEndDate));
		schedule.setScheduleColor(scheduleColor);
		
		scheduleService.updateSchedule(schedule);
		
		return "redirect:/mySchedule";
	}
	/**
	 * 일정 수정
	 * @param scheduleNo
	 * @param scheduleName
	 * @param scheduleComment
	 * @param scheduleStartDate
	 * @param scheduleEndDate
	 * @param scheduleColor
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("updateScheduleMainPage")
	public String updateScheduleMainPage(
			@RequestParam String scheduleNo,
			@RequestParam String scheduleName,
			@RequestParam String scheduleComment,
			@RequestParam String scheduleStartDate,
			@RequestParam String scheduleEndDate,
			@RequestParam String scheduleColor,
			@RequestParam String role) throws Exception {
		
		Schedule schedule = new Schedule();
		schedule.setScheduleNo(Integer.parseInt(scheduleNo));
		schedule.setScheduleName(scheduleName);
		schedule.setScheduleComment(scheduleComment);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		/*if(!startDate.equals("")) {
			task.setTaskStartDate(sdf.parse(startDate));
		}*/
		schedule.setScheduleStartDate(sdf.parse(scheduleStartDate));
		schedule.setScheduleEndDate(sdf.parse(scheduleEndDate));
		schedule.setScheduleColor(scheduleColor);
		
		scheduleService.updateSchedule(schedule);
		
		if(role.equals("ROLE_ADMIN")) {
			return "redirect:/indexAdmin";
		}else if(role.equals("ROLE_CLIENT")) {
			return "redirect:/indexClient";
		}else if(role.equals("ROLE_PM")) {
			return "redirect:/indexPM";
		}else {
			return "redirect:/indexPE";
		}
	}
	
	/**
	 * 일정 삭제
	 * @param scheduleNo
	 * @return
	 */
	@RequestMapping("/deleteSchedule")
	public String deleteSchedule(@RequestParam String scheduleNo) {
		scheduleService.deleteSchedule(scheduleNo);
		return "redirect:/mySchedule";
	}
	
	/**
	 * 일정 삭제
	 * @param scheduleNo
	 * @param role
	 * @return
	 */
	@RequestMapping("/deleteScheduleMainPage")
	public String deleteScheduleMainPage(@RequestParam String scheduleNo,
										 @RequestParam String role) {
		scheduleService.deleteSchedule(scheduleNo);
		if(role.equals("ROLE_ADMIN")) {
			return "redirect:/indexAdmin";
		}else if(role.equals("ROLE_CLIENT")) {
			return "redirect:/indexClient";
		}else if(role.equals("ROLE_PM")) {
			return "redirect:/indexPM";
		}else {
			return "redirect:/indexPE";
		}
	}
	
}
