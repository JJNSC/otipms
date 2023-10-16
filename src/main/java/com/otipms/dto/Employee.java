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
	private int empTel;
	private String empEmail;
	private Date empLoginDate;
	private Boolean empDisabled;
}
