package com.otipms.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
 * 
 * @author 이은지
 *
 */
@Data
public class BoardComment {
	private int commentNo;
	private int empId;
	private int boardNo;
	private String commentContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date commentWriteDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date commentUpdateDate;
	private boolean commentDeleted;
	
	private String empName;			//작성자
	private String empRank;			//직급
	private Integer teamNo;			//팀번호
	private String teamName;		//팀명
	private byte[] mediaFileData;	//프로필 사진
	private String base64Img;
}
