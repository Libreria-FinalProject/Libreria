package com.kh.libreria.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.book.model.dao.BookDAO;
import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;
import com.kh.libreria.book.model.vo.BookSort;
import com.kh.libreria.book.model.vo.BookSubCategory;
import com.kh.libreria.book.model.vo.Review;
import com.kh.libreria.common.PageInfo;

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
	
	@Override
	public int updateReview(Review r) {
		// TODO Auto-generated method stub
		return bDAO.updateReview(sqlSession,r);
	}
	@Override
	public int reviewDelete(int rev_no) {
		// TODO Auto-generated method stub
		return bDAO.reviewDelete(sqlSession,rev_no);
	}
	
	@Override
	public int reviewInsert(Review review) {
		// TODO Auto-generated method stub
		return bDAO.reviewInsert(sqlSession,review);
	}
	@Override
	public ArrayList<Review> getReivewListSortLastest(int b_no) {
		// TODO Auto-generated method stub
		return bDAO.getReivewListSortLastest(sqlSession,b_no);
	}
	@Override
	public ArrayList<Review> getReviewSortStarH(int b_no) {
		// TODO Auto-generated method stub
		return  bDAO.getReviewSortStarH(sqlSession,b_no);
	}
	@Override
	public ArrayList<Review> getReviewSortStarL(int b_no) {
		// TODO Auto-generated method stub
		return  bDAO.getReviewSortStarL(sqlSession,b_no);
	}
	@Override
	public int getListCount(int bcf_no) {
		// TODO Auto-generated method stub
		return bDAO.getListCount(sqlSession,bcf_no);
	}
	@Override
	public int getListCountC(int bc_no) {
		// TODO Auto-generated method stub
		return bDAO.getListCountC(sqlSession,bc_no);
	}
	
	@Override
	public ArrayList<Book> selectBookList(PageInfo pi,int bcf_no,int std) {
		// TODO Auto-generated method stub
		return bDAO.selectBookList(sqlSession,pi,bcf_no,std);
	}
	@Override
	public ArrayList<Book> selectBookListC(PageInfo pi, int bc_no,int std) {
		// TODO Auto-generated method stub
		return bDAO.selectBookListC(sqlSession,pi,bc_no,std);
	}
	@Override
	public int getBestListCount(BookSort bs) {
		// TODO Auto-generated method stub
		return bDAO.getBestListCount(sqlSession,bs);
	}
	@Override
	public ArrayList<Book> getBookBestList(PageInfo pi, BookSort bs) {
		// TODO Auto-generated method stub
		return bDAO.getBookBestList(sqlSession,pi,bs);
	}
	@Override
	public int searchlistCount(BookSort bs) {
		// TODO Auto-generated method stub
		return bDAO.getSearchlistCount(sqlSession,bs);
	}
	
	@Override
	public ArrayList<Book> getSearchBookList(PageInfo pi, BookSort bs) {
		// TODO Auto-generated method stub
		return bDAO.getSearchBookList(sqlSession,bs,pi);
	}
	@Override
	public ArrayList<Book> searchBookList(BookSort bs) {
		// TODO Auto-generated method stub
		return bDAO.searchBookList(sqlSession, bs);
	}

	////////////////KH//////////////////
	@Override
	public ArrayList<Book> searchBookList(String b_title) {
		return bDAO.searchBookList(sqlSession, b_title);
	}

	@Override
	public int sellBook(HashMap<String, Integer> sellBook) {
		return bDAO.sellBook(sqlSession, sellBook);
	}

	@Override
	public ArrayList<Book> getRecentBooks() {
		return bDAO.getRecentBooks(sqlSession);
	}

	@Override
	public ArrayList<Book> getBestSellerBooks() {
		return bDAO.getBestSellerBooks(sqlSession);
	}

	@Override
	public ArrayList<Book> getRandomNovelBooks() {
		return bDAO.getRandomNovelBooks(sqlSession);
	}
	
	////////////////KH//////////////////
	

	
}
