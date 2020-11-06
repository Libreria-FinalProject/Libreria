package com.kh.libreria.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.libreria.common.PageInfo;
import com.kh.libreria.member.model.DAO.MemberDAO;
import com.kh.libreria.member.model.vo.Card;
import com.kh.libreria.member.model.vo.Member;
import com.kh.libreria.member.model.vo.Money;

@Service("mService")
public class MemberSeriviceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	
	@Override
	public Member loginMember(Member m) {
		return mDAO.loginMember(sqlSession, m);
	}


	@Override
	public int checkPwd(Member m) {
		return mDAO.checkPwd(sqlSession, m);
	}


	@Override
	public int leaveMember(int no_leave) {
		return mDAO.leaveMember(sqlSession, no_leave);
	}


	@Override
	public int updateLoginDate(Member m) {
		return mDAO.updateLoginDate(sqlSession, m);
	}


	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	@Override
	public int getMoneyListCount(int mem_no) {
		return mDAO.getMoneyListCount(sqlSession, mem_no);
	}
	

	@Override
	public ArrayList<Money> confirmMoney(int mem_no, PageInfo pi) {
		return mDAO.confirmMoney(sqlSession, mem_no, pi);
	}


	@Override
	public Card getRegistedCard(int mem_no) {
		return mDAO.getRegistedCard(sqlSession, mem_no);
	}


	@Override
	public int changeCard(int mem_no) {
		return mDAO.changeCard(sqlSession, mem_no);
	}


	@Override
	public int newCard(Card card) {
		return mDAO.newCard(sqlSession, card);
	}


	@Override
	public int buyMoney(HashMap<String, String> charge_info) {
		return mDAO.buyMoney(sqlSession, charge_info);
	}


	@Override
	public int matchCardInfo(Card card) {
		return mDAO.matchCardInfo(sqlSession, card);
	}


	@Override
	public int updateMemberMoney(HashMap<String, String> charge_info) {
		return mDAO.updateMemberMoney(sqlSession , charge_info);
	}


	



}
