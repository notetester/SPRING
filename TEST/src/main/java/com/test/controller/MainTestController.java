package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainTestController {
	@RequestMapping("/")
	public String HelloWorld() {
		return "HelloWorld";
	}
}
