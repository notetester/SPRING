package com.lcb404.service;


import java.util.List;

import com.lcb404.command.ReserveVO;
import com.lcb404.command.SeatNumVO;
import com.lcb404.command.TimeTableVO;

public interface ReserveService {
	public int setSeat(SeatNumVO seatNum);
	public List<ReserveVO> getList(int timetable_number);
	public List<TimeTableVO> getTime(String day);
	public TimeTableVO getPoster(int timetable_number);
	public int total(SeatNumVO seatNum);
}
