package com.otipms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.otipms.dao.EmployeeDao;
import com.otipms.dto.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao employeeDao;

	@Override
	public void AddEmploy(Employee employee) {
		employeeDao.insertEmployee(employee);
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

}
