package com.otipms.dto;

import java.util.Date;

import lombok.Data;

/**
 * 
 * @author 이은지
 *
 */
@Data
public class Board {
	private int boardNo;
	private int empId;
	private int boardTypeNo;
	private String boardTitle;
	private String boardContent;
	private Date boardWriteDate;
	private Date boardUpdateDate;
	private int boardHitcount;
	private boolean boardDeleted;
	private String mediaFileName;
	private String mediaFileType;
	private byte[] mediaFileData;

	private String boardTypeName;	//공지사항, 질의 등
}
