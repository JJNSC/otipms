package com.otipms.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Alarm {
	private int alarmNo;
	private int empId;
	private String alarmContentCode;
	private String alarmContent;
	private Date alarmDate;
	private int alarmChk;
	private int messageNo;
}
