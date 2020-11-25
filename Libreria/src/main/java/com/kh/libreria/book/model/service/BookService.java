package com.kh.libreria.book.model.service;

import java.util.ArrayList;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;
import com.kh.libreria.book.model.vo.BookSubCategory;
import com.kh.libreria.book.model.vo.Review;

public interface BookService {

	ArrayList<BookFrameCategory> getBookCate();

	ArrayList<Book> getBookList(int bc_no);

	ArrayList<Book> getBookPopList(int bc_no);

	ArrayList<BookSubCategory> getBookSubCateList(int bcf_no);

	ArrayList<Book> getBookListsc(int bc_no);

	ArrayList<Book> getBookPopListsc(int bc_no);

	Book getBookDetailInfo(int b_no);

	ArrayList<Review> getReivewList(int b_no);

	
	
	

}
