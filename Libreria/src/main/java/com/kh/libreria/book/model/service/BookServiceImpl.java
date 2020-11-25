package com.kh.libreria.book.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.book.model.dao.BookDAO;
import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;
import com.kh.libreria.book.model.vo.BookSubCategory;
import com.kh.libreria.book.model.vo.Review;

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
	public ArrayList<Book> getBookList(int bcf_no) {
		
		return bDAO.getBookList(sqlSession,bcf_no);
	}
	 
	 
	 @Override
	public ArrayList<Book> getBookPopList(int bcf_no) {
		// TODO Auto-generated method stub
		return bDAO.getBookPopList(sqlSession,bcf_no);
	}
	 
	 @Override
	public ArrayList<BookSubCategory> getBookSubCateList(int bcf_no) {
		// TODO Auto-generated method stub
		return bDAO.getBookSubCateList(sqlSession,bcf_no);
	}
	@Override
	public ArrayList<Book> getBookListsc(int bc_no) {
		// TODO Auto-generated method stub
		return bDAO.getBookListsc(sqlSession,bc_no);
	}
	@Override
	public ArrayList<Book> getBookPopListsc(int bc_no) {
		// TODO Auto-generated method stub
		return bDAO.getBookPopListsc(sqlSession,bc_no);
	} 
	 
	@Override
	public Book getBookDetailInfo(int b_no) {
		
		return bDAO.getBookDetailInfo(sqlSession,b_no);
	}
	
	@Override
	public ArrayList<Review> getReivewList(int b_no) {
		// TODO Auto-generated method stub
		return bDAO.getReivewList(sqlSession,b_no);
	}
	
	
}
