package com.lcb404.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("menuevent")
public class EventController {
	
	@RequestMapping("/events")
	public String events() {
		return "/menuevent/events";
		
	}
	
	@RequestMapping("/memberShip")
	public String memberShip() {
		return "/menuevent/memberShip";
		
	}
	
	
	@RequestMapping("/eventDetail1")
	public String eventDetail1() {
		return "/menuevent/eventDetail1";
		
	}
	
	@RequestMapping("/eventDetail2")
	public String eventDetail2() {
		return "/menuevent/eventDetail2";
		
	}
	
	@RequestMapping("/eventDetail3")
	public String eventDetail3() {
		return "/menuevent/eventDetail3";
		
	}
	
	@RequestMapping("/eventDetail4")
	public String eventDetail4() {
		return "/menuevent/eventDetail4";
		
	}
	
	@RequestMapping("/eventDetail5")
	public String eventDetail5() {
		return "/menuevent/eventDetail5";
		
	}
}
