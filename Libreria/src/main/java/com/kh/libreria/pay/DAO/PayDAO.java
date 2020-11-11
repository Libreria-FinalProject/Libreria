package com.kh.libreria.pay.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.member.model.vo.Member;

@Repository("pDAO")
public class PayDAO {

	public int insertBasket(HashMap<String, Integer> map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("payMapper.insertBasket", map);
	}

	public int deleteBasket(HashMap<String, Integer> map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("payMapper.deleteBasket", map);
	}

	public int selectDelete(HashMap<String, Object> map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("payMapper.selectDelete", map);
	}

	




}
