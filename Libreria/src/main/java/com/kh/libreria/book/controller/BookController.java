package com.kh.libreria.book.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.libreria.book.model.service.BookService;
import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;
import com.kh.libreria.book.model.vo.BookSubCategory;

@SessionAttributes("loginUser")
@Controller
public class BookController {
	
	
	
	
	 @Autowired private BookService bService;
	 
	 
	 
	
	@RequestMapping("bookCateList.bo")
	public String bookCate(Model model,BookSubCategory bsc,BookFrameCategory bfc) {
		
		
		//북 메인카테고리 전체
		ArrayList<BookFrameCategory> bcfList = bService.getBookCate();
		
		//북 카테고리 큰틀 -- 서브카테고리를 가져오기 위한 int 값 (페이지에서 전송)
		int bcf_no = bfc.getBcf_no();
		
		//해당하는 영역의 서브카테고리 가져오기
		ArrayList<BookSubCategory> bscList = bService.getBookSubCateList(bcf_no);
		System.out.println(bscList);
		

		
		
		ArrayList<Book> bList = bService.getBookList(bcf_no);
		ArrayList<Book> bPopList = bService.getBookPopList(bcf_no);
		
		
		 if(bcfList!=null) {
			
			model.addAttribute("bList",bList );
			model.addAttribute("bscList",bscList);
			model.addAttribute("bPopList",bPopList );
			model.addAttribute("bcfList",bcfList );
			
			
			return "bookCategoryPage";	
			
		}
		
		
		return "bookCategoryPage";
	}
	
	@RequestMapping("bookDetail.bo")
	public String bookDetail() {
		
		
		return "bookDetailPage";
	}
	
}
