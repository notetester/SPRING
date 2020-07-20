package com.mytest.test;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mytest.command.CompVO;
import com.mytest.service.BoardService;
import com.mytest.util.Criteria;
import com.mytest.util.PageVO;
@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	@Qualifier("BoardService")
	private BoardService BoardService;
	@RequestMapping("/list")
	public String list(Model model,Criteria cri,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,@RequestParam(value="amount",required=false,defaultValue="10") int amount) {
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		ArrayList<CompVO>list=BoardService.getList(cri);
		int total=BoardService.getTotal(cri);
		PageVO pageVO=new PageVO(cri,total);
		model.addAttribute("boardList",list);
		model.addAttribute("pageVO",pageVO);
		return "board/minwon_list";
	}
	@RequestMapping("/reg")
	public String reg() {
		return "board/minwon_reg";
	}
	@RequestMapping("/regView")
	public String regView() {
		return "board/regView";
	}
}