package com.simple.controller;

//import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simple.command.ScoreVO;
import com.simple.service.ScoreServiceImpl;

@Controller
@RequestMapping("/service")
public class ScoreController {
	//1st
	//private ScoreServiceImpl service=new ScoreServiceImpl();
	//2nd
	//@Resource(name="scoreService")
	@Autowired
	private ScoreServiceImpl scoreService;
	//3rd - @controller, @Service, @Component, @Repository 자동생성어노테이션을 붙이고,
	//해당 패키지를 스캔 명령으로 읽어서 빈으로 생성 후에 자동주입 명령
	//화면처리
	@RequestMapping("/scoreRegist")
	public void scoreRegist() {
		//
	}
	//점수등록 요청
	@RequestMapping("/scoreForm")
	public String scoreForm(ScoreVO vo) {
		scoreService.scoreRegist(vo);
		//처리
		return "service/scoreResult";
	}
	//점수화면 요청
	@RequestMapping("/scoreList")
	public String scoreList(Model model) {
		model.addAttribute("list",scoreService.scoreList());
		return "service/scoreList";
	}
	//점수 삭제 요청
	@RequestMapping("/scoreDelete")
	public String scoreDelete(@RequestParam("num") int num,RedirectAttributes RA) {
		scoreService.scoreDelete(num);
		RA.addFlashAttribute("num",num);
		return "redirect:/service/scoreList";
	}
}
