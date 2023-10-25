package com.otipms.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Employee {
	private int empId;
	private String empPw;
	private int empStatus;
	private String empName;
	private String empRank;
	private int roleNo;
	private int teamNo;
	private String empTel;
	private String empEmail; //이거 필요한가? 필요하다. 고객사 이메일 때문에
	private Date empLoginDate;
	private Boolean empEnabled;
	
	//쿼리문을 위해 생성
	private int projectNo;
	private String projectName;
	private String teamName;
}
