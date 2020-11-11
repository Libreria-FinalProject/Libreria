package com.kh.libreria.pay.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.pay.DAO.PayDAO;

@Service("pService")
public class PayServiceImpl implements PayService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PayDAO pDAO; 
	
	@Override
	public int insertBasket(HashMap<String, Integer> map) {
	
		return pDAO.insertBasket(map,sqlSession); 
	}
	@Override
	public int deleteBasket(HashMap<String, Integer> map) {
		
		return pDAO.deleteBasket(map,sqlSession); 
	}
	@Override
	public int seleteDelete(HashMap<String, Object> map) {
		
		return pDAO.selectDelete(map,sqlSession); 
	}
	
}
