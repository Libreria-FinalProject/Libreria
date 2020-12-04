package com.kh.libreria.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.libreria.book.model.exception.BookException;
import com.kh.libreria.book.model.service.BookService;
import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;
import com.kh.libreria.book.model.vo.BookSubCategory;
import com.kh.libreria.book.model.vo.Review;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.common.Pagination;

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
		
		int recent_bcf = bcf_no;
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
			model.addAttribute("recent_bcf",recent_bcf);
			
			
			return "bookCategoryPage";	
			
		}
		
		
		return "bookCategoryPage";
	}
	@RequestMapping("bookCateSelAllList.bo")
	public ModelAndView bookCateSelAll(@RequestParam(value="page", required=false, defaultValue ="1") Integer page, ModelAndView mv,
			BookSubCategory bsc,BookFrameCategory bfc,@RequestParam(value="sortTypeDetail", defaultValue="1") Integer sortTypeDetail) {
		//북 메인카테고리 전체
		ArrayList<BookFrameCategory> bcfList = bService.getBookCate();
		
		//북 카테고리 큰틀 -- 서브카테고리를 가져오기 위한 int 값 (페이지에서 전송)
		int bcf_no = bfc.getBcf_no();
		int bc_no = bsc.getBc_no();
		
		int recent_bcf = bcf_no;
		int recent_bc = bc_no;
		//해당하는 영역의 서브카테고리 가져오기(공통처리)
		ArrayList<BookSubCategory> bscList = bService.getBookSubCateList(bcf_no);
		
		//이부분 부터 따로 처리하는 메소드 작성필요 
		int sortType = 1;
		//인기순 1 , 최신순 2 , 평점순 3, 리뷰많은순 4
		System.out.println("sortTypeDetail:"+sortTypeDetail);
		//sortTypeDetail = 1;
		
		//페이징 처리
		int currentPage = 1;	
		if(page != null) {
			currentPage = page;
		}
		int listCount = listCount(bc_no,bcf_no);
		//게시물 당 20개씩
		PageInfo pi = Pagination.getBookPageInfo(currentPage, listCount);

		
		ArrayList<Book> bList = sortBookList(pi,bc_no,bcf_no,sortTypeDetail);
		
		
		
		if(bcfList!=null) {
			mv.addObject("bList", bList);
			mv.addObject("bscList",bscList);
			mv.addObject("bcfList",bcfList );
			mv.addObject("recent_bc",recent_bc);
			mv.addObject("recent_bcf",recent_bcf);
			mv.addObject("pi",pi);
			mv.addObject("sortTypeDetail",sortTypeDetail);
			
			//서브메뉴 구분자
			mv.addObject("all",1);
			mv.setViewName("bookCateSelectPage");
		}
		
		return mv;
		
	}
	public int listCount(int bc_no,int bcf_no) {
		int listCount = 0;
		//책 리스트
		if( bc_no == 0) {
			listCount = bService.getListCount(bcf_no);
		}else {
			listCount = bService.getListCountC(bc_no);
		}
		
		
		return listCount;
	}
	public ArrayList<Book> sortBookList(PageInfo pi,int bc_no,int bcf_no,int std){
		ArrayList<Book> bList = null;
		
		if( bc_no == 0) {
			bList = bService.selectBookList(pi,bcf_no,std);
		}else {
			bList = bService.selectBookListC(pi,bc_no,std);
		}
		
		return bList;
	}
	
	@RequestMapping("bookDetail.bo")
	public String bookDetail(Book book,Model model) {
		int b_no = book.getB_no();
		
		//책 정보 가져오기
		Book bDetail = bService.getBookDetailInfo(b_no);
		ArrayList<Review> rList = bService.getReivewList(b_no);
		
//		for(Review r:rList) {
//			System.out.println(rList);
//		}
			model.addAttribute("bDetail",bDetail);
			model.addAttribute("rList",rList);
		return "bookDetailPage";
	}
	@RequestMapping("reviewUpdate.bo")
	@ResponseBody
	public String reviewUpdate(HttpServletResponse response,@RequestParam("rev_no") int rev_no,
			@RequestParam("rev_content") String rev_content) {
		response.setContentType("application/json; charset=UTF-8");
		
		Review r = new Review(rev_no,rev_content);
		
		int result = bService.updateReview(r);
		
		if(result>0) {
			return "success";
		}else {
			throw new BookException("댓글 수정에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("reviewDelete.bo")
	@ResponseBody
	public String reviewDelete(HttpServletResponse response,@RequestParam("rev_no") int rev_no) {
		response.setContentType("application/json; charset=UTF-8");
		
		int result = bService.reviewDelete(rev_no);
		
		if(result>0) {
			return "success";
		}else {
			throw new BookException("댓글삭제에 실패하였습니다");
		}
		
		
	}
	
	@RequestMapping("reviewInsert.bo")
	@ResponseBody
	public String reviewInsert(HttpServletResponse response,Review review,Model model) {
		response.setContentType("application/json; charset=UTF-8");
		
		int result = bService.reviewInsert(review);
		System.out.println(review);
		return "success";
	}
	
	@RequestMapping("reviewSortLastest.bo")
	public void reviewSortLastest(HttpServletResponse response,@RequestParam("b_no") int b_no) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Review> rList = bService.getReivewListSortLastest(b_no);
		System.out.println(rList);
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder df = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = df.create();
		gson.toJson(rList,response.getWriter());
		System.out.println("보내기완료");
		
	}
	@RequestMapping("reviewSortOld.bo")
	public void reviewSortOld(HttpServletResponse response,@RequestParam("b_no") int b_no) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Review> rList = bService.getReivewList(b_no);
		System.out.println(rList);
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder df = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = df.create();
		gson.toJson(rList,response.getWriter());
		
	}
	@RequestMapping("reviewSortStarH.bo")
	public void reviewSortStarH(HttpServletResponse response,@RequestParam("b_no") int b_no) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Review> rList = bService.getReviewSortStarH(b_no);
		System.out.println(rList);
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder df = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = df.create();
		gson.toJson(rList,response.getWriter());
		
	}
	@RequestMapping("reviewSortStarL.bo")
	public void reviewSortStarL(HttpServletResponse response,@RequestParam("b_no") int b_no) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Review> rList = bService.getReviewSortStarL(b_no);
		System.out.println(rList);
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder df = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = df.create();
		gson.toJson(rList,response.getWriter());
		
	}
	
	
	
}
