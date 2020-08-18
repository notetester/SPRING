package com.lcb404.service;



import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.ReserveVO;
import com.lcb404.command.SeatNumVO;
import com.lcb404.command.TimeTableVO;
import com.lcb404.mapper.ReserveMapper;
import com.lcb404.mapper.TimeTableMapper;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	private ReserveMapper reserveMapper;
	
	@Autowired
	private TimeTableMapper timeTableMapper;
	
	@Override
	public int setSeat(SeatNumVO seatNum) {

		return reserveMapper.setSeat(seatNum);
	}

	@Override
	public List<ReserveVO> getList(int timetable_number) {

		return reserveMapper.getList(timetable_number);
	}

	@Override
	public List<TimeTableVO> getTime(String day) {

		String date = "2020-08-"+day;
		
		Date d = Date.valueOf(date);
		
		return timeTableMapper.getTime(d);
	}

	@Override
	public TimeTableVO getPoster(int timetable_number) {

		return timeTableMapper.getPoster(timetable_number);
	}

	@Override
	public int total(SeatNumVO seatNum) {

		return timeTableMapper.total(seatNum);
	}

}
