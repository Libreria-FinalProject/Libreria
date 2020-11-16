package com.kh.libreria.pay.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.member.model.vo.Member;
import com.kh.libreria.pay.model.vo.Basket;
import com.kh.libreria.pay.service.PayService;
import com.kh.libreria.board.model.exception.BoardException;


@Controller
public class PayController {
	@Autowired private PayService pService;
	
	@RequestMapping("payment.pay")
	public String insertBasket(Member m, Book b) {
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("userNo",m.getMem_no());
		map.put("bookNo",b.getB_no());
		
		int insertBasket = pService.insertBasket(map);
		
		return "String";
		
	}
	
	@RequestMapping("delete.pay")
	public String deleteBasket(Basket ba , Book b) {
		
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("basketNo",ba.getBasket_no());
		map.put("bookNo",b.getB_no());
		
		int deleteBasket = pService.deleteBasket(map);
		
		return "String";
	}
	
	@RequestMapping("selectDelete.pay")
	public String selectDelete(@RequestParam("list") String[] arr,Basket ba ) {
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("basketNo",ba.getBasket_no());
		map.put("BookArr",arr);
		int seleeteDelete = pService.seleteDelete(map);
		
		return "String";
	}
	
	@RequestMapping("directBuy.pay")
	public ModelAndView directBuy(Book b, Member m , ModelAndView mv) {
		
			HashMap<String,Integer> map = new HashMap<String, Integer>();
			map.put("userNo",m.getMem_no());
			map.put("bookNo",b.getB_no());
			
			int insertBasket = pService.insertBasket(map);
			
			if(insertBasket == 1) {
				mv.addObject("map",map)
				.setViewName("payment");
			}else{
				//throw new BoardException("게시글 상세보기에 실패하였습니다.");
			}
			return mv;
	}
	
	@RequestMapping("payment1.pay")
	public ModelAndView BaskeyAllBuy(@RequestParam("list") String[] arr ,@RequestParam("AllPrice") int AllPrice, ModelAndView mv) {
		
		mv.addObject("arr",arr)
		.addObject("AllPrice",AllPrice)
		.setViewName("payment");
		
		return mv;
		
	}
	
}
