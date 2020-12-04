package com.kh.libreria.admin.model.service;

import java.util.ArrayList;

import com.kh.libreria.admin.model.vo.SellData;
import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.member.model.vo.Member;

public interface AdminService {

	int getRestMemberListCount();

	ArrayList<Member> getRestMemberList(PageInfo pi);
	

	int changeResting(String[] check_mem_arr);

	ArrayList<Book> adminBuyBookList(PageInfo pi);

	SellData getSellDataInfo(int sell_num);

	int decideSell(int sell_num);

	int updateBookStock(int b_no);

	int updateMemberMoney(SellData sd);

	int getBuyBookListCount();

}
