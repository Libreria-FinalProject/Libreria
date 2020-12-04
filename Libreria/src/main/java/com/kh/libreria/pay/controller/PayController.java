package com.kh.libreria.pay.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.libreria.member.model.vo.Member;
import com.kh.libreria.pay.model.vo.BasketList;
import com.kh.libreria.pay.service.PayService;


@Controller
public class PayController {
	@Autowired
	private PayService pService;

	@RequestMapping("payment.pay")
	@ResponseBody 
	public String insertBasket(@RequestParam("bookNum") int bNo, HttpSession session) {

		Member User = (Member) session.getAttribute("loginUser");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("mem_no", User.getMem_no());
		map.put("bNo", bNo);

		System.out.println("User" + User);
		System.out.println("mapController" + map);
		System.out.println("bNo" + bNo);

		int checkBasket = pService.checkBasket(map);
		if (checkBasket == 0) {
			System.out.println("추가되었습니다.");
			int insertBasket = pService.insertBasket(map);
			return "seccessInsert";
		} else {

			int result = pService.deleteBook(map);
			System.out.println("삭제되었습니다.");
			return "seccessDelete";
		}

	}
	@RequestMapping("DirectBuy.pay")
	public ModelAndView DirectBuy (@RequestParam("bookTitle") String bookTitle,
							 @RequestParam("bookImg") int bookImg,
							 @RequestParam("bookPrice") int bookPrice,
							 @RequestParam("bookNo") int bookNo,
							 HttpSession session,
							 ModelAndView mv) {
		Member User = (Member) session.getAttribute("loginUser");
		
		mv.addObject("bookTitle", bookTitle)
			.addObject("bookImg", bookImg)
			.addObject("bookPrice", bookPrice)
			.addObject("bookNo", bookNo)
			.addObject("User", User)
			.setViewName("DirectStandardUI");
		return mv;
	}
	
	@RequestMapping("DirectNextPayment.pay")
	public ModelAndView DirectNextPayment(@RequestParam("bookTitle") String bookTitle,
			 @RequestParam("bookImg") int bookImg,
			 @RequestParam("bookPrice") int bookPrice,
			 @RequestParam("bookNo") int bookNo,
			 @RequestParam("memNum") int memNum,
			 HttpSession session,
			 ModelAndView mv) {
		
		mv.addObject("bookTitle", bookTitle)
		.addObject("bookImg", bookImg)
		.addObject("bookPrice", bookPrice)
		.addObject("bookNo", bookNo)
		.addObject("memNum", memNum)
		.setViewName("DirectPayment");
		return mv;
		
	}
	
	@RequestMapping("DirectMethodOfPayment.pay")
	public ModelAndView DirectMethodOfPayment(String pay ,
				@RequestParam("memNum") int memNum,
				@RequestParam("bookNo") int bookNo,
				@RequestParam("bookPrice") int bookPrice, 
				HttpSession session,ModelAndView mv) {
			Member User = (Member) session.getAttribute("loginUser");

			ArrayList<BasketList> BasketInfo = pService.BasketList(User);
			System.out.println("pay " + pay);
			System.out.println("memNum " + memNum);
			System.out.println("bookNo " + bookNo);
			System.out.println("bookPrice " + bookPrice);
			
		
		  	if(pay.equals("Mutong")) {
			  	System.out.println("무통 작동"); 
			  	mv.addObject("bookPrice", bookPrice)
			  	.addObject("memNum", memNum)
			  	.addObject("bookNo", bookNo)
			  	.addObject("memNum", memNum)
			  	.addObject("User",User)
			  	.addObject("pay",pay)
				.setViewName("DirectPayMutong");
			  	return mv;
			}else if(pay.equals("Sinyong")) {
				System.out.println("신용 작동"); 
				mv.addObject("bookPrice", bookPrice)
			  	.addObject("memNum", memNum)
			  	.addObject("bookNo", bookNo)
			  	.addObject("User",User)
			  	.addObject("pay",pay)
				.setViewName("DirectPaySinyoug");
				return mv;
			}else if(pay.equals("Mileage")) {
				System.out.println("마일리지 작동"); 
				mv.addObject("bookPrice", bookPrice)
			  	.addObject("memNum", memNum)
			  	.addObject("bookNo", bookNo)
			  	.addObject("User",User)
			  	.addObject("pay",pay)
				.setViewName("DirectPayMileage");
				return mv;
			}else {
				System.out.println("아무것도 안옴"); 
				mv.setViewName("payment");
				return mv;
			}
	}
	
