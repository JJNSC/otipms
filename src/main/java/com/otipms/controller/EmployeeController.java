package com.otipms.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.otipms.aop.time.RuntimeCheck;
import com.otipms.dto.Employee;
import com.otipms.dto.ProjectTeams;
import com.otipms.interceptor.Login;
import com.otipms.service.EmployeeService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/employeeManagement")
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@RuntimeCheck
	@RequestMapping("/employeeList")
	public String employeeList(@RequestParam(name="errMsg",required=false,defaultValue="1") String errMsg,Model model) {
		model.addAttribute("employee", LoginController.loginEmployee);
		model.addAttribute("base64Img", LoginController.profileImg);
		model.addAttribute("mf", LoginController.multipartFile);
		if(errMsg.equals("1")) {
			
		}else {
			model.addAttribute("errMsg", errMsg);
		}
		List<ProjectTeams> projectTeamsList = employeeService.getTeamsPerProjects();
		model.addAttribute("projectTeams", projectTeamsList);
		return "employeeManagement/employeeList";
	}
	
	@RuntimeCheck
	@ResponseBody
	@RequestMapping("/employeeListJson")
	public String employeeListJson(@RequestParam(name="project", required=false,defaultValue="0" ) String projectName,
								   @RequestParam(name="team", required=false, defaultValue="0") String teamName) throws JsonProcessingException {
		
		List<Employee> data = new ArrayList<>();
		if(projectName.equals("0")) {
			data = employeeService.getAllEmployee();
		}else if (!projectName.equals("0") && teamName.equals("0")) {
			data = employeeService.getProjectEmployees(projectName);
		}else if(!projectName.equals("0") && !teamName.equals("0")){
			data = employeeService.getProjectTeamEmployees(projectName,teamName);
		}
		
		//data를 json데이터로 바꾸기
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonData = objectMapper.writeValueAsString(data);
		    
		return jsonData;

	}
	
	@RuntimeCheck
	@RequestMapping("/employeeListTest")
	public String employeeListTest() {
		System.out.println("사원 리스트 테스트");
		return "employeeManagement/employeeListTest";
	}
	
	@RuntimeCheck
	@Login
	@RequestMapping("/addAndModifyEmployee")
	public String addAndModifyEmployee() {
		return "employeeManagement/addAndModifyEmployee";
	}
	
	@RuntimeCheck
	@Transactional
	@PostMapping("/singleResgister")
	public String singleResgister(@RequestParam("registerEmpName") String empName, 
								  @RequestParam("registerPosition") String empRank,
								  @RequestParam("registerPhoneNumber") String empTel,
								  @RequestParam("registerProject") String projectName,
								  @RequestParam("registerTeam") String teamName,
								  @RequestParam("registerAuthority") String authorityName,
								  Model model) {
		log.info("teamName : "+ teamName);
		
		//중복 인력 제외(전화번호로 확인)
		if(employeeService.checkEmployeeByTel(empTel)==1) {
			model.addAttribute("errMsg", "이미 등록 된 인력입니다.");
		}else {
			Employee employee = new Employee();
			employee.setEmpName(empName);
			employee.setEmpRank(empRank);
			employee.setEmpTel(empTel);
			if(teamName.equals("")||teamName.equals(null)) {
				
			}else {
				employee.setTeamNo(employeeService.getTeamNo(projectName,teamName));
			}
			employee.setRole(authorityName);
			employeeService.addEmployee(employee);
		}
		return "redirect:/employeeManagement/employeeList";
	}
	
	@RuntimeCheck
	@ResponseBody
	@RequestMapping("/employeeInfoJson")
	public Employee employeeInfoJson(@RequestParam("empId") String empId) {
		log.info("empId : " + empId);
		Employee modifyEmpInfo = employeeService.getEmployeeAllInfo(Integer.parseInt(empId));
		log.info("모달 열때 들어있는 사용자 정보들 : "+modifyEmpInfo);
		return modifyEmpInfo;
	}
	
	@RuntimeCheck
	@ResponseBody
	@RequestMapping("/resetEmpPassword")
	public void resetEmpPassword(@RequestParam("empId") String empId) {
		log.info("비밀번호 초기화할 empId : " + empId);
		employeeService.resetEmployeePassword(Integer.parseInt(empId));
	}
	
	@RuntimeCheck
	@RequestMapping("/modifySingleEmployeeInfo")
	public String modifySingleEmployeeInfo(@RequestParam("empId") int empId,
										 @RequestParam("nowEmpName") String empName,
										 @RequestParam("nowEmpRank") String empRank,
										 @RequestParam("nowEmpTel") String empTel,
										 @RequestParam("nowEmpEmail") String empEmail,
										 @RequestParam("nowProject") int projectNo,
										 @RequestParam("nowTeam") int teamNo,
										 @RequestParam("nowRole") String role) {
		Employee employee = new Employee();
		employee.setEmpId(empId);
		employee.setEmpName(empName);
		employee.setEmpRank(empRank);
		employee.setEmpTel(empTel);
		employee.setEmpEmail(empEmail);
		employee.setTeamNo(teamNo);
		employee.setProjectNo(projectNo);
		employee.setRole(role);
		employeeService.updateEmployeeInfo(employee);
		return "redirect: employeeList";
	}
	
	@RuntimeCheck
	@ResponseBody
	@RequestMapping("/disableEmployee")
	public String disableEmployee(@RequestParam("empId") int empId) {
		employeeService.disableEmployee(empId);
		
		return "/otipms/employeeManagement/employeeList";
	}
	
	@RuntimeCheck
	@ResponseBody
	@RequestMapping("/exportEmployeeToExcel")
	public String exportEmployeeToExcel(@RequestParam(name="projectName", required=false, defaultValue="0")String projectName,
										@RequestParam(name="teamName", required=false, defaultValue="0")String teamName,
										@RequestParam(name="excelFileName", required=false, defaultValue="employeeList")String excelFileName,
										@RequestParam(name="excelSheetName", required=false, defaultValue="employeeList")String excelSheetName) {
	    
		String filePath = "C:\\FileStore";	
		Date currentDate = new Date();
		log.info("projectName : " +projectName );
		log.info("teamName : " +teamName );
		log.info("excelFileName : " +excelFileName );
		log.info("excelSheetName : " +excelSheetName );
		    
		// 날짜와 시간을 원하는 형식으로 포맷합니다.
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd_HHmm");
		String formattedDate = dateFormat.format(currentDate);
		
		System.out.println("현재 날짜와 시간: " + formattedDate);
		String fileNm = excelFileName+formattedDate+".xlsx";
		log.info("엑셀 파일명어캐돠나요 : "+ fileNm);
		
		// 빈 Workbook 생성
        XSSFWorkbook workbook = new XSSFWorkbook();

        // 빈 Sheet를 생성
        XSSFSheet sheet = workbook.createSheet(excelSheetName);
        
        // Sheet를 채우기 위한 데이터들을 Map에 저장
        Map<String, Object[]> data = new TreeMap<>();
        List<Employee> employeeList = new ArrayList<>();
        data.put("1", new Object[]{"사원번호", "사원명", "직책", "연락처", "프로젝트", "팀", "권한","회사명","이메일"});
        int i =2;
        if(projectName.equals("0")) {
        	employeeList = employeeService.getAllEmployee();
        	for(Employee emp : employeeList) {
        		data.put(String.valueOf(i), new Object[]{emp.getEmpId(), emp.getEmpName(), emp.getEmpRank(), emp.getEmpTel(), emp.getProjectName(), emp.getTeamName(), emp.getRole(),emp.getProjectCompanyName(),emp.getEmpEmail()});
        		i++;
        	}
        }else if(!projectName.equals("0")&&teamName.equals("0")) {
        	employeeList = employeeService.getProjectEmployees(projectName);
        	for(Employee emp : employeeList) {
        		data.put(String.valueOf(i), new Object[]{emp.getEmpId(), emp.getEmpName(), emp.getEmpRank(), emp.getEmpTel(), emp.getProjectName(), emp.getTeamName(), emp.getRole(),emp.getProjectCompanyName(),emp.getEmpEmail()});
        		i++;
        	}
        	
        }else if(!projectName.equals("0")&&!teamName.equals("0")) {
        	employeeList = employeeService.getProjectTeamEmployees(projectName,teamName);
        	for(Employee emp : employeeList) {
        		data.put(String.valueOf(i), new Object[]{emp.getEmpId(), emp.getEmpName(), emp.getEmpRank(), emp.getEmpTel(), emp.getProjectName(), emp.getTeamName(), emp.getRole(),emp.getProjectCompanyName(),emp.getEmpEmail()});
        		i++;
        	}
        }
        
        // data에서 keySet를 가져온다. 이 Set 값들을 조회하면서 데이터들을 sheet에 입력한다.
        Set<String> keyset = data.keySet();
        int rownum = 0;

        // 알아야할 점, TreeMap을 통해 생성된 keySet는 for를 조회시, 키값이 오름차순으로 조회된다.
        for (String key : keyset) {
            Row row = sheet.createRow(rownum++);
            Object[] objArr = data.get(key);
            int cellnum = 0;
            for (Object obj : objArr) {
                Cell cell = row.createCell(cellnum++);
                if (obj instanceof String) {
                    cell.setCellValue((String)obj);
                } else if (obj instanceof Integer) {
                    cell.setCellValue((Integer)obj);
                }
            }
        }

        try {
            FileOutputStream out = new FileOutputStream(new File(filePath, fileNm));
            workbook.write(out);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		return "Data received successfully";
	}
	
	@RuntimeCheck
	@RequestMapping("/createAdmin")
	public String createAdmin(@RequestParam("adminId") String empId,
							  @RequestParam("adminPw") String empPw,
							  @RequestParam("adminName") String empName,
							  @RequestParam("adminPosition") String empRank,
							  @RequestParam("adminTel") String empTel,
							  @RequestParam("defaultProfileImage") MultipartFile defaultProfileImage) {
		log.info("empId : "+empId);
		log.info("empPw : "+empPw);
		log.info("empName : "+empName);
		log.info("empRank : "+empRank);
		log.info("defaultProfileImage : "+defaultProfileImage);
		Employee admin = new Employee();
		admin.setEmpId(Integer.parseInt(empId));
		admin.setEmpPw(empPw);
		admin.setEmpName(empName);
		admin.setEmpRank(empRank);
		admin.setEmpTel(empTel);
		admin.setRole("ROLE_ADMIN");
		employeeService.addInitialInfo(admin,defaultProfileImage);
		
		return "redirect:/";
	}
}
