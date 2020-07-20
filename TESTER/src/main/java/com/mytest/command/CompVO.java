package com.mytest.command;

import java.sql.Timestamp;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompVO {
	private Timestamp REGDATE;
	private String SECTOR;
	private String COMPTYPE;
	private String ADID;
	private String ADNAME;
	private String CUSNAME;
	private String CUSMAIL;
	private String CUSADD;
	private String TITLE;
	private String COMPCON;
	private String ANS;
	private Timestamp ANSDATE;
	private String STATUS;
	private String MEMO;
	private String IMGFILE;
	private String NFILE;
	private String COMPMARK;
	private int COMPNUM;
}
