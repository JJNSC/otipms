package com.otipms.dto;

import java.util.Date;
import java.util.List;

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
	private int messageImportant;
	private int messageChecked;
	private int mediaFileNo;
	private String mediaFileName;
	private String mediaFileType;
	private int ccType;
	private int ccempId;
	
	//추가
	private int ccNo;
	private Date ccCheckedDate;
	private List<CC> ccList;
	private String profile;
	private List<MediaFile> mediaFile;
	
}
