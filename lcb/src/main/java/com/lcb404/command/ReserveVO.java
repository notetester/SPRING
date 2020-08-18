package com.lcb404.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReserveVO {

	private int reservation_number;
	private int timetable_number;
	private String members_id;
	private String reservation_row;
	private String reservation_seat;
	private Timestamp reservation_regdate;
}
