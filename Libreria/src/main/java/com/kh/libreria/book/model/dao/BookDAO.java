package com.kh.libreria.book.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;
import com.kh.libreria.book.model.vo.BookSubCategory;

@Repository("bDAO")
public class BookDAO {
	
	public ArrayList<BookSubCategory> getBookSubCateList(SqlSessionTemplate sqlSession, int bcf_no) {
		return (ArrayList)sqlSession.selectList("bookMapper.getBookSubCateList",bcf_no);
	}
	
	public ArrayList<BookFrameCategory> getBookCate(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bookMapper.selectFrameCate");
	}

	public ArrayList<Book> getBookList(SqlSessionTemplate sqlSession, int bcf_no) {
		return  (ArrayList)sqlSession.selectList("bookMapper.getBookList",bcf_no);
	}

	public ArrayList<Book> getBookPopList(SqlSessionTemplate sqlSession, int bcf_no) {
		return (ArrayList)sqlSession.selectList("bookMapper.getBookPopList",bcf_no);
				
	}

	public ArrayList<Book> getBookListsc(SqlSessionTemplate sqlSession, int bc_no) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("bookMapper.getBookPopListsc",bc_no);
	}

	public ArrayList<Book> getBookPopListsc(SqlSessionTemplate sqlSession, int bc_no) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("bookMapper.getBookPopListsc",bc_no);
	}

	

}
