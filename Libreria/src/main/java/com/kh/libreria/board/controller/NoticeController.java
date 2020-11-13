package com.kh.libreria.board.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.libreria.board.model.exception.BoardException;
import com.kh.libreria.board.model.exception.NoticeException;
import com.kh.libreria.board.service.NoticeService;
import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.common.Pagination;

public class NoticeController {
	
	private NoticeService noService;

	@RequestMapping("noticelist.bn")
	public ModelAndView noticeList(@RequestParam(value="page", required=false, defaultValue = "1") Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = noService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = noService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("noticelist");
		} else {
			throw new NoticeException("문의사항 목록 조회를 실패 하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("noticeupdate.bn")
	public String noticeUpdate() {
		
		return "noticeupdate";
	}

	@RequestMapping("noticeview.bn")
	public String noticeView(@RequestParam("bo_no") int bo_no, @RequestParam("page") int page, ModelAndView mv) {
		Board board = noService.selectBoard(bo_no);
		
		if(board != null ) {
			mv.addObject("board", board)
				.addObject("page", page)
				.setViewName("boardview");
		} else {
			throw new BoardException("문의 사항 상세페이지 접속에 실패 하였습니다.");
		}	
		return "noticeview";
	}
	
	@RequestMapping("noticewrite.bn")
	public String noticeWrite() {
		return "noticewrite";
	}
	
	@RequestMapping("noticeinsert.bn")
	public String noticeInsert(@ModelAttribute Board b, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) {
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				b.setOriginalFileName(uploadFile.getOriginalFilename());
				b.setRenameFileName(renameFileName)
			}
		}
		
		int result = noService.insertBoard(b);
		
		if(result > 0) {
			return "redirect:boardlist.bn";
		} else {
			throw new BoardException("게시글 등록에 실패하였습니다");
		}
		
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\nouploadFiles";
		
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
