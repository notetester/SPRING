package com.lcb404.mapper;


import java.util.List;

import com.lcb404.command.ReserveVO;
import com.lcb404.command.SeatNumVO;
import com.lcb404.command.TimeTableVO;

public interface ReserveMapper {
	public int setSeat(SeatNumVO seatNum);
	public List<ReserveVO> getList(int timetable_number);	
}
