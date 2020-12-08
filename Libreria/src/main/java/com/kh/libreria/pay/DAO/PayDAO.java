package com.kh.libreria.pay.DAO;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.Review;
import com.kh.libreria.member.model.vo.Member;
import com.kh.libreria.pay.model.vo.BasketList;



@Repository("pDAO")
public class PayDAO {

	public int insertBasket(HashMap<String, Integer> map, SqlSessionTemplate sqlSession) {
		System.out.println("DAO map " + map);
		System.out.println("DAO추가가 작동되었습니다.");
		return sqlSession.insert("payMapper.insertBasket", map);
	}

	public int deleteBasket(HashMap<String, Integer> map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("payMapper.deleteBasket", map);
	}


	public ArrayList<BasketList> BasketList(Member user, SqlSessionTemplate sqlSession) {
		System.out.println((ArrayList)sqlSession.selectList("payMapper.BasketList",user));
		return (ArrayList)sqlSession.selectList("payMapper.BasketList",user);
		
	}

	public int checkBasket(HashMap<String, Integer> map, SqlSessionTemplate sqlSession) {
		
		if(sqlSession.selectOne("payMapper.checkBasket",map) == null) {
			return 0;
		}else{
			return 1;
		}
		
	}

	public int deleteBook(HashMap<String, Integer> map, SqlSessionTemplate sqlSession) {
		System.out.println("DAO삭제가 작동되었습니다.");
		System.out.println("DAO delete MAP" + map);
		int result = sqlSession.delete("payMapper.deleteBook",map);
		System.out.println("result" + result);
		return result;
	}

	public int insertBuyBookMutong(HashMap<String, Integer> map, SqlSessionTemplate sqlSession) {
		sqlSession.update("payMapper.BookRateUpdate",map);
		return sqlSession.insert("payMapper.insertBuyBookMutong", map);
	}

	public int insertBuyBookSinyong(HashMap<String, Integer> map, SqlSessionTemplate sqlSession) {
		sqlSession.update("payMapper.BookRateUpdate",map);
		return sqlSession.insert("payMapper.insertBuyBookSinyong", map);
	}

	public int insertBuyBookMileage(HashMap<String, Integer> map, SqlSessionTemplate sqlSession) {
		sqlSession.update("payMapper.BookRateUpdate",map);
		return sqlSession.insert("payMapper.insertBuyBookMileage", map);
	}

	public Book getBookDetailInfo(SqlSessionTemplate sqlSession, int b_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookMapper.getBookDetail",b_no);
	}

	public ArrayList<Review> getReivewList(SqlSessionTemplate sqlSession, int b_no) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("bookMapper.getReivewList",b_no);
	}

}
