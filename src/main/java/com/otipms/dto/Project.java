package com.otipms.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Project {
	private int projectNo;
	private String projectName;
	private Date projectStartDate;
	private Date projectEndDate;
	private String projectStatus;//작업전, 작업중, 작업완료, 삭제
	private String projectCompanyName;
	private String projectContent;
	private Boolean projectDeleted;
	private int empId;
	private double progressRate;
}
