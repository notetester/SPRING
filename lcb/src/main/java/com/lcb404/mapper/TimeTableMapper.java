package com.lcb404.mapper;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.lcb404.command.SeatNumVO;
import com.lcb404.command.TimeTableVO;

public interface TimeTableMapper {
	public List<TimeTableVO> getTime(Date d);
	public TimeTableVO getPoster(int timetable_number);
	public int total(SeatNumVO seatNum);
}
