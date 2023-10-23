package com.otipms.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Message {
	private int messageNo;
	private int empId;
	private String empName;
	private String empRank;
	private String messageContent;
	private String messageTitle;
	private Date messageReservedDate;
	private int messageStatus;
}
