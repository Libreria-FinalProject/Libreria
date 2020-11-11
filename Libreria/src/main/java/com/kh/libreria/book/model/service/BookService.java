package com.kh.libreria.book.model.service;

import java.util.ArrayList;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;

public interface BookService {

	ArrayList<BookFrameCategory> getBookCate();

	ArrayList<Book> getBookList(int bc_no);

	ArrayList<Book> getBookPopList(int bc_no);
	
	
	

}
