package com.simple.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/request")
public class ExamController {
	@RequestMapping("/req_quiz01")
	public String req_quiz01() {
		return "request/req_quiz01";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@RequestParam("id") String id,@RequestParam("pw") String pw) {
		if(id.equals("abc123")&&pw.equals("xxx123")) {
			return "request/req_quiz01_ok";
		}else {
			return "request/req_quiz01_no";
		}
	}
}