package com.team404.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team404.command.FreeBoardVO;
import com.team404.freeboard.service.FreeBoardService;
import com.team404.util.Criteria;
import com.team404.util.PageVO;

@Controller
@RequestMapping("freeBoard")
public class FreeBoardController {
	@Autowired
	@Qualifier("freeBoardService")
	private FreeBoardService freeBoardService;
//	@RequestMapping("/freeDetail")
//	public String freeDetail(@RequestParam("bno") int bno,Model model) {
//		model.addAttribute("boardContent",freeBoardService.getContent(bno));
//		return "freeBoard/freeDetail";
//	}
//	@RequestMapping("/freeModify")
//	public String freeModify(@RequestParam("bno") int bno,Model model) {
//		model.addAttribute("boardContent",freeBoardService.getContent(bno));
//		return "freeBoard/freeModify";
//	}
	//변경화면, 상세화면을 하나로 묶어서 처리가 가능.
	@RequestMapping({"/freeDetail","/freeModify"})
	public void getContent(@RequestParam("bno") int bno,Model model) {
		model.addAttribute("boardContent",freeBoardService.getContent(bno));
	}
	@RequestMapping("/freeList")
	public String freeList(Model model,Criteria cri,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,@RequestParam(value="amount",required=false,defaultValue="10") int amount) {
		//기본
		//ArrayList<FreeBoardVO>list=freeBoardService.getList();
		//model.addAttribute("boardList",list);
		//페이징
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		ArrayList<FreeBoardVO>list=freeBoardService.getList(cri);//페이지 계산처리
		int total=freeBoardService.getTotal(cri);
		PageVO pageVO=new PageVO(cri,total);//화면에 그려질 페이지네이션 처리
		model.addAttribute("boardList",list);
		model.addAttribute("pageVO",pageVO);
		return "freeBoard/freeList";
	}
	@RequestMapping("/freeRegist")
	public String freeRegist() {
		return "freeBoard/freeRegist";
	}
	@RequestMapping(value="/registForm",method=RequestMethod.POST)
	public String registForm(FreeBoardVO vo,RedirectAttributes RA) {
		freeBoardService.regist(vo);
		RA.addFlashAttribute("msg","정상 등록 처리되었습니다.");
		return "redirect:/freeBoard/freeList";
	}
	@RequestMapping(value="/freeUpdate",method=RequestMethod.POST)
	public String freeUpdate(FreeBoardVO vo,RedirectAttributes RA) {
		int result=freeBoardService.update(vo);
		if(result==1) {
			RA.addFlashAttribute("msg","게시글이 정상 수정 처리되었습니다.");
		}else {
			RA.addFlashAttribute("msg","게시글 수정에 실패했습니다.");
		}
		return "redirect:/freeBoard/freeList";
	}
	@RequestMapping(value="/freeDelete",method=RequestMethod.POST)
	public String freeDelete(FreeBoardVO vo,RedirectAttributes RA) {
		int result=freeBoardService.delete(vo);
		if(result==1) {
			RA.addFlashAttribute("msg","게시글이 정상 삭제 처리되었습니다.");
		}else {
			RA.addFlashAttribute("msg","게시글 삭제에 실패했습니다.");
		}
		return "redirect:/freeBoard/freeList";
	}
}