package com.simple.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simple.command.BoardVO;
import com.simple.service.BoardService;

@Controller
@RequestMapping("/service")
public class BoardServiceController {
	@Autowired
	private BoardService boardService;
	@RequestMapping("/boardRegister")
	public String boardRegister() {
		return "service/boardRegister";
	}
	@RequestMapping(value="/boardForm",method=RequestMethod.POST)
	public String boardForm(BoardVO vo) {
		boardService.boardRegist(vo);
		return "service/boardResult";
	}
	@RequestMapping("/boardList")
	public String boardList(Model model) {
		model.addAttribute("list",boardService.getList());
		return "service/boardList";
	}
	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam("num") int num,RedirectAttributes RA) {
		boardService.boardDelete(num);
		RA.addFlashAttribute("num",num);
		return "redirect:/service/boardList";
	}
}
