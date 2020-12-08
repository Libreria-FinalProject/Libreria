package com.kh.libreria.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;
import com.kh.libreria.book.model.vo.BookSort;
import com.kh.libreria.book.model.vo.BookSubCategory;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.book.model.vo.Review;

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
		return (ArrayList)sqlSession.selectList("bookMapper.getBookListsc",bc_no);
	}

	public ArrayList<Book> getBookPopListsc(SqlSessionTemplate sqlSession, int bc_no) {
		return (ArrayList)sqlSession.selectList("bookMapper.getBookPopListsc",bc_no);
	}

	public Book getBookDetailInfo(SqlSessionTemplate sqlSession, int b_no) {
		return sqlSession.selectOne("bookMapper.getBookDetail",b_no);
	}
	public ArrayList<Review> getReivewList(SqlSessionTemplate sqlSession, int b_no) {
		return (ArrayList)sqlSession.selectList("bookMapper.getReivewList",b_no);
	}
	
	public int updateReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.update("bookMapper.updateReview",r);
	}

	public int reviewDelete(SqlSessionTemplate sqlSession, int rev_no) {
		return sqlSession.update("bookMapper.reviewDelete",rev_no);
	}

	public int reviewInsert(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("bookMapper.reviewInsert",review);
	}

	public ArrayList<Review> getReivewListSortLastest(SqlSessionTemplate sqlSession, int b_no) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("bookMapper.getReivewListSortLastest",b_no);
	}

	public ArrayList<Review> getReviewSortStarH(SqlSessionTemplate sqlSession, int b_no) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("bookMapper.getReviewSortStarH",b_no);
	}

	public ArrayList<Review> getReviewSortStarL(SqlSessionTemplate sqlSession, int b_no) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("bookMapper.getReviewSortStarL",b_no);
	}

	public int getListCount(SqlSessionTemplate sqlSession, int bcf_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookMapper.getListCount",bcf_no);
	}

	public int getListCountC(SqlSessionTemplate sqlSession, int bc_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookMapper.getListCountC",bc_no);
	}

	public ArrayList<Book> selectBookList(SqlSessionTemplate sqlSession, PageInfo pi,int bcf_no,int std) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		BookSort bs = new BookSort();
		bs.setBcf_no(bcf_no);
		bs.setStd(std);
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectBookList",bs,rowBounds);
	}

	public ArrayList<Book> selectBookListC(SqlSessionTemplate sqlSession, PageInfo pi, int bc_no,int std) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		BookSort bs = new BookSort();
		bs.setBc_no(bc_no);
		bs.setStd(std);
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectBookListC",bs,rowBounds);
	}
	
	///////////////KH//////////////////
	public ArrayList<Book> searchBookList(SqlSessionTemplate sqlSession, String b_title) {
		return (ArrayList)sqlSession.selectList("bookMapper.searchBookList", b_title);
	}

	public int sellBook(SqlSessionTemplate sqlSession, HashMap<String, Integer> sellBook) {
		return sqlSession.insert("bookMapper.sellBook", sellBook);
	}
	////////////////KH//////////////////

	public int getBestListCount(SqlSessionTemplate sqlSession, BookSort bs) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookMapper.getBestListCount",bs);
	}

	public ArrayList<Book> getBookBestList(SqlSessionTemplate sqlSession, PageInfo pi, BookSort bs) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("bookMapper.getBookBestList",bs,rowBounds);
	}

	

}
