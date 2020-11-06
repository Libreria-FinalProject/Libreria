package com.kh.libreria.book.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.book.model.dao.BookDAO;
import com.kh.libreria.book.model.vo.BookFrameCategory;

@Service("bService")
public class BookServiceImpl  implements BookService  {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private BookDAO bDAO;

	
	 @Override public BookFrameCategory getBookCate() {
	  
		 BookFrameCategory bcf = bDAO.getBookCate(sqlSession); 
	  return null;
	  
	 }
	

}
