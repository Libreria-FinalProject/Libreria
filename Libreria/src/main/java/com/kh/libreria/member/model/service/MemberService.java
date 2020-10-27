package com.kh.libreria.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.libreria.member.model.DAO.MemberDAO;
import com.kh.libreria.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);
	
	
	
}
