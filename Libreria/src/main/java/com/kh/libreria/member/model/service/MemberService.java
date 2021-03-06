package com.kh.libreria.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.member.model.DAO.MemberDAO;
import com.kh.libreria.member.model.vo.Card;
import com.kh.libreria.member.model.vo.Member;
import com.kh.libreria.member.model.vo.Money;

public interface MemberService {

	Member loginMember(Member m);

	int checkPwd(Member m);
	
	String checkPwd2(Member m);
	
	int insertMember(Member m);

	int leaveMember(int no_leave);

	int updateLoginDate(Member m);

	int updateMember(Member m);

	ArrayList<Money> confirmMoney(int mem_no, PageInfo pi);

	int getMoneyListCount(int mem_no);

	Card getRegistedCard(int mem_no);

	int changeCard(int mem_no);

	int newCard(Card card);

	int buyMoney(HashMap<String, String> charge_info);

	int matchCardInfo(Card card);

	int updateMemberMoney(HashMap<String, String> charge_info);

	ArrayList<Book> getSellList(int mem_no, PageInfo pi);

	int getSellListCount(int mem_no);

	ArrayList<Book> getBuyList(int mem_no, PageInfo pi);

	int getBuyListCount(int mem_no);

	int checkIdDup(String mem_email);
	
	int idCheck(String mem_email);

	int checkEmail(String mem_email);

	Member loginMemberWtihKakao(String kakaoEmail);

	Member idSearch(String mem_email);

	String getMemberEmail(Member m);

	int getMemberEmailCnt(Member m);

	ArrayList<Member> getMemberList(Member m);

	int findPwEmail(Member m);

	int updatePw(Member m);

	void send_mail(Member m) throws Exception;

	void find_pw(HttpServletResponse response, Member m) throws Exception;

	
}
