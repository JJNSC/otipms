package com.otipms.controller;

import java.io.IOException;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.otipms.dto.Employee;
import com.otipms.dto.MediaFile;
import com.otipms.service.EmployeeService;
import com.otipms.service.EmployeeService.LoginResult;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProfileController {
	@Autowired
	public EmployeeService employeeService;
	
	/**
	 * 프로필 수정 페이지로 이동
	 * @param model
	 * @return
	 */
	@RequestMapping("/profile")
	public String profile(Model model) {
		log.info("프로필");
		//model.addAttribute("employee", LoginController.loginEmployee);
		
		Employee employee = employeeService.selectProfileEmp(LoginController.loginEmployee.getEmpId());
		model.addAttribute("employee", employee);
	    model.addAttribute("base64Img", LoginController.profileImg);
	    model.addAttribute("mf", LoginController.multipartFile);
		
		if(employee.getMediaFileData() != null) {
			String base64Img = Base64.getEncoder().encodeToString(employee.getMediaFileData());
			model.addAttribute("base64Img", base64Img);
		}
		return "profile/profile";
	}
	
	@RequestMapping("/updatePassword")
	@ResponseBody
	public String updatePassword(String password, String newPassword) {
		Employee employee = new Employee();
		employee.setEmpId(LoginController.loginEmployee.getEmpId());
		employee.setEmpPw(password);
		
		LoginResult loginResult = employeeService.login(employee);
		if(loginResult == LoginResult.SUCCESS) {
			employee.setEmpPw(newPassword);
			employeeService.modifyPassword(employee);
			return "success";
		} else if(loginResult == LoginResult.FAIL_PASSWORD_WRONG) {
			return "fail";
		}
		return null;
	}
	
	@RequestMapping("/updateProfile")
	//@ResponseBody
	public ResponseEntity<String> updateProfile(@RequestParam("image") MultipartFile imageFile) throws IOException {
		MediaFile mediaFile = new MediaFile();
		mediaFile.setEmpId(LoginController.loginEmployee.getEmpId());
		mediaFile.setMediaFileName("Profile");
		mediaFile.setMediaFileType(imageFile.getContentType());
		mediaFile.setMediaFileData(imageFile.getBytes());
		
		employeeService.updateProfileImg(mediaFile);
		return ResponseEntity.ok("{\"message\": \"이미지 업로드 성공\"}");
	}
	
	@RequestMapping("/indexTest")
	public String indextTest(Model model) {
		log.info("메인 테스트 페이지");
		model.addAttribute("employee", LoginController.loginEmployee);
	    model.addAttribute("base64Img", LoginController.profileImg);
	    model.addAttribute("mf", LoginController.multipartFile);
		return "indexTest";
	}
}
