package com.otipms.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otipms.dto.Alarm;
import com.otipms.dto.Employee;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Message;
import com.otipms.interceptor.Login;
import com.otipms.security.EmpDetails;
import com.otipms.service.AlarmService;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private AlarmService alarmService;
	
	public static Employee loginEmployee;
	
	
	@RequestMapping("/")
	public String login() {
		return "login/login";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "login/login";
	}
	
	/*@PostMapping("/login")
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
	}*/
	
	
	/*@RequestMapping("/imsiMakeId")
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
	}*/
	
	@RequestMapping("/index")
	public String index(Model model, HttpSession session, Authentication authentication) {
		// 현재 로그인한 사용자의 정보 가져오기
	    EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
	    int empId = empDetails.getEmployee().getEmpId();
	    
	    List<Alarm> alarm = alarmService.selectAlarmByEmpId(empId);
	    int alarmCnt = alarmService.selectAlarmCountByEmpId(empId).size();
	    int totalAlarmCnt = alarmService.selectAlarmByEmpId(empId).size();
	    if(employeeService.getProfileImgByEmpId(empId)!=null) {
	    	MediaFile mf = employeeService.getProfileImgByEmpId(empId);
	    	String base64Img = Base64.getEncoder().encodeToString(mf.getMediaFileData());
			model.addAttribute("base64Img", base64Img);
			model.addAttribute("mf", mf);
	    }else {
	    	MediaFile mf = employeeService.getDefaultImg();
	    	String base64Img = Base64.getEncoder().encodeToString(mf.getMediaFileData());
			model.addAttribute("base64Img", base64Img);
			model.addAttribute("mf", mf);
	    }
	    
	    model.addAttribute("employee", empDetails.getEmployee());
	    model.addAttribute("alarm", alarm);
	    model.addAttribute("alarmCnt", alarmCnt);
	    model.addAttribute("totalAlarmCnt", totalAlarmCnt);
	    
	    return "index";
	}
	
	@PostMapping("/updateCheckedAlarm")
    @ResponseBody
    public String updateCheckedDate(@RequestParam("alarmNo") int alarmNo, Authentication authentication) {
		try {
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			int empId = empDetails.getEmployee().getEmpId();
			
			Alarm alarm = new Alarm();
	        alarm.setAlarmNo(alarmNo);
	        alarm.setAlarmEmpId(empId);
	        
	        alarmService.updateAlarmChecked(alarm);
	        
	        Alarm falarm = alarmService.getAlarm(alarmNo);
	        
	        int messageNo = falarm.getAlarmMessageNo();
	        
	        Map<String, Object> parameters = new HashMap<>();
	        parameters.put("messageNo", messageNo);
	        parameters.put("empId", empId);
	        
	        Message message = new Message();
	        message = messageService.getCCbyAlarm(parameters);
	        
	        
	        messageService.updateMessageCheckedRec(message);
        
        // 성공적으로 업데이트되었음을 클라이언트에 알립니다.
        return "success";
        } catch (Exception e) {
        	e.printStackTrace();
        	return "error";
        }
    }
}
