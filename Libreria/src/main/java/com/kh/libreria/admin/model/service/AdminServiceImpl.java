package com.kh.libreria.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.admin.model.DAO.AdminDAO;
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

}
