package com.kh.libreria.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.common.Pagination;
import com.kh.libreria.member.model.exception.MemberException;
import com.kh.libreria.member.model.service.MemberService;
import com.kh.libreria.member.model.vo.Card;
import com.kh.libreria.member.model.vo.Member;
import com.kh.libreria.member.model.vo.Money;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService mService;
	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	 

	@RequestMapping("enrollView.me")
	public String enrollView() {
		logger.debug("회원등록페이지");
		return "InsertMemberForm";
	}
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		logger.debug("로그인페이지");
		return "login";
	}

	@RequestMapping("InsertAgreeOne.me")
	public String InsertMemberAgree1() {
		logger.debug("약관동의");
		return "InsertAgreeOne";
	}

	@RequestMapping("InsertAgreeTwo.me")
	public String InsertMemberAgree2() {
		logger.debug("개인정보동의");
		return "InsertAgreeTwo";
	}
	
	@RequestMapping("enrollViewKakao.me")
	public ModelAndView enrollViewKakao(ModelAndView mv,@RequestParam("kakaoEmail") String kakaoEmail,
			@RequestParam("kakaoName") String kakaoName, @RequestParam("kakaoGender") String kakaoGender){
	
		mv.addObject("kakaoEmail", kakaoEmail);
		mv.addObject("kakaoName", kakaoName);
		mv.addObject("kakaoGender", kakaoGender);
		mv.setViewName("InsertMemberFormWithKakao");
		
		return mv;
	}
	
	@RequestMapping("enroll.me")
	public ModelAndView insertMember(Member m, ModelAndView mv, @RequestParam("post") String post,
																@RequestParam("address1") String address1, 
																@RequestParam("address2") String address2) {
		logger.debug("회원가입성공");
		
		String mem_address = post+"/"+address1+"/"+address2;
		m.setMem_address(mem_address);
		System.out.println(m);
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMem_pw());
		m.setMem_pw(encPwd);
		
		int result = mService.insertMember(m);
		if(result>0) {
			mv.addObject("insert_email", m.getMem_email());
			mv.setViewName("InsertMemberComplete");
		}else {
			throw new MemberException("회원가입에 실패하였습니다. \n다시 시도해주세요.");
		}
		return mv;
	}

	@RequestMapping("InsertMemberComplete.me")
	public String InsertMemberComplete() {
		logger.debug("회원가입성공");
		
		return "InsertMemberComplete";	
	}
	
//	@RequestMapping("checkEmail.me")
//	public void emailCheck(HttpServletResponse response
//			,@RequestParam("mem_email") String mem_email) throws IOException { //requested=false = 반드시 받지 않아도 되게 해본다.
//		int result = mService.checkEmail(mem_email);
//		if(result>0) {
//			response.getWriter().print("1");
//		}else {
//			response.getWriter().print("2");			
//		}
//	}
	
	
	@RequestMapping("checkEmail.me")
	public void emailCheck(String mem_email, HttpServletResponse response) throws IOException {
		boolean isUsable = mService.checkEmail(mem_email) == 0 ? true : false;
		System.out.println(mem_email);
		System.out.println(mService.checkEmail(mem_email));
		System.out.println(isUsable);
		response.getWriter().print(isUsable);
	}

	
	@RequestMapping("idSearch.me")
	public String memberIdSearch() {
		logger.debug("id찾기 폼");
		return "memberIdSearchForm";
		
	}
	@RequestMapping("checkNameTel.me")
	public void checkNameTel(Member m, HttpServletResponse response,ModelAndView mv) throws IOException {
		String mem_email = mService.getMemberEmail(m);
		
		response.getWriter().print(mem_email); 
		
		/* mv.setViewName("memberIdSearchComplete.me"); */
		/* return mv; */
	}
	

	@RequestMapping(value="idSearchComplete.me")
	public ModelAndView memberIdSearchComplete(Member m,ModelAndView mv)  {
		logger.debug("ID 찾기 성공");
		System.out.println(m);
		mv.addObject("searchId",m.getMem_email());
		mv.setViewName("memberIdSearchComplete");
		
		return mv;
	}
	
	
	
	
	@RequestMapping("pwSearch.me")
	public String memberPwSearch() throws Exception{
		logger.debug("비밀번호 찾기");
		return "memberPwSearch";
	}
	
	
	@RequestMapping("findPw.me")
	public String memberPwSearchChange(){
		return "memberPwSearchChange";
	}
	
	
	@RequestMapping("pwSearchComplete.me")
	public String memberPwSearchComplete(){
		logger.debug("ID 변경 성공");
		return "memberPwSearchComplete";
	}
	
