package com.otipms.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CC {
	private int ccNo;
	private int messageNo;
	private int empId;
	private String empName;
	private String empRank;
	private int ccType;
	private int messageChecked;
	private int messageImportant;
	private int messageStatus;
	private String mediaFileName;
	private String mediaFileType;
	private byte[] mediaFileData;
	private Date ccCheckedDate;
}
