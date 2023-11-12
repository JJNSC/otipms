package com.otipms.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Alarm {
	private int alarmNo;
	private int alarmEmpId;
	private String alarmContentCode;
	private String alarmContent;
	private Date alarmDate;
	private int alarmChk;
	private int alarmMessageNo;
	private int alarmMessengerNo;
	private int sendempId;
	
	
	//최댓값
	private int MaxAlarmChk;
	private Date MaxAlarmDate;
}
