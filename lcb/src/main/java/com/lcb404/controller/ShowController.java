package com.lcb404.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("show")
public class ShowController {
	
	@RequestMapping("/trailer")
	public String trailer() {
		
		return "show/trailer";
	}
}
