package com.team404.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("test")
public class TestController {
	@RequestMapping("/test")
	public String test() {
		return "test/test";
	}
	@RequestMapping("/test2")
	public String test2() {
		return "test/test2";
	}
}