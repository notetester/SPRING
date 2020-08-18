package com.lcb404.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lcb404.command.MissingBoardVO;
import com.lcb404.service.MissingBoardService;
import com.lcb404.utill.Criteria;
import com.lcb404.utill.PageVO;



@Controller
@RequestMapping("missboard")
public class MissingBoardController {

	@Autowired
	private MissingBoardService missingBoardService;

	
	@RequestMapping("/MissingList")
	public String MissingList(Criteria cri,Model model) {
		
		model.addAttribute("MissingBoardList",missingBoardService.MissinggetList(cri) );
		int total = missingBoardService.getTotal(cri);		
		PageVO pageVO = new PageVO(cri,total);
		model.addAttribute("pageVO", pageVO);		
		model.addAttribute("cri", cri);
		
		
		
		return "missboard/MissingList";
	}
	
	
	
	
	
	@RequestMapping("/MissingRegist")
	public String MissingRegist() {
		return "missboard/MissingRegist";
	}
	
	@RequestMapping(value="/MissingRegist",method=RequestMethod.POST)
	public String QNARegist(MissingBoardVO vo,RedirectAttributes RA) {
		
		
		int result = missingBoardService.Missingregist(vo);
		
		if(result == 0) {
			RA.addFlashAttribute("msg", "게시글 등록에 실패했습니다");
			
			}else {
			RA.addFlashAttribute("msg", "게시글 등록이 정상 처리되었습니다");						
			}
		
		
		return "redirect:/missboard/MissingList";
	}
	
	@RequestMapping("/MissingDetail")
	public String MissingDetail(@RequestParam("found_number")int found_number, Model model) {
		MissingBoardVO vo = missingBoardService.getContent(found_number);
		model.addAttribute("MissingBoardVO", vo);
		
		
		return "missboard/MissingDetail";
	}
	
	
	@RequestMapping("/MissingModify")
	public String MissingModify(MissingBoardVO vo, Model model) {
		model.addAttribute("MissingBoardVO", vo);
		return "missboard/MissingModify";
	}
	
	@RequestMapping("/MissingModifyForm")
	public String ModifyForm(MissingBoardVO vo,RedirectAttributes RA) {
		System.out.println("폼컨");
		int result = missingBoardService.Update(vo);
		if(result == 0) {
		RA.addFlashAttribute("msg", "게시글 수정이 실패했습니다");
		
		}else {
		RA.addFlashAttribute("msg", "게시글 수정이 정상 처리되었습니다");						
		}
		return "redirect:/missboard/MissingList";
	}
	
	@RequestMapping("/MissingDelete")
	public String MissingDelete(MissingBoardVO vo,RedirectAttributes RA) {
		
		int result = missingBoardService.delete(vo.getFound_number());
		
		if(result==0) {
			RA.addFlashAttribute("msg", "게시글 삭제가 실패했습니다");			
		}else {
			RA.addFlashAttribute("msg", "게시글 삭제가 성공했습니다");
		}
		return "redirect:/missboard/MissingList";
	}	
	
}
