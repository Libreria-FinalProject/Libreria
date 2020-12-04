package com.kh.libreria.board.controller;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.libreria.board.model.exception.BoardException;
import com.kh.libreria.board.service.FAQService;
import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.common.Pagination;
import com.kh.libreria.image.model.vo.Image;

@Controller
public class FAQController {
	
	@Autowired
	private FAQService fService;

	@RequestMapping("FAQList.bd")
	public ModelAndView FAQList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		 int currentPage = 1; 
		 
		 if(page != null) { 
			 currentPage = page; 
		 }
		 int listCount = fService.getListCount(1);
		 
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		 
		 ArrayList<Board> faqList = fService.selectList(pi, 1);
		 
		 mv.addObject("faqList", faqList); 
		 mv.addObject("pi", pi);
		
		mv.setViewName("FAQlist");
		return mv;
	}
	
	@RequestMapping("FAQSelect.bd")
	public ModelAndView FAQView(@RequestParam("bo_no") int bo_no, ModelAndView mv) {
		Board faq = fService.selectBoard(bo_no);
		if(faq != null ) {
			int result = fService.updateBoardCount(bo_no);
			if(result>0) {
				mv.addObject("faq", faq)
				  .setViewName("FAQview");				
			}
		} else {
			throw new BoardException("FAQ 상세페이지 접속에 실패 하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("deleteBoard.bd")  // 공통으로 사용되는 게시물 삭제 매핑
	public void FAQDelete(@RequestParam("bo_no") int bo_no,
			HttpServletResponse response) throws IOException {
		int result = fService.deleteBoard(bo_no);
		if(result > 0) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("2");
		}
	}
	
	@RequestMapping("FAQWriteForm.bd")
	public String FAQWriteForm() {
		return "FAQwrite";
	}
	
	@RequestMapping("FAQWrite.bd")
	public String NoticeWrite(Board b, Image i ,@RequestParam("uploadFile") MultipartFile uploadFile, 
			HttpServletRequest request) throws IOException {
		
		if(!uploadFile.getOriginalFilename().equals("")) {
			// savaFile() : 파일을 저장할 경로 지정
			String renameFileName = saveFile(uploadFile, request);
			if(renameFileName!=null) {
				i.setOrigin_name(uploadFile.getOriginalFilename());  // 원본 파일명
				i.setChange_name(renameFileName);  // 새로 생성한 파일명
			}
		}
		int result  = fService.insertBoard(b);
	
		if(result > 0) {  //  board insert성공 
			if(i.getOrigin_name()==null) {   // 첨부파일 없을 때
				return "redirect:FAQList.bd"; 
			}else {							// 첨부파일 있을 때
				int result2 = fService.insertImage(i);
				if(result2 > 0) {
					int result3 = fService.insertBoardImg();
					if(result3 > 0 ) {
						return "redirect:FAQList.bd";
					}else {
						throw new BoardException("게시글 작성에 실패하였습니다.");
					}
				}else {
					throw new BoardException("게시글 작성에 실패하였습니다.");
				}
			}
		}else {
			throw new BoardException("게시글 작성에 실패하였습니다.");
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
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
	
	@RequestMapping("searchFAQ.bd")
	public ModelAndView searchFAQ(@RequestParam("search") String search, @RequestParam(value="page", required=false) Integer page,
			ModelAndView mv) {
		int currentPage = 1; 
		 
		 if(page != null) { 
			 currentPage = page; 
		 }
		 HashMap<String, String> map = new HashMap<String, String>();
		 map.put("search", search);
		 map.put("cate", "1");
		 int listCount = fService.getSearchListCount(map);
		 
		 PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> faqList =fService.searchFAQ(map, pi); 
		
		mv.addObject("faqList", faqList)
		.addObject("pi", pi)
		.addObject("search", search)
		.setViewName("FAQlist");
		return mv;
		
	}
}
