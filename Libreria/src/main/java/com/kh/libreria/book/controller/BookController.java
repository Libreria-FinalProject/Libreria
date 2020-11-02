package com.kh.libreria.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.libreria.book.model.service.BookService;

@SessionAttributes("loginUser")
@Controller
public class BookController {
	
	/*
	 * @Autowired private BookService bService;
	 */
	
	@RequestMapping("bookCateList.bo")
	public String bookCate() {
		
		
		
		
		return "";
	}
	
	
}
