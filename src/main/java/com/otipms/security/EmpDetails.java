package com.otipms.security;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.otipms.dto.Employee;

import lombok.extern.slf4j.Slf4j;

/*
 * 어떤 컬럼이 id이고 password인지를 알려줌
 */
public class EmpDetails extends User  {
	private Employee employee;
	
	//첫번째 파라미터에는 id, 두번째 파라미터에는 password
	public EmpDetails(Employee employee, List<GrantedAuthority> authorities) {	
		//아이디, 패스워드, 사용여부?, 만료여부, 머드라, 잠금여부, 권한
		super(String.valueOf(employee.getEmpId()), employee.getEmpPw(), employee.getEmpEnabled(), 
				true, true, true, authorities);
		this.employee = employee;
	}

	public Employee getEmployee() {
		return employee;
	}
}
