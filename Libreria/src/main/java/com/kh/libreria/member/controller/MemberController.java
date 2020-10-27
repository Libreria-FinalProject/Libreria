package com.kh.libreria.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.libreria.member.model.service.MemberService;
import com.kh.libreria.member.model.vo.Member;

//@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("loginForm.me")
	public String loginForm(Member m) {
		return "login";
	}
	
	@RequestMapping("login.me")
	public String  loginMember(Member m, Model model,HttpServletRequest request) {
		Member loginUser =  mService.loginMember(m);
		
		 if(loginUser!=null) {
			// model.addAttribute("loginUser", loginUser);
			 request.getSession().setAttribute("loginUser", loginUser);
		 }
		 return "redirect:/";
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(SessionStatus status, HttpServletRequest request) {
		request.getSession().invalidate();
		//status.setComplete();
		
		return "redirect:/";
	}
}
