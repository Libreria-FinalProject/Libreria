package com.kh.libreria.book.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.book.model.vo.BookFrameCategory;

@Repository("bDAO")
public class BookDAO {

	public BookFrameCategory getBookCate(SqlSessionTemplate sqlSession) {
	
		BookFrameCategory bfc = sqlSession.selectOne("bookMapper.selectFrameCate");
		
		System.out.println(bfc);
		
		return null;
	}

}
