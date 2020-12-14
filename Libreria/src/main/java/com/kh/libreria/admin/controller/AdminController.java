package com.kh.libreria.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.libreria.admin.model.service.AdminService;
import com.kh.libreria.admin.model.service.AdminServiceImpl;
import com.kh.libreria.admin.model.vo.SellData;
import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.book.model.vo.BookFrameCategory;
import com.kh.libreria.book.model.vo.BookSubCategory;
import com.kh.libreria.book.model.vo.BookWriter;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.common.Pagination;
import com.kh.libreria.image.model.vo.Image;
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
	public ModelAndView adminInsertBook(ModelAndView mv) {
		ArrayList<BookFrameCategory> ganreList = adminService.getBCFList();
		mv.addObject("ganreList", ganreList)
		.setViewName("adminInsertBook");
		return mv;
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
	
	@RequestMapping("getSubGanre.ad")
	@ResponseBody
	public ArrayList<BookSubCategory> getSubGarne(@RequestParam("bcf_no") int bcf_no){
		return adminService.getSubGarne(bcf_no);
	}
	
	@RequestMapping("searchWriter.ad")
	@ResponseBody
	public ArrayList<BookWriter> searchWriter(@RequestParam("writer") String writer){
		ArrayList<BookWriter> writerList= adminService.searchWriter(writer);
		return writerList;
	}
	
	@RequestMapping("insertBook2.ad")
	public String insertBook(Book book, Image i, BookSubCategory cate, HttpServletRequest request,
			@RequestParam("uploadFile") MultipartFile uploadFile) {
		System.out.println(book);
		System.out.println(cate);
		System.out.println(uploadFile.getOriginalFilename());
		
		if(!uploadFile.getOriginalFilename().equals("")) {
			// savaFile() : 파일을 저장할 경로 지정
			String renameFileName = saveFile(uploadFile, request);
			if(renameFileName!=null) {
				i.setOrigin_name(uploadFile.getOriginalFilename());  // 원본 파일명
				i.setChange_name(renameFileName);  // 새로 생성한 파일명
			}
		}
		int result = adminService.insertBookImage(i);
		if(result>0) {
			int result2 = adminService.insertBook(book);		
		}
		return "redirect:insertBook.ad";
	}
	
	public String saveFile(MultipartFile file,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\book_cover";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch(Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	
}
