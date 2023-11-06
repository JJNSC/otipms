package com.otipms.security;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.web.multipart.MultipartFile;

import com.otipms.controller.LoginController;
import com.otipms.dto.MediaFile;
import com.otipms.service.EmployeeService;

import lombok.extern.slf4j.Slf4j;

/*
SimpleUrlAuthenticationSuccessHandler
	로그인 성공후에 무조건 defaultTartUrl으로 이동
SavedRequestAwareAuthenticationSuccessHandler
	로그인 성공후에 사용자가 접근하고자 했던 페이지로 이동
*/

@Slf4j
//public class Ch17AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler  {
public class AuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	@Autowired
	private EmployeeService employeeService;
	
	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.info("실행");
		
		// 현재 로그인한 사용자의 정보 가져오기
	    EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
	    String enteredPassword = request.getParameter("empPw"); // 입력한 비밀번호 가져오기
	    
	    // 비밀번호가 "0000"일 경우에 따라 리다이렉트 경로를 설정
        if ("0000".equals(enteredPassword)) {
            setDefaultTargetUrl("/profile"); // "0000" 비밀번호일 때 리다이렉트할 경로
        } else {
            setDefaultTargetUrl("/index"); // 기본 리다이렉트 경로
        }
        
        if(employeeService.getProfileImgByEmpId(empDetails.getEmployee().getEmpId())!=null) {
        	LoginController.multipartFile = employeeService.getProfileImgByEmpId(empDetails.getEmployee().getEmpId());
        	LoginController.profileImg = Base64.getEncoder().encodeToString(LoginController.multipartFile.getMediaFileData());
	    }else {
	    	LoginController.multipartFile = employeeService.getDefaultImg();
	    	LoginController.profileImg = Base64.getEncoder().encodeToString(LoginController.multipartFile.getMediaFileData());
	    }
        
		LoginController.loginEmployee = empDetails.getEmployee();
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
