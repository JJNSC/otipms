package com.otipms.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class Messenger {
	private int messangerNo;
	private int mrNo;					//메신저 방 고유 번호
	private String mrLastChat;			//마지막 대화 내용
	private Date mrDate;				//메신저 방 수정 날짜
	private String messengerContent;    //채팅 내용
	private Date messengerDate;			//채팅 등록 일시
	private int umrReadChatNo;			//마지막으로 채팅 읽은 정보(회원의 메신저 방)
	private int umrState;				//접속 상태
	
	private int empId;					//대상자 id
	private String empName;				//작성자
	private String empRank;				//직급
	private Integer teamNo;				//팀번호
	private String teamName;			//팀명
	private String mediaFileName;
	private String mediaFileType;
	private byte[] mediaFileData;		//프로필 사진
	private String base64Img;
	
	
}
