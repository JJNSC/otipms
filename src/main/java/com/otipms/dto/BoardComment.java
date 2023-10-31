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
}
