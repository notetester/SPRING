package com.team404.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userPhone1;
	private String userPhone2;
	private String userEmail1;
	private String userEmail2;
	private String addrZipNum;
	private String addrBasic;
	private String addrDetail;
	private Timestamp regdate;
	
	
}
