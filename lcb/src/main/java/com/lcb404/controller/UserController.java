package com.lcb404.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lcb404.command.KakaoVO;
import com.lcb404.command.UserVO;
import com.lcb404.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	@Qualifier("userService")
	private UserService userService;

	@RequestMapping("/user_join")
	public String user_join() {
		return "user/user_join";
	}

	@RequestMapping("/user_login")
	public String user_login() {
		return "user/user_login";
	}

	@RequestMapping("/user_update")
	public String user_update(UserVO vo, Model model, HttpSession session) {
		vo = userService.userInfo((String) session.getAttribute("MEMBERS_ID"));
		model.addAttribute("UserVO", vo);
		return "user/user_update";
	}

	@RequestMapping("/user_mypage")
	public String user_mypage(HttpSession session, Model model, UserVO vo) {
		String MEMBERS_ID = (String) session.getAttribute("MEMBERS_ID");
		vo.setTicket(5);
		vo.setMEMBERS_GRADE("silver");
		model.addAttribute("UserVO", vo);

		return "user/user_mypage";
	}

	@RequestMapping("/KakaoLogin")
	public String KakaoLogin() {
		return "user/KakaoLogin";
	}
	
	@RequestMapping("/KakaoJoin")
	public String KakaoJoin(KakaoVO vo,Model model,HttpSession session) {
		
		String MEMBERS_ID = vo.getKakao_ID();
		String MEMBERS_PW = "DEFAULT_MEMBERS_PW";
		
		UserVO uservo = new UserVO();
		uservo.setMEMBERS_ID(MEMBERS_ID);
		uservo.setMEMBERS_PW(MEMBERS_PW);
		
		int result = userService.login(uservo);
		if(result == 1) {
			session.setAttribute("MEMBERS_ID", MEMBERS_ID);
			return "redirect:/";
		}else{
			
			model.addAttribute("Kakao_ID", vo.getKakao_ID());
			model.addAttribute("Kakao_Email", vo.getKakao_Email());
			model.addAttribute("Kakao_NickName", vo.getKakao_NickName());
			return "user/KakaoJoin";
			
		}
			
		
		
		
		
	}

	// 회원가입
	@RequestMapping(value = "/joinForm", method = RequestMethod.POST)
	public String joinForm(UserVO vo, RedirectAttributes RA) {

		int result = userService.join(vo);
		if (result == 1) { // 가입성공
			RA.addFlashAttribute("msg", "회원가입을 축하합니다");
		} else {
			RA.addFlashAttribute("msg", "회원가입에 실패했습니다");
		}
		return "redirect:/user/user_login";
	}

	
	  // 카카오 회원가입
	  
	  @RequestMapping(value = "/KakaoJoinForm", method = RequestMethod.POST) 
	  public String KakaoJoinForm(UserVO vo, RedirectAttributes RA) {
	  
		  int result = userService.Kakaojoin(vo); 
		  if (result == 1) { // 가입성공
		  RA.addFlashAttribute("msg", "회원가입을 축하합니다"); 
		  return "redirect:/user/user_login";
		  } else {
		  RA.addFlashAttribute("msg", "이미 등록된 회원 입니다"); 
		   
		  return "redirect:/user/user_login";
		  }
	  }
	 
	@ResponseBody
	@RequestMapping(value = "/IdCheck", method = RequestMethod.POST)
	public int IdCheck(@RequestBody String MEMBERS_ID) {
		return userService.IdCheck(MEMBERS_ID);

	}

	// 로그인
	@RequestMapping(value = "/loginForm", method = RequestMethod.POST)
	public String loginForm(UserVO vo, HttpSession session, RedirectAttributes RA,HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		int result3 = userService.getGrade(vo.getMEMBERS_ID());
		if(result3 == 1){
			RA.addFlashAttribute("msg","관리자입니다.");
		}
		
		
		int result2 = userService.statusCheck(vo.getMEMBERS_ID());
		if(result2 == 1) {
		RA.addFlashAttribute("msg", "카카오 아이디는 카카오로 로그인을 해주세요");
			
			return "redirect:/user/user_login";
		}else {
		
		System.out.println(vo.getMEMBERS_ID());
		System.out.println(vo.getMEMBERS_PW());
		int result = userService.login(vo); // 1이면 로그인, 0이면 실패

		if (result == 1) {

			session.setAttribute("MEMBERS_ID", vo.getMEMBERS_ID()); // 세션에 저장
			return "redirect:/"; // 홈

		} else {
			RA.addFlashAttribute("msg", "아이디 비밀번호를 확인하세요");
			return "redirect:/user/user_login";
		}
		}

	}

	@RequestMapping("/user_logout")
	public String userLogout(HttpSession session) {
		session.invalidate(); // 세션정보 삭제

		return "redirect:/";
	}

	
	 @RequestMapping("/updateForm") 
	 public String ModifyForm(UserVO vo,RedirectAttributes RA) {
	 
		 System.out.println(vo.getMEMBERS_ID());
		 int result = userService.Update(vo);
	 if(result == 0) { RA.addFlashAttribute("msg", "정보 수정이 실패했습니다");
	  
	 }else { RA.addFlashAttribute("msg", "정보 수정이 정상 처리되었습니다");
	  
	 } 
	 return "redirect:/user/user_mypage"; 
	 
	 }
	 

	@RequestMapping("/UserDelete")
	public String UserDelete(UserVO vo, RedirectAttributes RA,HttpSession session) {
		int result = userService.delete(vo.getMEMBERS_ID());
		if (result == 0) {
			RA.addFlashAttribute("msg", "탈퇴에 실패했습니다");
		} else {
			RA.addFlashAttribute("msg", "탈퇴에 성공했습니다");
			session.invalidate(); // 세션정보 삭제
		}

		return "redirect:/";
	}

}
