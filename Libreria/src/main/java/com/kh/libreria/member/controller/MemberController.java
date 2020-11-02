package com.kh.libreria.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
			int result = mService.updateLoginDate(loginUser);

			if(result>0) {
				model.addAttribute("loginUser", loginUser);
			}
		
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
	
	/*
	 * @RequestMapping(value="leave.me", produces =
	 * "application/json; charset=utf8")
	 * @ResponseBody // 리턴값을 페이지명이 아니라 값 자체를 넘길때
	 */	
	@RequestMapping("leave.me")
	public void  leaveMember(String pwd_leave,int no_leave, 
							HttpServletResponse response,SessionStatus session) {
		response.setContentType("application/json; charset=UTF-8");
	
		Member m = new Member();
		m.setMem_no(no_leave);
		m.setMem_pw(pwd_leave);
		JSONObject json = new JSONObject();
	
		int result = mService.checkPwd(m);
		if(result>0) {
			int result2 = mService.leaveMember(no_leave);
			if(result2>0) {
				json.put("message", "회원탈퇴되었습니다. \n감사합니다.");
				json.put("type", "complete");
				session.setComplete();
			}else {
				json.put("message", "회원탈퇴에 실패하였습니다. \n다시 시도해주세요.");
			}
		}else {
			json.put("message", "비밀번호가 일치하지 않습니다. \n다시 시도해주세요.");
		}
		//return json.toJSONString();
		
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("update.me")
	public void updateMember(Member m, @RequestParam("cur_pwd") String cur_pwd, 
			HttpServletResponse response,Model model) throws IOException {
		System.out.println(cur_pwd);
		Member m2 = new Member();
		m2.setMem_no(m.getMem_no());
		m2.setMem_pw(cur_pwd);
		int result = mService.checkPwd(m2);
		System.out.println(result);
		if(result>0) {
			int result2 = mService.updateMember(m);
			if(result2>0) {			
				response.getWriter().print("1");	
				Member loginUser = mService.loginMember(m);
				model.addAttribute("loginUser", loginUser);
				return;
			}else {
				response.getWriter().print("0");	
				return;
			}
		}
		response.getWriter().print("0");	
	
	}

}
