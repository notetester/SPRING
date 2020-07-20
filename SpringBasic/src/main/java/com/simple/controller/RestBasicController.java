package com.simple.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestBasicController {
	//1. RestController는 기본적으로 return에 실린 값이 리졸버 뷰로 전달되는게 아니라, 요청된 주소로 반환합니다.
	@GetMapping(value="/getText",produces="text/plain;charset=utf-8")
	public String getText() {
		return "안녕하세요";
	}
}