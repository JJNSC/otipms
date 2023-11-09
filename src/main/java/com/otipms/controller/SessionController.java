package com.otipms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.otipms.security.EmpDetails;

import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
public class SessionController {

	@Autowired
	private SessionRegistry sessionRegistry;

//EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
	@GetMapping("/logged-in-users")
	public List<String> getLoggedInUsers() {
		List<String> loggedInUsers = new ArrayList<>();
		List<Object> allPrincipals = sessionRegistry.getAllPrincipals();
		List<EmpDetails> empDetailsList = new ArrayList<>();

		for (Object principal : allPrincipals) {
			List<SessionInformation> sessions = sessionRegistry.getAllSessions(principal, false);
			if (sessions != null && !sessions.isEmpty()) {
				loggedInUsers.add(principal.toString());
				log.info("로그인중인사람이없다고?");
			}
			if (principal instanceof EmpDetails) {
				empDetailsList.add((EmpDetails) principal);
			}
		}
		log.info("loggedInUsers : " + loggedInUsers);
		log.info("empDetailsList : " + empDetailsList);
		return loggedInUsers;
	}
}
