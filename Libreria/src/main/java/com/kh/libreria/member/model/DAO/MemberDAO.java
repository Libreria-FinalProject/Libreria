package com.kh.libreria.member.model.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.member.model.vo.Card;
import com.kh.libreria.member.model.vo.Member;
import com.kh.libreria.member.model.vo.Money;

@Repository("mDAO")
public class MemberDAO {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int checkIdDup(SqlSessionTemplate sqlSession, String mem_email) {
		return sqlSession.selectOne("memberMapper.checkIdDup", mem_email);
	}
	
	public int checkPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.checkPwd", m);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String mem_email) {
		return sqlSession.selectOne("memberMapper.checkPwd", mem_email);
	}
	public int leaveMember(SqlSessionTemplate sqlSession, int no_leave) {
		return sqlSession.update("memberMapper.leaveMember", no_leave);
	}

	public int updateLoginDate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateLoginDate", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}
	 
	public int getMoneyListCount(SqlSessionTemplate sqlSession, int mem_no) {
		return sqlSession.selectOne("memberMapper.getMoneyListCount", mem_no);
	}

	public ArrayList<Money> confirmMoney(SqlSessionTemplate sqlSession, int mem_no, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.confirmMoney", mem_no, rowBounds);
	}

	public Card getRegistedCard(SqlSessionTemplate sqlSession, int mem_no) {
		return sqlSession.selectOne("memberMapper.getRegistedCard", mem_no);
	}

	public int changeCard(SqlSessionTemplate sqlSession, int mem_no) {
		return sqlSession.update("memberMapper.changeCard",mem_no);
	}

	public int newCard(SqlSessionTemplate sqlSession, Card card) {
		return sqlSession.insert("memberMapper.insertNewCard", card);
	}

	public int buyMoney(SqlSessionTemplate sqlSession, HashMap<String, String> charge_info) {
		return sqlSession.insert("memberMapper.buyMoney", charge_info);
	}

	public int matchCardInfo(SqlSessionTemplate sqlSession, Card card) {
		return sqlSession.selectOne("memberMapper.matchCardInfo", card);
	}

	public int updateMemberMoney(SqlSessionTemplate sqlSession,HashMap<String, String> charge_info) {
		return sqlSession.update("memberMapper.updateMemberMoney", charge_info);
	}

	public ArrayList<Book> getSellList(SqlSessionTemplate sqlSession, int mem_no, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.getSellList", mem_no, rowBounds);
	}

	public int getSellListCount(SqlSessionTemplate sqlSession, int mem_no) {
		return sqlSession.selectOne("memberMapper.getSellListCount", mem_no);
	}

	public ArrayList<Book> getBuyList(SqlSessionTemplate sqlSession, int mem_no, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.getBuyList", mem_no, rowBounds);
	}

	public int getBuyListCount(SqlSessionTemplate sqlSession, int mem_no) {
		return sqlSession.selectOne("memberMapper.getBuyListCount", mem_no);
	}

	public int checkEmail(SqlSessionTemplate sqlSession, String mem_email) {
		return sqlSession.selectOne("memberMapper.checkEmail", mem_email);
	}

	public Member loginMemberWithKakao(SqlSessionTemplate sqlSession, String kakaoEmail) {
		return sqlSession.selectOne("memberMapper.loginMemberWithKakao", kakaoEmail);
	}

	public Member idSearch(SqlSessionTemplate sqlSession,String mem_email){
		return sqlSession.selectOne("memberMapper.idSearch", mem_email);
	}

	public int pwSearch(SqlSessionTemplate sqlSession,HashMap<String, String> charge_info) {
		return sqlSession.update("memberMapper.pwSearch", charge_info);
	}

	public String getMemberEmail(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.getMemberEmail", m);
	}

}
