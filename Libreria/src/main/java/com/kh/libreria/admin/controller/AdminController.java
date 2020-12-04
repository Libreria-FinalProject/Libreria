package com.kh.libreria.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.libreria.admin.model.service.AdminService;
import com.kh.libreria.admin.model.service.AdminServiceImpl;
import com.kh.libreria.admin.model.vo.SellData;
import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.common.Pagination;
import com.kh.libreria.member.model.vo.Member;
import com.sun.javafx.sg.prism.NGShape.Mode;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("adminpage.ad")
	public ModelAndView adminManageMemberForm(@RequestParam(value = "page" , required=false) Integer page,
			ModelAndView mv) {
		int currentPage = 1;
		if(page!=null) {
			currentPage=page;
		}
		int listCount = adminService.getRestMemberListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> memberList = adminService.getRestMemberList(pi);
		
		mv.addObject("pi",pi);
		mv.addObject("memberList", memberList);
		mv.setViewName("adminManageMember");
		
		return mv;
	}
	
	@RequestMapping("buyBookList.ad")
	public ModelAndView adminBuyBookList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page!=null) {
			currentPage=page;
		}
		int listCount = adminService.getBuyBookListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Book> bookList =adminService.adminBuyBookList(pi);  
		mv.addObject("bookList", bookList);
		mv.addObject("pi", pi);
		mv.setViewName("adminBuyBook");
		return mv;
	}
	
	@RequestMapping("getSellDataInfo.ad")
	@ResponseBody
	public SellData getSellDataInfo(@RequestParam("sell_num") int sell_num,ModelAndView mv) {
		SellData sellData = adminService.getSellDataInfo(sell_num);
		return sellData;
	}
	
	@RequestMapping("buyBook.ad")
	public void admninBuyBook(SellData sd, HttpServletResponse response) throws IOException {
		int result = adminService.decideSell(sd.getSell_num()); // 구매확정날짜 update
		if(result>0) {
			int result2 = adminService.updateBookStock(sd.getB_no()); // 서적 재고 +1 update 
			if(result2>0) {
				int result3 = adminService.updateMemberMoney(sd);
				if(result3>0) {
					response.getWriter().print("1"); // 모든 작업성공;
				}else {
					response.getWriter().print("0");
				}
			}else {
				response.getWriter().print("0");
			}
		}else {
			response.getWriter().print("0");
		}		
	}
	
	
	@RequestMapping("insertBook.ad")
	public String adminInsertBook() {
		return "adminInsertBook";
	}
	
	@RequestMapping("changeResting.ad")
	public void changeResting(@RequestParam("check_mem") String check_mem,
			HttpServletResponse response) throws IOException{
		String[] check_mem_arr = check_mem.split(",");
		for(int i=0; i<check_mem_arr.length; i++) {
			System.out.println(check_mem_arr[i]);

		}
		int result =adminService.changeResting(check_mem_arr);
		if(result>0) {
			
			response.getWriter().print("1");
		}else {
			
			response.getWriter().print("0");
		}
	}
	
}
