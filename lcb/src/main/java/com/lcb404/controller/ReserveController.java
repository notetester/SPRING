package com.lcb404.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lcb404.command.ReserveVO;
import com.lcb404.command.SeatNumVO;
import com.lcb404.command.TimeTableVO;
import com.lcb404.service.ReserveService;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	
	@RequestMapping("/seatReserve")
	public String seatReserve(@RequestParam("timetable_number") int timetable_number,
							  @RequestParam("movie_code") int movie_code,
							  Model model) {
		
		
		model.addAttribute("list", reserveService.getList(timetable_number));
		model.addAttribute("timetable_number", timetable_number);
		model.addAttribute("movie_code", movie_code);
		
		return "reserve/seatReserve";
	}
	
	@RequestMapping("/theater")
	public String theater() {
		return "reserve/theater";
	}
	
	@RequestMapping("/ticketSchedule")
	public String ticketSchedule(@RequestParam("num") int num, Model model) {
		
		model.addAttribute("num", num);
		return "reserve/ticketSchedule";
	}	
	
	@ResponseBody
	@PostMapping("/reserveSeat")
	public String reserveSeat(SeatNumVO seatNum) {
		
		int result = reserveService.setSeat(seatNum);
		
		if(result==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@PostMapping("/total")
	public int total(@RequestBody SeatNumVO seatNum) {
		System.out.println(seatNum.getTotal());
		return reserveService.total(seatNum);
		
	}
	
	
	@ResponseBody
	@GetMapping("/getTime/{day}")
	public List<TimeTableVO> getTime(@PathVariable("day") String day) {
		
		return reserveService.getTime(day);
	}
	
	@ResponseBody
	@GetMapping("/getSeat/{bno}")
	public List<ReserveVO> getSeat(@PathVariable("bno") int bno) {
		
		return reserveService.getList(bno);
	}
	
	@ResponseBody
	@GetMapping("/getPost/{bno}")
	public TimeTableVO getPost(@PathVariable("bno") int bno) {
		
		return reserveService.getPoster(bno);
	}
	
}
