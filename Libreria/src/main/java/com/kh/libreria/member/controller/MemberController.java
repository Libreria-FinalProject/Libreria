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

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "login";
	}
	
	@RequestMapping("login.me")
	public String  loginMember(Member m, Model model) {
		Member loginUser =  mService.loginMember(m);
		
		 if(loginUser!=null) {
			model.addAttribute("loginUser", loginUser);
		
		 }
		 return "redirect:/";
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(SessionStatus status) {
		status.setComplete();
		
		return "redirect:/";
	}
	
	@RequestMapping("mypage.me")
	public String updateMemberForm() {
		return "updateMemberForm";
	}
	
	@RequestMapping("leaveForm.me")
	public String leaveMemberForm(){
		return "leaveMemberForm";
	}
	
	@RequestMapping("memberBuy.me")
	public String memberBuy() {
		return "memberBuy";
	}
	
	@RequestMapping("memberSell.me")
	public String memberSell() {
		return "memberSell";
	}
	
	@RequestMapping("registCard.me")
	public String registCard() {
		return "memberRegistCard";
	}
	
	@RequestMapping("chargeMoney.me")
	public String chargeMoney() {
		return "memberChargeMoney";
	}
	
	@RequestMapping("confirmMoney.me")
	public String confirmMoney() {
		return "memberConfirmMoney";
	}
	
}
