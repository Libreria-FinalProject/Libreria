package com.kh.libreria;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.libreria.book.model.service.BookService;
import com.kh.libreria.book.model.vo.Book;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired private BookService bookService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv) {
		ArrayList<Book> recentBooks = bookService.getRecentBooks();
		ArrayList<Book> bestsellerBooks = bookService.getBestSellerBooks();
		ArrayList<Book> randomNovelBooks = bookService.getRandomNovelBooks();
		mv.addObject("recentBooks", recentBooks)
		.addObject("bestsellerBooks", bestsellerBooks)
		.addObject("randomNovelBooks", randomNovelBooks)
		.setViewName("home");
		return mv;
	}
	
	
	/*
	 * @RequestMapping("sessionCheck") public String sessionCheck(Model model) {
	 * model.addAttribute("msg", "세션이 초기화되었습니다. 다시 로그인해주세요."); return
	 * "common/errorPage"; }
	 */
}
