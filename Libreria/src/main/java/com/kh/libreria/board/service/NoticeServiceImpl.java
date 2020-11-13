package com.kh.libreria.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.board.dao.BoardDAO;
import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;

@Service("noService")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO noDAO;
	
	@Override
	public int getListCount() {
		return noDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return noDAO.selectList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Board b) {
		return noDAO.insertboard(sqlSession, b);
	}

	@Override
	public Board selectBoard(int bo_no) {
		
		Board b = null;
		
		int result = noDAO.addReadCount(sqlSession, bo_no);
		
		if(result > 0) {
			b  = noDAO.selectBoard(sqlSession, bo_no);
		}
		
		return b;
	}
	
}
