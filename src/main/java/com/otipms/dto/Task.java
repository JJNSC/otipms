package com.otipms.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Task {
	private int taskNo;
	private int empId;
	private String taskName;
	private String taskComment;
	private String taskVolume;	// 개인/팀/프로젝트
	private String taskType;	//요구분석, 설계, 구현, 테스트
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date taskStartDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date taskEndDate;
	private String taskStatus;
	private String taskColor;
	private boolean taskDeleted;

	private String projectName;	//프로젝트 이름
	private String teamName;	//팀 이름
	private String empName;		//사원 이름
	private String empRank;		//직급
	private double progressRate;
}
