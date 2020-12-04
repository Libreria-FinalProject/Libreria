package com.kh.libreria.pay.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.member.model.vo.Member;
import com.kh.libreria.pay.DAO.PayDAO;
import com.kh.libreria.pay.model.vo.BasketList;

@Service("pService")
public class PayServiceImpl implements PayService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PayDAO pDAO; 
	
	@Override
	public int insertBasket(HashMap<String, Integer> map) {
		System.out.println("mapService" + map);
		return pDAO.insertBasket(map,sqlSession); 
	}
	@Override
	public int deleteBasket(HashMap<String, Integer> map) {
		
		return pDAO.deleteBasket(map,sqlSession); 
	}
	

	@Override
	public ArrayList<BasketList> BasketList(Member user) {
		return pDAO.BasketList(user,sqlSession); 
	}
	
	@Override
	public int checkBasket(HashMap<String, Integer> map) {
		System.out.println("service map " + map);
		return pDAO.checkBasket(map,sqlSession); 
	}
	@Override
	public int deleteBook(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return pDAO.deleteBook(map,sqlSession); 
	}
	@Override
	public int insertBuyBookMutong(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return pDAO.insertBuyBookMutong(map,sqlSession); 
	}
	@Override
	public int insertBuyBookSinyong(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return pDAO.insertBuyBookSinyong(map,sqlSession); 
	}
	@Override
	public int insertBuyBookMileage(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return pDAO.insertBuyBookMileage(map,sqlSession); 
	}
}
