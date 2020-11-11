package com.kh.libreria.book.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;

@Repository("bDAO")
public class BookDAO {

	public ArrayList<BookFrameCategory> getBookCate(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectFrameCate");
	}

	public ArrayList<Book> getBookList(SqlSessionTemplate sqlSession, int bc_no) {
		//테스트
		//ArrayList<Book> bList = (ArrayList)sqlSession.selectList("bookMapper.getBookList",bc_no);
		
		
		return  (ArrayList)sqlSession.selectList("bookMapper.getBookList",bc_no);
	}

	public ArrayList<Book> getBookPopList(SqlSessionTemplate sqlSession, int bc_no) {
//		ArrayList<Book> bList = (ArrayList)sqlSession.selectList("bookMapper.getBookPopList",bc_no);
//		System.out.println(bList);
		//return (ArrayList)sqlSession.selectList("bookMapper.getBookPopList",bc_no);
		return (ArrayList)sqlSession.selectList("bookMapper.getBookPopList",bc_no);
				
	}

}
