package com.otipms.dto;

import lombok.Data;

@Data
public class TaskEmployee {
	private int empId;
	private String projectName;	//프로젝트 이름
	private String teamName;	//팀 이름
	private String empName;		//사원 이름
	private String empRank;		//직급
	private double progressRate;
}
