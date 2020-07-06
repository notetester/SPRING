package com.simple.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/response")
public class ResponseQuizController {
	@RequestMapping("/res_quiz01")
	public String res_quiz01() {
		return "response/res_quiz01";
	}
	@RequestMapping(value="/res_login",method=RequestMethod.POST)
	public String login(@ModelAttribute("id") String id,@ModelAttribute("pw") String pw) {
		if(id.equals("kim12")&&pw.equals("1234")) {
			return "response/res_quiz02";
		}else {
			return "response/res_quiz03";
		}
	}
}
