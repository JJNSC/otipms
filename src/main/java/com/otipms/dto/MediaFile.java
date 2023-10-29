package com.otipms.dto;

import lombok.Data;

@Data
public class MediaFile {
	private int mediaFileNo;
	private int empId;
	private int messageNo;
	private int messengerNo;
	private int boardNo;
	private String mediaFileName;
	private String mediaFileType;
	private byte[] mediaFileData;
}
