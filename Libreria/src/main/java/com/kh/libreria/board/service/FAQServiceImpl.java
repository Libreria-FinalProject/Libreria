package com.kh.libreria.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.board.dao.BoardDAO;
import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;

@Service("fService")
public class FAQServiceImpl implements FAQService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO fDAO;

	@Override
	public int getListCount() {
		return fDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return fDAO.selectList(sqlSession, pi);
	}

	@Override
	public Board selectBoard(int bo_no) {
		
Board b = null;
		
		int result = fDAO.addReadCount(sqlSession, bo_no);
		
		if(result > 0) {
			b  = fDAO.selectBoard(sqlSession, bo_no);
		}
		
		return b;
	}
	

}
