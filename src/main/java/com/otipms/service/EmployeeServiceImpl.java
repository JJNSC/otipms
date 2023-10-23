package com.otipms.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.otipms.dao.EmployeeDao;
import com.otipms.dto.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao employeeDao;

	@Transactional
	@Override
	public void AddEmploy(Employee employee) {
		employeeDao.insertEmployee(employee);
		System.out.println("employeeId : "+employee.getEmpId());
		//2300XX 형식으로 만들어줍니다.
		LocalDate currentDate = LocalDate.now();
        DateTimeFormatter yearFormatter = DateTimeFormatter.ofPattern("yy");
        String currentYear = currentDate.format(yearFormatter);
        currentYear = currentYear+"00"+Integer.valueOf(employee.getEmpId());
        
		employee.setEmpId(Integer.parseInt(currentYear));
		employeeDao.insertEmployeeInfo(employee);
	}

	@Override
	public LoginResult login(Employee employee) {
		Employee dbEmployee = employeeDao.selectByEmployeeId(employee.getEmpId());
		if(dbEmployee == null) {
			return LoginResult.FAIL_ID_WRONG;
		}
		PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if(pwEncoder.matches(employee.getEmpPw(), dbEmployee.getEmpPw())) {
			return LoginResult.SUCCESS;
		}else {
			return LoginResult.FAIL_PASSWORD_WRONG;
		}
	}

	@Override
	public Employee getEmployeeInfo(int empId) {
		return employeeDao.selectByEmployeeId(empId);
	}

	@Override
	public int getTeamNo(String teamName) {
		return employeeDao.getTeamNoByTeamName(teamName);
	}

	@Override
	public int checkEmployeeByTel(String empTel) {
		return employeeDao.checkEmployeeByTel(empTel);
	}

}
