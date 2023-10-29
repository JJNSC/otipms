package com.otipms.dto;

import lombok.Data;

@Data
public class Team {
	private int teamNo;
	private int projectNo;
	private String teamName;
	private String projectName;
	private int empId;
	private String empName;
	private String empRank;
}
