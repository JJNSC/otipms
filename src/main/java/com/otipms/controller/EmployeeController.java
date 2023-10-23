package com.otipms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.otipms.dto.Employee;
import com.otipms.interceptor.Login;
import com.otipms.service.EmployeeService;

@Controller
@RequestMapping("/employeeManagement")
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	
	@RequestMapping("/employeeList")
	public String employeeList(@RequestParam(name="errMsg",required=false,defaultValue="1") String errMsg,Model model) {
		if(errMsg.equals("1")) {
			
		}else {
			model.addAttribute("errMsg", errMsg);
		}
		System.out.println("사원 리스트");
		return "employeeManagement/employeeList";
	}
	
	@RequestMapping("/employeeListTest")
	public String employeeListTest() {
		System.out.println("사원 리스트 테스트");
		return "employeeManagement/employeeListTest";
	}
	
	@Login
	@RequestMapping("/addAndModifyEmployee")
	public String addAndModifyEmployee() {
		return "employeeManagement/addAndModifyEmployee";
	}
	
	@Transactional
	@PostMapping("/singleResgister")
	public String singleResgister(@RequestParam("registerEmpName") String empName, 
								  @RequestParam("registerPosition") String empRank,
								  @RequestParam("registerPhoneNumber") String empTel,
								  @RequestParam("registerProject") String projectName,
								  @RequestParam("registerTeam") String teamName,
								  @RequestParam("registerAuthority") String authorityName,
								  Model model) {
		//중복 인력 제외(전화번호로 확인)
		if(employeeService.checkEmployeeByTel(empTel)==1) {
			model.addAttribute("errMsg", "이미 등록 된 인력입니다.");
		}else {
			Employee employee = new Employee();
			employee.setEmpName(empName);
			
			PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			employee.setEmpPw(pwEncoder.encode("0000"));
			employee.setEmpRank(empRank);
			employee.setEmpTel(empTel);
			if(teamName.equals("")||teamName.equals(null)) {
			}else {
				employee.setTeamNo(employeeService.getTeamNo(teamName));
			}
			
			if(authorityName.equals("teamwon")) {
				employee.setRoleNo(3);
			}else if(authorityName.equals("teamjang")){
				employee.setRoleNo(2);
			}else if(authorityName.equals("pm")){
				employee.setRoleNo(1);
			}else if(authorityName.equals("admin")){
				employee.setRoleNo(0);
			}else if(authorityName.equals("gogaeksa")){
				employee.setRoleNo(4);
			}
			employeeService.AddEmploy(employee);
		}
		
		
		
		
		
		
		return "redirect:/employeeManagement/employeeList";
	}
}
