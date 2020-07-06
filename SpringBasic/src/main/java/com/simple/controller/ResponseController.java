package com.simple.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simple.command.ReqVO;

@Controller
@RequestMapping("/response")
public class ResponseController {
	//화면처리
	@RequestMapping("/res_ex01")
	public String res_ex01() {
		return "response/res_ex01";
	}
	//화면처리
	//model 전달자 - 메서드의 매개변수로 Model을 선언, addAttribute("키","값")을 전달하면 됩니다.
	@RequestMapping("/res_ex02")
	public String res_ex02(Model model) {
		model.addAttribute("servertime",new Date());
		model.addAttribute("name","홍길동");
		return "response/res_ex02";
	}
	//ModelAndView 방식
	//Model에 대한 정보와, 화면에 대한 정보를 따로 저장해서 보내는 방법
	@RequestMapping("/res_ex03")
	public ModelAndView res_ex03() {
		ModelAndView mv=new ModelAndView();
		mv.addObject("servertime",new Date());
		mv.addObject("name","이순신");//데이터 저장
		mv.setViewName("response/res_ex03");//화면 저장
		return mv;
	}
	//ModelAttribute 어노테이션 방법
	//req와 model이 합쳐진 형태
	@RequestMapping("/res_ex04")
	public String res_ex04(@ModelAttribute("id") String id) {
		System.out.println("넘어온 값 : "+id);
		return "response/res_ex04";
	}
	@RequestMapping("/res_ex05")
	public String res_ex05(@ModelAttribute("info") ReqVO vo) {
		System.out.println("넘어온 값 : "+vo.getId());
		System.out.println("넘어온 값 : "+vo.getName());
		return "response/res_ex05";
	}
	//----redirect와 redirectAttribute----
	//화면처리
	@RequestMapping("/res_redirect_login")
	public String res_redirect_login() {
		return "response/res_redirect_login";
	}
	//로그인처리
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@RequestParam("id") String id,@RequestParam("pw") String pw,RedirectAttributes RA) {
		if(id.equals(pw)) {//로그인 성공
			return "response/res_redirect_ok";//성공페이지
		}else {//로그인 실패 -> 다시 로그인 화면으로 이동
			//"redirect:/절대경로" - 다시 컨트롤러를 타게 함. 이때 화면에 값을 전달하고 싶다면
			//RedirectAttributes 객체의 addFlashAttribute를 이용하면 됩니다.
			//리다이렉트시 모델은 전달할 수 없습니다.
			RA.addFlashAttribute("msg","아이디 비밀번호를 확인하실래요?");
			return "redirect:/response/res_redirect_login";
		}
	}
}
