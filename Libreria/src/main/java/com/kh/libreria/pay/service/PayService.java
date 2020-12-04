package com.kh.libreria.pay.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.libreria.member.model.vo.Member;
import com.kh.libreria.pay.model.vo.BasketList;

public interface PayService {

	int insertBasket(HashMap<String, Integer> map);

	int deleteBasket(HashMap<String, Integer> map);

	ArrayList<BasketList> BasketList(Member user);

	int checkBasket(HashMap<String, Integer> map);

	int deleteBook(HashMap<String, Integer> map);

	int insertBuyBookMutong(HashMap<String, Integer> map);

	int insertBuyBookSinyong(HashMap<String, Integer> map);

	int insertBuyBookMileage(HashMap<String, Integer> map);
}
