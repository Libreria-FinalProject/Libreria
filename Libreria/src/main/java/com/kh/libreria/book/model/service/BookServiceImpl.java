package com.kh.libreria.book.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.book.model.dao.BookDAO;
import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;

@Service("bService")
public class BookServiceImpl  implements BookService  {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private BookDAO bDAO;

	
	 @Override public ArrayList<BookFrameCategory> getBookCate() {
	  
	  return bDAO.getBookCate(sqlSession); 
	  
	 }
	
	 @Override
	public ArrayList<Book> getBookList(int bc_no) {
		
		return bDAO.getBookList(sqlSession,bc_no);
	}
	 
	 
	 @Override
	public ArrayList<Book> getBookPopList(int bc_no) {
		// TODO Auto-generated method stub
		return bDAO.getBookPopList(sqlSession,bc_no);
	}
}
