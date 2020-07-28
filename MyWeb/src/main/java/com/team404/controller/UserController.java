package com.team404.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team404.command.UserVO;
import com.team404.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	@Qualifier("userService")
	private UserService userService;

	
	@RequestMapping("/userJoin")
	public String userJoin() {
		return "user/userJoin"; //devU01TX0FVVEgyMDIwMDcyMzEwMDgyMDEwOTk4MzI=
	}
	
	@RequestMapping("/userLogin")
	public String userLogin() {
		return "user/userLogin";
	}
	
	@RequestMapping("/userMypage")
	public String userMypage(HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
		//마이페이지 진입시 join처리
		
		userService.userInfo(userId);
		
		
		return "user/userMypage";
	}
	
	//일반컨트롤러에서는 return의 결과가 viewResolver로 가게됩니다.
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int userIdCheck(@RequestBody UserVO vo ) {
		
		int result = userService.idCheck(vo);

		return result;
	}
	
	//회원가입
	@RequestMapping(value ="/joinForm", method = RequestMethod.POST)
	public String joinForm(UserVO vo, RedirectAttributes RA) {
		
		
		int result = userService.join(vo);
		if(result == 1) { //가입성공
			RA.addFlashAttribute("msg", "회원가입을 축하합니다");
		} else {
			RA.addFlashAttribute("msg", "회원가입에 실패했습니다");
			
		}

		return "redirect:/user/userLogin";
	}
	
	//로그인
	@RequestMapping(value = "/loginForm", method=RequestMethod.POST)
	public String loginForm(UserVO vo, HttpSession session, RedirectAttributes RA) {
		
		int result = userService.login(vo); //1이면 로그인, 0이면 실패

		if(result == 1) {
			
			session.setAttribute("userId", vo.getUserId()); //세션에 저장
			return "redirect:/"; //홈
			
		} else {
			RA.addFlashAttribute("msg", "아이디 비밀번호를 확인하세요");
			return "redirect:/user/userLogin";
		}

	}
	
	@RequestMapping("/userLogout")
	public String userLogout(HttpSession session) {
		session.invalidate(); //세션정보 삭제

		return "redirect:/";
	}
	
	
	
	
	
	
	
}
