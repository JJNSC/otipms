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
public class Board {
	private int boardNo;
	private int empId;
	private int boardTypeNo;
	private String boardTitle;
	private String boardContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date boardWriteDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date boardUpdateDate;
	private int boardHitcount;
	private boolean boardDeleted;

	private String boardTypeName;		//공지사항, 질의 등
	private String inquiryBoardType;	//질의 게시판의 카테고리 (시스템 관리, 아키텍처, DBA)
	private String empName;				//작성자
	private String empRank;				//직급
	private Integer teamNo;				//팀번호
	private String teamName;			//팀명
	private int commentCount;			//댓글수
	private String mediaFileName;
	private String mediaFileType;
	private byte[] mediaFileData;		//프로필 사진
	private String base64Img;
}
