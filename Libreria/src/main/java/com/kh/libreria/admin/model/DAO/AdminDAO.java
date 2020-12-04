package com.kh.libreria.admin.model.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.admin.model.vo.SellData;
import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.member.model.vo.Member;

@Repository("adminDAO")
public class AdminDAO {

	public ArrayList<Member> getRestMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.getRestMemberList", null, rowBounds);
	}

	public int getRestMemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.getRestMemberListCount");
	}

	public int changeResting(SqlSessionTemplate sqlSession, String[] check_mem_arr) {
		return sqlSession.update("memberMapper.changeRestingMember", check_mem_arr);
	}

	public ArrayList<Book> adminBuyBookList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("bookMapper.adminBuyBookList", null, rowBounds);
	}

	public SellData getSellDataInfo(SqlSessionTemplate sqlSession, int sell_num) {
		return sqlSession.selectOne("bookMapper.adminGetSellDataInfo", sell_num);
	}

	public int decideSell(SqlSessionTemplate sqlSession, int sell_num) {
		return sqlSession.update("bookMapper.adminDecideSell", sell_num);
	}

	public int updateBookStock(SqlSessionTemplate sqlSession, int b_no) {
		return sqlSession.update("bookMapper.adminUpdateBookStock", b_no);
	}

	public int updateMemberMoney(SqlSessionTemplate sqlSession, SellData sd) {
		return sqlSession.update("memberMapper.adminUpdateMoney", sd);
	}

	public int getBuyBookListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.adminGetBuyBookListCount");
	}

}
