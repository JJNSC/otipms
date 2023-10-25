package com.otipms.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.otipms.dao.EmployeeDao;
import com.otipms.dto.Employee;
import com.otipms.service.EmployeeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpDetailsService implements UserDetailsService {
	@Autowired
	private EmployeeDao employeeDao;	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		int empId = Integer.parseInt(username);
		System.out.println(empId);
		Employee employee = employeeDao.selectByEmployeeId(empId);
		log.info(" employee : "+employee);
		if(employee == null) {
			throw new UsernameNotFoundException(username);
		}
		
		/*
		List<String> listRole = memberDao.getRole("mid");
		한 사람이 여러개 권한을 가질 수 있기 때문에 사람에 따른 role만을 가져와서 
		authorities가 리스트인 거고, add할 때도 여러번 해야 함 !
		*/
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(employee.getRole()));
		
		EmpDetails employeeDetails = new EmpDetails(employee, authorities);
		return employeeDetails;
	}
}

