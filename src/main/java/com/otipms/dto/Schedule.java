package com.otipms.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Schedule {
	private int scheduleNo;
	private int empId;
	private String scheduleName;
	private String scheduleComment;
	private Date scheduleStartDate;
	private Date scheduleEndDate;
	private String scheduleColor;
	private boolean scheduleChecked;
}