	@RequestMapping("DirectClearPayment.pay")
	@ResponseBody 
	public String DirectClearPayment( @RequestParam("memNum") int memNum,
									@RequestParam("bookNo") int bookNo,
									@RequestParam("bookPrice") int bookPrice,
									@RequestParam("pay")String pay,
									@RequestParam("UserNum") int UserNum) {
		System.out.println(memNum);
		System.out.println(bookNo);
		System.out.println(bookPrice);
		System.out.println(pay);
		System.out.println(UserNum);
		
		if(pay.equals("Mutong")) {
			  
				  
			      HashMap<String, Integer> map = new HashMap<String, Integer>(); 
			      map.put("bNo",bookNo); 
			      map.put("mem_no", memNum);
			      map.put("allprice", bookPrice); 
			      int insert = pService.insertBuyBookMutong(map); 
			      
			      map.remove("bNo"); 
			      map.remove("mem_no"); 
			      map.remove("allprice"); 
			}else if(pay.equals("Sinyong")) { 
					 
				      HashMap<String, Integer> map = new HashMap<String, Integer>(); 
				      map.put("bNo",bookNo); 
				      map.put("mem_no", memNum);
				      map.put("allprice", bookPrice);  
				      int insert = pService.insertBuyBookSinyong(map); 
				      
				      map.remove("bNo"); 
				      map.remove("mem_no"); 
				      map.remove("allprice"); 
			}else if(pay.equals("Mileage")) {
				
				      HashMap<String, Integer> map = new HashMap<String, Integer>(); 
				      map.put("bNo",bookNo); 
				      map.put("mem_no", memNum);
				      map.put("allprice", bookPrice); 
				      int insert = pService.insertBuyBookMileage(map); 
				      
				      map.remove("bNo"); 
				      map.remove("mem_no"); 
				      map.remove("allprice");
			}else {
				return "error";
			}
			
			return "success";
		
	}
	
	@RequestMapping("basketList.pay")
	public ModelAndView BasketList(HttpSession session, ModelAndView mv) {
		Member User = (Member) session.getAttribute("loginUser");
		ArrayList<BasketList> BasketInfo = pService.BasketList(User);

		mv.addObject("BasketInfo", BasketInfo).setViewName("standardUINormal");

		return mv;

	}

	@RequestMapping("deleteBook.pay")
	public ModelAndView deleteBasket(@RequestParam("bookNum") int bNo, @RequestParam("memNum") int mem_no,
			HttpSession session, ModelAndView mv) {
		Member User = (Member) session.getAttribute("loginUser");

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("bNo", bNo);
		map.put("mem_no", mem_no);

		int result = pService.deleteBook(map);
		ArrayList<BasketList> BasketInfo = pService.BasketList(User);
		mv.addObject("BasketInfo", BasketInfo).setViewName("standardUINormal");
		return mv;
	}

	@RequestMapping("selectDelete.pay")
	@ResponseBody
	public String selectDelete(@RequestParam("checkItem[]") List<Integer> checkItem,
			@RequestParam("mem_no[]") List<Integer> mem_no, HttpSession session) {
		ArrayList<Integer> ChItem = (ArrayList<Integer>) checkItem;
		ArrayList<Integer> MEMNO = (ArrayList<Integer>) mem_no;

		HashMap<String, List<Integer>> map2 = new HashMap<String, List<Integer>>();
		map2.put("checkItem", ChItem);
		map2.put("mem_no", MEMNO);
		for (int i = 0; i < ChItem.size(); i++) {
			int Mem_Number = MEMNO.get(0);
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("bNo", ChItem.get(i));
			map.put("mem_no", Mem_Number);
			int result = pService.deleteBook(map);
			map.remove("bNo");
			map.remove("mem_no");
		}

		return "success";
	}

