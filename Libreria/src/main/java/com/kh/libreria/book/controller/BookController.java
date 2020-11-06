package com.kh.libreria.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.libreria.book.model.service.BookService;
import com.kh.libreria.book.model.vo.BookFrameCategory;

@SessionAttributes("loginUser")
@Controller
public class BookController {
	
	
	
	
	 @Autowired private BookService bService;
	 
	 
	 
	
	@RequestMapping("bookCateList.bo")
	public String bookCate() {
		BookFrameCategory bfc = bService.getBookCate();
		
		return "bookCategoryPage";
	}
	
	@RequestMapping("bookDetail.bo")
	public String bookDetail() {
		
		
		return "bookDetailPage";
	}
	
}
