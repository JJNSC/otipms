package com.otipms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.otipms.dto.Employee;
import com.otipms.service.EmployeeService;
import com.otipms.service.EmployeeService.LoginResult;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/")
	public String login() {
		log.info("dd");
		return "login";
	}
	
	@RequestMapping("/imsiMakeId")
	public String imsiMakeId() {
		Employee employee = new Employee();
		employee.setEmpId(1020000);
		PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		employee.setEmpPw(pwEncoder.encode("rhrortk"));
		employee.setEmpName("오 티아이");
		employee.setEmpRank("고객사");
		employee.setRoleNo(3); // 0: 관리자, 1:개발자,2:PM,3: 고객사 
		employee.setTeamNo(1); //1팀, 2팀, 3팀 
		employee.setEmpTel("010-1234-1234");
		employee.setEmpEmail("rhrortk@otipms.com");
		Boolean disabled = false;
		employee.setEmpDisabled(disabled);
		log.info("employee : " + employee);
		employeeService.AddEmploy(employee);
		return "redirect:/";
	}
	
	@RequestMapping("/index")
	public String index() {
		log.info("dd");
		return "index";
	}
	
	@PostMapping("/login")
	public String login(Employee employee, HttpSession session, Model model) {
		LoginResult result = employeeService.login(employee);
		String errorMsg = "";
		if(result == LoginResult.FAIL_ID_WRONG) {
			errorMsg = "잘못된 아이디 입니다.";
		}else if(result == LoginResult.FAIL_PASSWORD_WRONG) {
			errorMsg = "잘못된 비밀번호 입니다.";
		}else {
			Employee dbEmployee = employeeService.getEmployeeInfo(employee.getEmpId());
			session.setAttribute("login", dbEmployee);
			//성공시 메인페이지
			return "redirect:/index";
		}
		//실패시 에러메세지와 함께 로그인 페이지
		model.addAttribute("loginErrMsg", errorMsg);
		return "redirect:/";
	}

}
