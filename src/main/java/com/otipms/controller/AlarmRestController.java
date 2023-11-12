package com.otipms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.otipms.aop.time.RuntimeCheck;
import com.otipms.dto.Alarm;
import com.otipms.service.AlarmService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class AlarmRestController {
    
	@Autowired
    private AlarmService alarmService;

    @GetMapping("/alarmCnt")
    public int getAlarmCnt(@RequestParam int empId) {
    	return alarmService.selectAlarmCountByEmpId(empId).size();
    }
    
    @GetMapping("/alarms")
    public List<Alarm> getAlarms(@RequestParam int empId) {
    	return alarmService.selectAlarmByEmpId(empId);
    }
    
    @GetMapping("/alarmTotalCnt")
    public int getAlarmTotalCnt(@RequestParam int empId) {
    	return alarmService.selectAlarmByEmpId(empId).size();
    }
    
    @GetMapping("/alarmChatCnt")
    public int getAlarmChatCnt(@RequestParam int empId) {
    	return alarmService.selectAlarmChatCountByEmpId(empId).size();
    }
    
    @GetMapping("/alarmChat")
    public List<Alarm> getAlarmChat(@RequestParam int empId){
    	return alarmService.selectChatAlarmByEmpId(empId);
    }
}