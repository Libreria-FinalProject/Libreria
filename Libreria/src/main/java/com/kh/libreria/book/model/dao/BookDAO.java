package com.kh.libreria.book.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.book.model.vo.BookFrameCategory;

@Repository("bDAO")
public class BookDAO {

	public ArrayList<BookFrameCategory> getBookCate(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectFrameCate");
	}

}
