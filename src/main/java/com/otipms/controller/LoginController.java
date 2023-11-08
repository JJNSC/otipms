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
import com.otipms.dto.Board;
import com.otipms.dto.Employee;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Message;
import com.otipms.dto.Pager;
import com.otipms.dto.Project;
import com.otipms.dto.Schedule;
import com.otipms.dto.Task;
import com.otipms.dto.TaskCount;
import com.otipms.dto.Team;
import com.otipms.dto.TeamList;
import com.otipms.interceptor.Login;
import com.otipms.security.EmpDetails;
import com.otipms.service.AlarmService;
import com.otipms.service.BoardService;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;
import com.otipms.service.ProjectService;
import com.otipms.service.ScheduleService;
import com.otipms.service.TaskService;
import com.otipms.service.TeamService;

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
	
	@Autowired
	private TaskService taskService;

	@Autowired
	private TeamService teamService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	public static Employee loginEmployee;

	public static MediaFile multipartFile;
	
	public static String profileImg;
	
	
	@RequestMapping("/")
	public String login() {
		int empCount = employeeService.getEmployeeCount();
		if(empCount==0) {
			return "login/initialAccess";
		}else {
			return "login/login";
		}
	}
	@RequestMapping("/admin")
	public String admin() {
		
		return "login/initialAccess";
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
	@RequestMapping("/indexPM")
	public String indexPM(Model model, HttpSession session, Authentication authentication) {
		//보내야할 데이터 종류 
		//1. 프로젝트 총 업무수, 진행중인 업무수, 완료된 업무수 + %까지
		//2. 프로젝트에 속한 팀 리스트(팀번호, 팀명, 팀장, 팀에 속한 사람들의 완료된 업무수/팀에 속한 사람들의 총 업무수*100
		//3. 공지사항 내용 
		//4. 해당 프로젝트의 고객 정보 (고객명, 고객사, 연락처, 이메일)
		//5. TODOLIST는 은지 끝나고 나서 추가.
		
		
		//로그인한 사람의 정보를 넣어주면 해당 로그인한 사람이 속한 프로젝트의 업무들의 정보를 받아오자.
		int projectNo = taskService.getProjectNo(loginEmployee.getEmpId());
		TaskCount projectTaskCount = taskService.getProjectTaskInfo(projectNo);
		model.addAttribute("projectTaskCount", projectTaskCount);
		
		//프로젝트 정보
		Project project = projectService.selectProjectByProjectNo(projectNo);
		model.addAttribute("project", project);
		
		//해당 프로젝트의 고객 정보 (고객명, 고객사, 연락처, 이메일)
		Employee client = employeeService.getClientInfoByProjectNo(projectNo); 
		model.addAttribute("client", client);
		
		//프로젝트에 속한 팀 리스트(팀번호, 팀명, 팀장, 
		TeamList teamLists = teamService.getTeamListByProjectNoForMainPage(projectNo);
		List<Team> teamList =  teamLists.getTeamList();
		model.addAttribute("teamList", teamList);
		
		//팀에 속한 사람들의 완료된 업무수/팀에 속한 사람들의 총 업무수*100
		List<Double> progressRateList = taskService.getTeamProgressRateList(projectNo);
		model.addAttribute("progressRateList", progressRateList);
		
		//공지사항 내용
		String pageNo;
		String isNull =(String) session.getAttribute("indexPageNo");
		if(isNull==null) {
			pageNo = "1";
			session.setAttribute("indexPageNo", pageNo);
		}else {
			pageNo=(String) session.getAttribute("indexPageNo");
		}
		
		Map<String, Object> boardPagerMap = pageBoardMainPage(pageNo, "공지사항");
		log.info("map이당 " + boardPagerMap);
		model.addAttribute("boardPagerMap", boardPagerMap);
		
		//내 개인 일정 
		List<Schedule> scheduleList = scheduleService.getScheduleList(LoginController.loginEmployee.getEmpId());
	    model.addAttribute("scheduleList", scheduleList);
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
	    int empId = empDetails.getEmployee().getEmpId();
	    
	    List<Alarm> alarm = alarmService.selectAlarmByEmpId(empId);
	    int alarmCnt = alarmService.selectAlarmCountByEmpId(empId).size();
	    int totalAlarmCnt = alarmService.selectAlarmByEmpId(empId).size();
	    
	    model.addAttribute("base64Img", profileImg);
	    model.addAttribute("mf", multipartFile);
	    
	    model.addAttribute("employee", empDetails.getEmployee());
	    model.addAttribute("alarm", alarm);
	    model.addAttribute("alarmCnt", alarmCnt);
	    model.addAttribute("totalAlarmCnt", totalAlarmCnt);
		
		return "indexPM";
	}
	@RequestMapping("/indexClient")
	public String indexClient(Model model, HttpSession session, Authentication authentication) {
		//보내야할 데이터 종류 
		//1. 프로젝트 총 업무수, 진행중인 업무수, 완료된 업무수 + %까지
		//2. 프로젝트에 속한 팀 리스트(팀번호, 팀명, 팀장, 팀에 속한 사람들의 완료된 업무수/팀에 속한 사람들의 총 업무수*100
		//3. 공지사항 내용 
		//4. 해당 프로젝트의 고객 정보 (고객명, 고객사, 연락처, 이메일)
		//5. TODOLIST는 은지 끝나고 나서 추가.
		
		//로그인한 사람의 정보를 넣어주면 해당 로그인한 사람이 속한 프로젝트의 업무들의 정보를 받아오자.
		int projectNo = taskService.getProjectNo(loginEmployee.getEmpId());
		TaskCount projectTaskCount = taskService.getProjectTaskInfo(projectNo);
		model.addAttribute("projectTaskCount", projectTaskCount);
		
		Project project = projectService.selectProjectByProjectNo(projectNo);
		model.addAttribute("project", project);
		
		//해당 프로젝트의 고객 정보 (고객명, 고객사, 연락처, 이메일)
		Employee client = employeeService.getClientInfoByProjectNo(projectNo); 
		model.addAttribute("client", client);
		
		//해당프로젝트의 PM 정보
		Employee pm = new Employee();
		pm.setProjectNo(projectNo);
		pm.setTeamName("PM");
		
		//해당 프로젝트당 PM 이름
		Employee PMInfo = projectService.getEmployeeInfoByProjectNoAndTeamName(pm);
		if(PMInfo==null || PMInfo.equals(null)) {
			PMInfo.setEmpId(0);
			PMInfo.setEmpName("담당자 미 배치");
			PMInfo.setEmpRank("-");
			PMInfo.setEmpTel("-");
			PMInfo.setEmpEmail("-");
			model.addAttribute("pmInfo", PMInfo);
		}else {
			model.addAttribute("pmInfo", PMInfo);
		}
		
		//프로젝트에 속한 팀 리스트(팀번호, 팀명, 팀장, 
		TeamList teamLists = teamService.getTeamListByProjectNo(projectNo);
		List<Team> teamList =  teamLists.getTeamList();
		model.addAttribute("teamList", teamList);
		
		//팀에 속한 사람들의 완료된 업무수/팀에 속한 사람들의 총 업무수*100
		List<Double> progressRateList = taskService.getTeamProgressRateList(projectNo);
		model.addAttribute("progressRateList", progressRateList);
		
		//공지사항 내용
		String pageNo;
		String isNull =(String) session.getAttribute("indexPageNo");
		if(isNull==null) {
			pageNo = "1";
			session.setAttribute("indexPageNo", pageNo);
		}else {
			pageNo=(String) session.getAttribute("indexPageNo");
		}
		
		Map<String, Object> boardPagerMap = pageBoardMainPage(pageNo, "공지사항");
		log.info("map이당 " + boardPagerMap);
		model.addAttribute("boardPagerMap", boardPagerMap);
		
		//내 개인 일정 
		List<Schedule> scheduleList = scheduleService.getScheduleList(LoginController.loginEmployee.getEmpId());
	    model.addAttribute("scheduleList", scheduleList);
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
	    int empId = empDetails.getEmployee().getEmpId();
	    
	    List<Alarm> alarm = alarmService.selectAlarmByEmpId(empId);
	    int alarmCnt = alarmService.selectAlarmCountByEmpId(empId).size();
	    int totalAlarmCnt = alarmService.selectAlarmByEmpId(empId).size();
	    
	    model.addAttribute("base64Img", profileImg);
	    model.addAttribute("mf", multipartFile);
	    
	    model.addAttribute("employee", empDetails.getEmployee());
	    model.addAttribute("alarm", alarm);
	    model.addAttribute("alarmCnt", alarmCnt);
	    model.addAttribute("totalAlarmCnt", totalAlarmCnt);
		
		return "indexClient";
	}
	@RequestMapping("/indexAdmin")
	public String indexAdmin(Model model, HttpSession session, Authentication authentication) {
		//보내야할 데이터 종류 
		//1. 프로젝트 총 업무수, 진행중인 업무수, 완료된 업무수 + %까지
		//2. 프로젝트에 속한 팀 리스트(팀번호, 팀명, 팀장, 팀에 속한 사람들의 완료된 업무수/팀에 속한 사람들의 총 업무수*100
		//3. 공지사항 내용 
		//4. 해당 프로젝트의 고객 정보 (고객명, 고객사, 연락처, 이메일)
		//5. TODOLIST는 은지 끝나고 나서 추가.
		
		//공지사항 내용
		String pageNo;
		String isNull =(String) session.getAttribute("indexPageNo");
		if(isNull==null) {
			pageNo = "1";
			session.setAttribute("indexPageNo", pageNo);
		}else {
			pageNo=(String) session.getAttribute("indexPageNo");
		}
		
		Map<String, Object> boardPagerMap = pageBoardMainPage(pageNo, "공지사항");
		log.info("map이당 " + boardPagerMap);
		model.addAttribute("boardPagerMap", boardPagerMap);
		
		//내 개인 일정 
		List<Schedule> scheduleList = scheduleService.getScheduleList(LoginController.loginEmployee.getEmpId());
	    model.addAttribute("scheduleList", scheduleList);
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
	    int empId = empDetails.getEmployee().getEmpId();
	    
	    List<Alarm> alarm = alarmService.selectAlarmByEmpId(empId);
	    int alarmCnt = alarmService.selectAlarmCountByEmpId(empId).size();
	    int totalAlarmCnt = alarmService.selectAlarmByEmpId(empId).size();
	    
	    model.addAttribute("base64Img", profileImg);
	    model.addAttribute("mf", multipartFile);
	    
	    model.addAttribute("employee", empDetails.getEmployee());
	    model.addAttribute("alarm", alarm);
	    model.addAttribute("alarmCnt", alarmCnt);
	    model.addAttribute("totalAlarmCnt", totalAlarmCnt);
		
		return "indexAdmin";
	}
	@RequestMapping("/indexPE")
	public String indexPE(Model model, HttpSession session, Authentication authentication) {
		//보내야할 데이터 종류 
		//1. 진행전 업무수 , 진행중인 업무수, 완료된 업무수 + %까지
		//2. 본인 업무 리스트
		//3. 공지사항 내용 
		//4. TODOLIST는 은지 끝나고 나서 추가.
		model.addAttribute("me", loginEmployee);
		
		//진행전 업무수 , 진행중인 업무수, 완료된 업무수 + %까지
		TaskCount employeeTaskCount = taskService.getEmployeeTaskCount(loginEmployee.getEmpId());
		model.addAttribute("employeeTaskCount", employeeTaskCount);
		
		//업무 리스트 받아오기 
		List<Task> taskList = taskService.getTaskList(String.valueOf(loginEmployee.getEmpId()));
		model.addAttribute("taskList", taskList);
		
		//공지사항 내용
		String pageNo;
		String isNull =(String) session.getAttribute("indexPageNo");
		if(isNull==null) {
			pageNo = "1";
			session.setAttribute("indexPageNo", pageNo);
		}else {
			pageNo=(String) session.getAttribute("indexPageNo");
		}
		
		Map<String, Object> boardPagerMap = pageBoardMainPage(pageNo, "공지사항");
		log.info("map이당 " + boardPagerMap);
		model.addAttribute("boardPagerMap", boardPagerMap);
		
		//내 개인 일정 
		List<Schedule> scheduleList = scheduleService.getScheduleList(LoginController.loginEmployee.getEmpId());
	    model.addAttribute("scheduleList", scheduleList);
		
	    //헤더의 웹소켓
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
	    int empId = empDetails.getEmployee().getEmpId();
	    
	    List<Alarm> alarm = alarmService.selectAlarmByEmpId(empId);
	    int alarmCnt = alarmService.selectAlarmCountByEmpId(empId).size();
	    int totalAlarmCnt = alarmService.selectAlarmByEmpId(empId).size();
	    
	    model.addAttribute("base64Img", profileImg);
	    model.addAttribute("mf", multipartFile);
	    
	    model.addAttribute("employee", empDetails.getEmployee());
	    model.addAttribute("alarm", alarm);
	    model.addAttribute("alarmCnt", alarmCnt);
	    model.addAttribute("totalAlarmCnt", totalAlarmCnt);
		
		return "indexPE";
	}
	
	/**
	 * 페이지 이동
	 * @param pageNo
	 * @param session
	 * @return
	 */
	@RequestMapping("/moveMainPage")
	@ResponseBody
	public Map<String, Object> movePage(String pageNo, HttpSession session) {
		//여기는 단순 페이지 이동이기 때문에 뭐든 세션에 다 있을 거임!
		session.setAttribute("pageNo", pageNo);
		
		//게시글 목록 페이징
		//HashMap<String, Object> pageBoardpageBoard(String pageNo, String boardType, String inquiryType, String searchType, String searchKeyword)
		Map<String, Object> map = pageBoardMainPage(pageNo, "공지사항");
		log.info("map이당 " + map);
		return map;
	}
	
	private HashMap<String, Object> pageBoardMainPage(String pageNo, String boardType) {
		
		// 게시글 총 개수 (searchType은 null이라도 들어가야 함)
		int totalBoardNum = boardService.getTotalBoardNum(boardType, null, 0, null, null);
		
		// Pager 객체 생성 (게시글 행 수, 페이지 개수, 총 페이지 개수, 페이지 시작 번호) 후 select
		Pager boardPager = new Pager(4, 5, totalBoardNum, Integer.parseInt(pageNo));
		List<Board> boardList = boardService.getBoardList(boardPager, boardType, null, 0, null, null);
		
		//pagination에 필요한 pager와 boardList를 map에 담아서 return 
		HashMap<String, Object> boardPagerMap = new HashMap<String, Object>();
		boardPagerMap.put("boardPager", boardPager);
		boardPagerMap.put("boardList", boardList);
		
		return boardPagerMap;
	}
	
	@RequestMapping("/index")
	public String index(Model model, HttpSession session, Authentication authentication) {
		// 현재 로그인한 사용자의 정보 가져오기
	    EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
	    int empId = empDetails.getEmployee().getEmpId();
	    
	    List<Alarm> alarm = alarmService.selectAlarmByEmpId(empId);
	    int alarmCnt = alarmService.selectAlarmCountByEmpId(empId).size();
	    int totalAlarmCnt = alarmService.selectAlarmByEmpId(empId).size();
	    
	    model.addAttribute("base64Img", profileImg);
	    model.addAttribute("mf", multipartFile);
	    
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
