package com.kh.libreria.board.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.libreria.board.model.exception.BoardException;
import com.kh.libreria.board.service.BoardService;
import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.common.Pagination;

@SessionAttributes("loginUser")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService bnService;
	
	@RequestMapping("boardlist.bn")
	public ModelAndView boardList(@RequestParam(value="page", required=false, defaultValue = "1") Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bnService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bnService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("boardlist");
		} else {
			throw new BoardException("공지사항 목록 조회를 실패 하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("boardwriteview.bn")
	public String boardWriteview() {
		return "boardwrite";
	}
	
	@RequestMapping("boardinsert.bn")
	public String boardInsert(@ModelAttribute Board b, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) {
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				b.setOriginalFileName(uploadFile.getOriginalFilename());
				b.setRenameFileName(renameFileName);
			}
		}
		
		int result = bnService.insertBoard(b);
		
		if(result > 0) {
			return "redirect:boardlist.bn";
		} else {
			throw new BoardException("게시글 등록에 실패하였습니다");
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
	
	@RequestMapping("boardview.bn")
	public String boardView(@RequestParam("bo_no") int bo_no, @RequestParam("page") int page, ModelAndView mv) {
		
		Board board = bnService.selectBoard(bo_no);
		
		if(board != null ) {
			mv.addObject("board", board)
				.addObject("page", page)
				.setViewName("boardview");
		} else {
			throw new BoardException("문의 사항 상세페이지 접속에 실패 하였습니다.");
		}
		
		return null;
	}	
	
	@RequestMapping("centermain.bn")
	public String Centermain() {
		
		return "centermain";
	}
	
	
	
	
}

