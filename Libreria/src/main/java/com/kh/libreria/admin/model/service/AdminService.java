package com.kh.libreria.admin.model.service;

import java.util.ArrayList;

import com.kh.libreria.common.PageInfo;
import com.kh.libreria.member.model.vo.Member;

public interface AdminService {

	int getRestMemberListCount();

	ArrayList<Member> getRestMemberList(PageInfo pi);

}
