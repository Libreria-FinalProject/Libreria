package com.kh.libreria.board.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.libreria.board.model.exception.BoardException;
import com.kh.libreria.board.model.exception.FAQException;
import com.kh.libreria.board.service.FAQService;
import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.common.Pagination;

public class FAQController {
	
	private FAQService FService;

	@RequestMapping("FAQlist.bn")
	public ModelAndView FAQList(@RequestParam(value="page", required=false, defaultValue = "1") Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = FService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = FService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("FAQlist");
		} else {
			throw new FAQException("FAQ 목록 조회를 실패 하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("FAQview.bn")
	public String FAQView(@RequestParam("bo_no") int bo_no, @RequestParam("page") int page, ModelAndView mv) {
		
		Board board = FService.selectBoard(bo_no);
		
		if(board != null ) {
			mv.addObject("board", board)
				.addObject("page", page)
				.setViewName("boardview");
		} else {
			throw new BoardException("FAQ 상세페이지 접속에 실패 하였습니다.");
		}
		
		return "FAQview";
	}
	
}
