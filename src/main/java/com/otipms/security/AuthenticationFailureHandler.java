package com.otipms.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationFailureHandler 
	extends SimpleUrlAuthenticationFailureHandler  {
	private static final Logger logger = 
			LoggerFactory.getLogger(AuthenticationFailureHandler.class);
	
	@Override
	public void onAuthenticationFailure(
			HttpServletRequest request, 
			HttpServletResponse response,
			AuthenticationException exception) 
			throws IOException, ServletException {
		
		//로그인 실패후 리다이렉트로 이동할 경로
		//setDefaultFailureUrl("/ch17/loginForm");
		
		super.onAuthenticationFailure(request, response, exception);
	}
}