	@RequestMapping("NextPayment.pay")
	public ModelAndView NextPayment(HttpSession session, ModelAndView mv) {
		Member User = (Member) session.getAttribute("loginUser");

		ArrayList<BasketList> BasketInfo = pService.BasketList(User);

		System.out.println("BasketInfo" + BasketInfo);

		mv.addObject("BasketInfo", BasketInfo)
			.setViewName("payment");
		return mv;
	}

	@RequestMapping("MethodOfPayment.pay")
	public ModelAndView MethodOfPayment(String pay , HttpSession session,ModelAndView mv) {
			Member User = (Member) session.getAttribute("loginUser");

			ArrayList<BasketList> BasketInfo = pService.BasketList(User);
			System.out.println("pay " + pay);
			
		
		  	if(pay.equals("Mutong")) {
			  	System.out.println("무통 작동"); 
			  	mv.addObject("BasketInfo", BasketInfo)
			  	.addObject("pay",pay)
			  	.addObject("User",User)
				.setViewName("payMutong");
			  	return mv;
			}else if(pay.equals("Sinyong")) {
				System.out.println("신용 작동"); 
				mv.addObject("BasketInfo", BasketInfo)
				.addObject("pay",pay)
				.addObject("User",User)
				.setViewName("paySinyoug");
				return mv;
			}else if(pay.equals("Mileage")) {
				System.out.println("마일리지 작동"); 
				mv.addObject("BasketInfo", BasketInfo)
				.addObject("pay",pay)
				.addObject("User",User)
				.setViewName("payMileage");
				return mv;
			}else {
				System.out.println("아무것도 안옴"); 
				mv.setViewName("payment");
				return mv;
			}
		
		
	}
	@RequestMapping("clearPayment.pay")
	@ResponseBody 
	public String clearPayment(@RequestParam("checkItem[]") List<Integer> checkItem,
							   @RequestParam("mem_no[]") List<Integer> mem_no, 
							   @RequestParam("allprice[]") List<Integer> allprice, 
							   @RequestParam("buyLoot") String buyLoot,
							   HttpSession session) {
		ArrayList<Integer> ChItem = (ArrayList<Integer>) checkItem;
		ArrayList<Integer> MEMNO = (ArrayList<Integer>) mem_no;
		ArrayList<Integer> APrice = (ArrayList<Integer>) allprice;
		
		System.out.println("checkItem=" + checkItem);
		System.out.println("mem_no=" + mem_no);
		System.out.println("allprice=" + allprice);
		
		if(buyLoot.equals("Mutong")) {
		  for (int i = 0; i < ChItem.size(); i++) { 
			  int Mem_Number = MEMNO.get(0);
		      HashMap<String, Integer> map = new HashMap<String, Integer>(); 
		      map.put("bNo",ChItem.get(i)); 
		      map.put("mem_no", Mem_Number);
		      map.put("allprice", APrice.get(i)); 
		      int insert = pService.insertBuyBookMutong(map); 
		      int delete = pService.deleteBook(map);
		      map.remove("bNo"); 
		      map.remove("mem_no"); 
		      map.remove("allprice"); 
		      
		      }
		}else if(buyLoot.equals("Sinyong")) {
			for (int i = 0; i < ChItem.size(); i++) { 
				  int Mem_Number = MEMNO.get(0);
			      HashMap<String, Integer> map = new HashMap<String, Integer>(); 
			      map.put("bNo",ChItem.get(i)); 
			      map.put("mem_no", Mem_Number);
			      map.put("allprice", APrice.get(i)); 
			      int insert = pService.insertBuyBookSinyong(map); 
			      int delete = pService.deleteBook(map);
			      map.remove("bNo"); 
			      map.remove("mem_no"); 
			      map.remove("allprice"); 
			      }
		}else if(buyLoot.equals("Mileage")) {
			for (int i = 0; i < ChItem.size(); i++) { 
				  int Mem_Number = MEMNO.get(0);
			      HashMap<String, Integer> map = new HashMap<String, Integer>(); 
			      map.put("bNo",ChItem.get(i)); 
			      map.put("mem_no", Mem_Number);
			      map.put("allprice", APrice.get(i)); 
			      int insert = pService.insertBuyBookMileage(map); 
			      int delete = pService.deleteBook(map);
			      map.remove("bNo"); 
			      map.remove("mem_no"); 
			      map.remove("allprice");
			      }
		}else {
			return "error";
		}
		return "success";
	}

}
