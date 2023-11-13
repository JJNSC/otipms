package com.otipms.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Component;

import com.otipms.service.EmployeeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {
	@Autowired
	private EmployeeService employeeService;
	
	@Override
	public void onLogoutSuccess(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Authentication authentication) throws IOException, ServletException {
		
		log.info("로그아웃 실행");
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		employeeService.updateEmployeeStatusLogout(Integer.parseInt(empDetails.getUsername()));
		
		super.onLogoutSuccess(request, response, authentication);
	}
}

