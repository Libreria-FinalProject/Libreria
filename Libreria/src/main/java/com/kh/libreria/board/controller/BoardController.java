package com.kh.libreria.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class BoardController {
	
	
	@RequestMapping("boardlist.do")
	public String boardlist() {
		
		return "boardlist";
	}
	
	@RequestMapping("boardview.do")
	public String boardview() {
		
		return "boardview";
	}
	
	@RequestMapping("boardwrite")
	public String boardwrite() {
		
		return "boardwrite";
	}
	
	@RequestMapping("centermain")
	public String centermain() {
		
		return "centermain";
	}
	
	@RequestMapping("FAQlist")
	public String FAQlist() {
		
		return "FAQlist";
	}
	
	@RequestMapping("FAQview")
	public String FAQview() {
		
		return "FAQview";
	}
	
	@RequestMapping("noticelist")
	public String noticelist() {
		
		return "noticelist";
	}
	
	@RequestMapping("noticeupdate")
	public String noticeupdate() {
		
		return "noticeupdate";
	}

	@RequestMapping("noticeview")
	public String noticeview() {
		
		return "noticeview";
	}
	
	@RequestMapping("noticewrite")
	public String noticewrite() {
		
		return "noticewrite";
	}
}

