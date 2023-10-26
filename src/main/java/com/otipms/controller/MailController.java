package com.otipms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otipms.dto.Message;
import com.otipms.interceptor.Login;
import com.otipms.security.EmpDetails;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;
import com.otipms.service.ProjectService;
import com.otipms.service.TeamService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mail")
public class MailController {
	
	@Autowired
	private TeamService teamService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private MessageService messageService;
	//쪽지 수신함
	@Login
	@RequestMapping("/receivedMail")
	public String receivedMail(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		List<Message> messages = messageService.getMyReceivedMessage(empId);
	    model.addAttribute("messages", messages);
		
		return "mail/receivedMail";
	}
	
	@PostMapping("/updateMessageImportant")
    @ResponseBody
    public String updateMessageImportant(@RequestParam("messageNo") int messageNo, Authentication authentication) {
		try {
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			
			int empId = empDetails.getEmployee().getEmpId();
			
			Message message = new Message();
	        message.setMessageNo(messageNo);
	        message.setEmpId(empId);
	        
	        messageService.toggleMessageImportance(message);
        
        // 성공적으로 업데이트되었음을 클라이언트에 알립니다.
        return "success";
        } catch (Exception e) {
        	e.printStackTrace();
        	return "error";
        }
    }
	
	@PostMapping("/updateMessageTrash")
    @ResponseBody
    public String updateMessageTrash(@RequestParam("messageNo") int messageNo, Authentication authentication) {
		try {
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			
			int empId = empDetails.getEmployee().getEmpId();
			
			Message message = new Message();
	        message.setMessageNo(messageNo);
	        message.setEmpId(empId);
	        
	        messageService.updateMessageTrash(message);
        
        // 성공적으로 업데이트되었음을 클라이언트에 알립니다.
        return "success";
        } catch (Exception e) {
        	e.printStackTrace();
        	return "error";
        }
    }
	
	//쪽지 발신함
	@Login
	@RequestMapping("/sentMail")
	public String sentMail(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		List<Message> messages = messageService.getMySentMessage(empId);
	    model.addAttribute("messages", messages);
		return "mail/sentMail";
	}
	
	//중요 쪽지함
	@Login
	@RequestMapping("/importantMail")
	public String importantMail(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		List<Message> messages = messageService.getMyImportantMessage(empId);
	    model.addAttribute("messages", messages);
		return "mail/importantMail";
	}
	
	//임시 보관함
	@Login
	@RequestMapping("/temporaryMail")
	public String temporaryMail(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		List<Message> messages = messageService.getMyTemporaryMessage(empId);
	    model.addAttribute("messages", messages);
		return "mail/temporaryMail";
	}
	
	//쪽지 휴지통
	@Login
	@RequestMapping("/trashMail")
	public String trashMail(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		List<Message> messages = messageService.getMyTrashMessage(empId);
	    model.addAttribute("messages", messages);
		return "mail/trashMail";
	}
	
	//쪽지 상세 내용
	@Login
	@RequestMapping("/detailMail")
	public String detailMail() {
		log.info("dd");
		return "mail/detailMail";
	}
	
	//쪽지 쓰기
	@Login
	@RequestMapping("/writeMail")
	public String writeMail(Model model) {
	    
	    return "mail/writeMail";
	}
	
	//쪽지 사원 찾기
	@Login
	@RequestMapping("/findEmployee")
	public String findEmployee(Model model) {
	    
	    return "mail/findEmployee";
	}
}
