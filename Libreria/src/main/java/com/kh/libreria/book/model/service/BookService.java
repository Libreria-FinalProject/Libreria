package com.kh.libreria.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;
import com.kh.libreria.book.model.vo.BookSubCategory;
import com.kh.libreria.book.model.vo.Review;
import com.kh.libreria.common.PageInfo;

public interface BookService {

	ArrayList<BookFrameCategory> getBookCate();

	ArrayList<Book> getBookList(int bc_no);

	ArrayList<Book> getBookPopList(int bc_no);

	ArrayList<BookSubCategory> getBookSubCateList(int bcf_no);

	ArrayList<Book> getBookListsc(int bc_no);

	ArrayList<Book> getBookPopListsc(int bc_no);

	Book getBookDetailInfo(int b_no);

	ArrayList<Review> getReivewList(int b_no);
	
	int updateReview(Review r);

	int reviewDelete(int rev_no);

	int reviewInsert(Review review);

	ArrayList<Review> getReivewListSortLastest(int b_no);

	ArrayList<Review> getReviewSortStarH(int b_no);

	ArrayList<Review> getReviewSortStarL(int b_no);

	int getListCount(int bcf_no);

	int getListCountC(int bc_no);

	ArrayList<Book> selectBookList(PageInfo pi, int bcf_no,int std);

	ArrayList<Book> selectBookListC(PageInfo pi, int bc_no,int std);
	
	//////////////////////// KH

	ArrayList<Book> searchBookList(String b_title);

	int sellBook(HashMap<String, Integer> sellBook);


}