//	로그인
	@RequestMapping("login.me") 
	public void loginMember(Member m, Model model,
			HttpServletResponse response) throws IOException{
	
		Member loginUser = mService.loginMember(m);
		if(bcryptPasswordEncoder.matches(m.getMem_pw(), loginUser.getMem_pw())) { 
			int result = mService.updateLoginDate(loginUser);
			logger.info(loginUser.getMem_email());
			logger.info(loginUser.getMem_pw());
			if(result>0){ 
				model.addAttribute("loginUser", loginUser); 
				response.getWriter().print("1");
			}else{
				response.getWriter().print("2");
				//model.addAttribute("message", "로그인에 실패했습니다.");
			}
		} 
	}

//	로그인 암호화
//	@RequestMapping("login.me")
//	public String login(Member m,  Model model) {
//		
//		Member loginUser = mService.loginMember(m);
//		
//		if(bcryptPasswordEncoder.matches(m.getMem_pw(), loginUser.getMem_pw())) {
//			model.addAttribute("loginUser", loginUser);
//			logger.info(loginUser.getMem_email());
//		}else {
//			throw new MemberException("로그인에 실패했습니다.");
//		}
//		return "redirect:/";
//	}
	
	@RequestMapping("loginWithKakao.me")
	public void loginMemberWithKakao(@RequestParam("mem_email") String kakaoEmail,
			HttpServletResponse response, Model model) throws IOException {
		
		Member loginUser = mService.loginMemberWtihKakao(kakaoEmail);
		
		if(loginUser!=null) { 
			int result = mService.updateLoginDate(loginUser);
		  
			if(result>0){ 
				model.addAttribute("loginUser", loginUser); 
				response.getWriter().print("1");
			}else{
				response.getWriter().print("2");
				//model.addAttribute("message", "로그인에 실패했습니다.");
			}
		} 
		
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
	public ModelAndView memberBuy(HttpServletRequest request,ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		int currentPage = 1;
		if(page!=null) {
			currentPage=page;
		}
		
		int mem_no= ((Member)request.getSession().getAttribute("loginUser")).getMem_no();
		
		int listCount = mService.getBuyListCount(mem_no);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Book> buyList = mService.getBuyList(mem_no, pi);
			
		mv.addObject("pi", pi);
		mv.addObject("buyList", buyList);
		mv.setViewName("memberBuy");
		return mv;
	}
	
	@RequestMapping("memberSell.me")
	public ModelAndView memberSell(HttpServletRequest request, 
			@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page!=null) {
			currentPage= page;
		}
			
		int mem_no = ((Member)request.getSession().getAttribute("loginUser")).getMem_no();
		
		int listCount = mService.getSellListCount(mem_no);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Book> sellList = mService.getSellList(mem_no, pi);
				
		mv.addObject("pi", pi);
		mv.addObject("sellList", sellList);
		mv.setViewName("memberSell");
		return mv;
	}
	
	@RequestMapping("registCard.me")
	public ModelAndView registCard(HttpServletRequest request,ModelAndView mv) {
		Member m  = ((Member)request.getSession().getAttribute("loginUser"));
		int mem_no = m.getMem_no();
		
		Card registCard = mService.getRegistedCard(mem_no);
		
		mv.addObject("registCard", registCard);
		mv.setViewName("memberRegistCard");	
		return mv;
	}
	
	@RequestMapping("newCard.me")
	public String newCard(HttpServletRequest request, Card card) {
		
		System.out.println(card);
		int result = mService.newCard(card);
	
		return "redirect:registCard.me";
	}
	
	@RequestMapping("changeCard.me")
	public String changeCard(HttpServletRequest request) {
		Member m = ((Member)request.getSession().getAttribute("loginUser"));
		int mem_no = m.getMem_no();
		
		int result = mService.changeCard(mem_no);
	
		return "redirect:registCard.me";
	}
	
	@RequestMapping("chargeMoney.me")
	public String chargeMoney() {

		return "memberChargeMoney";
	}
	
	@RequestMapping("confirmMoney.me")
	public ModelAndView confirmMoney(HttpServletRequest request, @RequestParam(value = "page" , required=false) Integer page,
			ModelAndView mv ) {
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		Member member = (Member)request.getSession().getAttribute("loginUser");
		int mem_no = member.getMem_no();
	
		int listCount = mService.getMoneyListCount(mem_no);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
	
		ArrayList<Money> moneyList = mService.confirmMoney(mem_no,pi);
		mv.addObject("moneyList", moneyList);
		mv.addObject("pi", pi);
		mv.setViewName("memberConfirmMoney");
		return mv;
	}
	
	/*
	 * @RequestMapping(value="leave.me", produces =
	 * "application/json; charset=utf8")
	 * 
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
		System.out.println(m);
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
	
	@RequestMapping("buyMoney.me")
	public void buyMoney(Card card, HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam("charge_money") String charge_money, @RequestParam("charge_way") String charge_way) throws IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int result = mService.matchCardInfo(card);
		HashMap<String, String> charge_info = new HashMap<String, String>(); 
		charge_info.put("charge_money", charge_money);
		charge_info.put("charge_way", charge_way);
		charge_info.put("mem_no",String.valueOf(m.getMem_no()));

		if(result>0) { // 카드정보 일치시 
			int result2 = mService.buyMoney(charge_info); // 
			if(result2 > 0 ) { // 머니 충전내역 입력 성공 시
				int result3 = mService.updateMemberMoney(charge_info);
				if(result3 > 0) {  // MEMBER 테이블 MONEY 컬럼 최신화
					Member loginUser = mService.loginMember(m);
					model.addAttribute("loginUser", loginUser);
					response.getWriter().print("1"); // 성공 신호 보내기
				}else {
					response.getWriter().print("2"); // 실패 신호 보내기
				}
			}else {
				response.getWriter().print("2"); // 실패 신호 보내기
			}
		}else {
			response.getWriter().print("0"); // 실패 신호 보내기(비밀번호 미일치)
		}
	}
	
	@RequestMapping("buyMoney2.me")
	public void buyMoney2( HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam("charge_money") String charge_money, @RequestParam("charge_way") String charge_way) throws IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		HashMap<String, String> charge_info = new HashMap<String, String>(); 
		charge_info.put("charge_money", charge_money);
		charge_info.put("charge_way", charge_way);
		charge_info.put("mem_no",String.valueOf(m.getMem_no()));

		 // 카드정보 일치시 
			int result2 = mService.buyMoney(charge_info); // 
			if(result2 > 0 ) { // 머니 충전내역 입력 성공 시
				int result3 = mService.updateMemberMoney(charge_info);
				if(result3 > 0) {  // MEMBER 테이블 MONEY 컬럼 최신화
					System.out.println("굿");
					Member loginUser = mService.loginMember(m);
					model.addAttribute("loginUser", loginUser);
					response.getWriter().print("1"); // 성공 신호 보내기
				}else {
					response.getWriter().print("2"); // 실패 신호 보내기
				}
			}else {
				response.getWriter().print("2"); // 실패 신호 보내기
			}
	}
	
	@RequestMapping("buyMoney3.me")
	public void buyMoney3(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("mem_no") int mem_no, @RequestParam("charge_money") String charge_money, 
			@RequestParam("charge_way") String charge_way ) throws IOException {
		
		HashMap<String, String> charge_info = new HashMap<String, String>();
		charge_info.put("mem_no", String.valueOf(mem_no));
		charge_info.put("charge_money", charge_money);
		charge_info.put("charge_way", charge_way);
		
		int result = mService.buyMoney(charge_info);
		if(result>0) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}
		
	}
	

	//////////////////////////////////////////////////////
	
	@RequestMapping("popupPayForCard.me")
	public String popupPayForCard() {
		return "pay/payForCard";
	}
	@RequestMapping("popupPayForDeposit.me")
	public String popupPayForDeposit() {
		return "pay/payForDeposit";
	}
	@RequestMapping("popupPayForReistCard.me")
	public ModelAndView popupPayForRegistCard(@RequestParam("mem_no") int mem_no, ModelAndView mv) {
		Card card = mService.getRegistedCard(mem_no);
		mv.addObject("registCard", card);
		mv.setViewName("pay/payForRegistCard");
		return mv;
		
//		@RequestMapping("InsertMemberForm.me")
//		public String insertMember(@ModelAttribute Member m, @RequestParam("post") String post,
//															 @RequestParam("address1") String address1,
//															 @RequestParam("address2") String address2) {
//			m.setMem_address(post + "/" + address1 + "/" + address2);
//			System.out.println(m);
//			// 비밀번호 평문으로 저장이 될 수 있기 때문에 암호화 처리 필요 ==> 스프링 시큐리티 모듈에서 제공하는 bcrypt 암호화 방식 사용
//			// bcrypt ?
//			// 		1차로 암호화 된 메세지를 수학적 연산을 통해 암호화 된 메세지인 다이제스트 생성
//			//		salt값 ==> 값을 랜덤하게 생성하여 암호화가 계속 다르게 나오도록
//			
//			String encPwd = bcryptPasswordEncoder.encode(m.getMem_pw());
////			System.out.println("encPwd : " + encPwd);
//			m.setMem_pw(encPwd);
//			
//			int result = mService.insertMember(m);
//			
//			if(result > 0) {
//				return "redirect:home.do";
//			} else {
//				throw new MemberException("회원가입에 실패하였습니다.");
//			}
//		}
	//	
//		@RequestMapping("InsertMemberForm.me")
//		public String insertMember(@ModelAttribute Member m, @RequestParam("post") String post,
//															 @RequestParam("address1") String address1,
//															 @RequestParam("address2") String address2) {
//			m.setMem_address(post + "/" + address1 + "/" + address2);
//			System.out.println(m);
//			
//		String encPwd = bcryptPasswordEncoder.encode(m.getMem_pw());
//		m.setMem_pw(encPwd);
	//	
//		int result = mService.insertMember(m);
	//	
//		if(result > 0) {
//			return "redirect:/";
//		} else {
//			throw new MemberException("회원가입에 실패하였습니다.");
//		}
	//}
		

		
//		@RequestMapping("login.me")
//		public String  loginMember(Member m, Model model) {
//			Member loginUser =  mService.loginMember(m);
//			
//			 if(loginUser!=null) {
//				int result = mService.updateLoginDate(loginUser);
	//
//				if(result>0) {
//					model.addAttribute("loginUser", loginUser);
//				}
//			
//			 }
//			 return "redirect:/";
//		}
		
//		@RequestMapping("/member/pwSearch")
//		public String pwSearch(String mem_email, String mem_name, Model model, HttpServletRequest request){
//		Member m = mService.pwSearch(mem_email);
	//
//		if(m == null){
//			model.addAttribute("historyBack", true);
//			model.addAttribute("msg", "해당 회원이 존재하지 않습니다.");
//			return "common/redirect";
//		}
//		if(m.getMem_email().equals(mem_email) == false){
//			model.addAttribute("historyBack", true);
//			model.addAttribute("msg", "이메일이 올바르지 않습니다.");
//			return "common/redirect";
//		}
	//
//		model.addAttribute("historyBack", true);
//		model.addAttribute("msg", String.format("해당 회원의 아이디는 %s 입니다.", m.getMem_email()));
//		}
//		 mService.sendTempLoginPwToEmail(); 
	//	
//		return "common/redirect";
	//}
		
		/*
		 * @RequestMapping("/member/pwSearch") public String pwSearch(String mem_email,
		 * String mem_name, Model model){ Member m = mService.idSearch(mem_name,
		 * mem_email);
		 * 
		 * if(m == null){ model.addAttribute("historyBack", true);
		 * model.addAttribute("msg", "해당 회원이 존재하지 않습니다."); return "common/redirect"; }
		 * if(m.getEmail().equals(mem_email) == false){
		 * model.addAttribute("historyBack", true); model.addAttribute("msg",
		 * "올바르지 않습니다."); return "common/redirect"; }
		 * 
		 * model.addAttribute("historyBack", true); model.addAttribute("msg",
		 * String.format("해당 회원의 아이디는 %s 입니다.", m.getMem_email())); }
		 */
		
		
		
		
//		아이디 중복 확인
//		@RequestMapping(value = "/checkSignup", method = RequestMethod.POST)
//		public @ResponseBody String AjaxView(  
//			        @RequestParam("mem_email") String mem_email){
//			String str = "";
//			int idcheck = mService.idCheck(mem_email);
//			if(idcheck==1){ //이미 존재하는 계정
//				str = "NO";	
//			}else{	//사용 가능한 계정
//				str = "YES";	
//			}
//			return str;
//		}
	}

}
