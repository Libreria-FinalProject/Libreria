package com.kh.libreria.pay.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.member.model.vo.Member;

public interface PayService {

	int insertBasket(HashMap<String, Integer> map);

	int deleteBasket(HashMap<String, Integer> map);

	int seleteDelete(HashMap<String, Object> map);

	

	
}
