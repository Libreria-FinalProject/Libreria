package com.kh.libreria.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.admin.model.DAO.AdminDAO;
import com.kh.libreria.admin.model.vo.SellData;
import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.member.model.vo.Member;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Member> getRestMemberList(PageInfo pi) {
		return adminDAO.getRestMemberList(sqlSession, pi);
	}
	
	@Override
	public int getRestMemberListCount() {
		return adminDAO.getRestMemberListCount(sqlSession);
	}

	@Override
	public int changeResting(String[] check_mem_arr) {
		return adminDAO.changeResting(sqlSession, check_mem_arr);
	}

	@Override
	public ArrayList<Book> adminBuyBookList(PageInfo pi) {
		return adminDAO.adminBuyBookList(sqlSession, pi);
	}

	@Override
	public SellData getSellDataInfo(int sell_num) {
		return adminDAO.getSellDataInfo(sqlSession, sell_num);
	}

	@Override
	public int decideSell(int sell_num) {
		return adminDAO.decideSell(sqlSession, sell_num);
	}

	@Override
	public int updateBookStock(int b_no) {
		return adminDAO.updateBookStock(sqlSession, b_no);
	}

	@Override
	public int updateMemberMoney(SellData sd) {
		return adminDAO.updateMemberMoney(sqlSession, sd);
	}

	@Override
	public int getBuyBookListCount() {
		return adminDAO.getBuyBookListCount(sqlSession);
	}

}
