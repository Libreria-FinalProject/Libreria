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
		int bc_no = bsc.getBc_no();
		
		int recent_bc = bc_no;
		//해당하는 영역의 서브카테고리 가져오기(공통처리)
		ArrayList<BookSubCategory> bscList = bService.getBookSubCateList(bcf_no);
		
		//bc_no( 서브카테고리 선택여부에 따라 bc_no변경됨 )
		ArrayList<Book> bList = null;
		ArrayList<Book> bPopList = null;
		
		//큰 카테고리 선택시
		if(bc_no == 0) {
			//서브카테고리 전체중 신간/ 인기를 나누어 가져옴
			bList = bService.getBookList(bcf_no);
			bPopList = bService.getBookPopList(bcf_no);
		}else {
			//서브카테고리 선택시 해당 bc_no에 맞는 신간/인기를 가져옴
			bList = bService.getBookListsc(bc_no);
			bPopList = bService.getBookPopListsc(bc_no);
		}
		 if(bcfList!=null) {
			
			model.addAttribute("bList",bList );
			model.addAttribute("bscList",bscList);
			model.addAttribute("bPopList",bPopList );
			model.addAttribute("bcfList",bcfList );
			model.addAttribute("recent_bc",recent_bc);
			
			
			return "bookCategoryPage";	
			
		}
		
		
		return "bookCategoryPage";
	}
	
	
	@RequestMapping("bookDetail.bo")
	public String bookDetail(Book book,Model model) {
		int b_no = book.getB_no();
		
		//책 정보 가져오기
		Book bDetail = bService.getBookDetailInfo(b_no);
		model.addAttribute("bDetail",bDetail);
		
		return "bookDetailPage";
	}
	
}
