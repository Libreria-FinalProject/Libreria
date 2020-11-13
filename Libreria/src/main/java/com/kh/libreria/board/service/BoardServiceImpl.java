package com.kh.libreria.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.board.dao.BoardDAO;
import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;

@Service("bnService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bnDAO;
	
	@Override
	public int getListCount() {
		
		return bnDAO.getListCount(sqlSession);
		
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		
		return bnDAO.selectList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Board b) {
		return bnDAO.insertboard(sqlSession, b);
	}

	@Override
	public Board selectBoard(int bo_no) {

		Board b = null;
		
		int result = bnDAO.addReadCount(sqlSession, bo_no);
		
		if(result > 0) {
			b  = bnDAO.selectBoard(sqlSession, bo_no);
		}
		
		return b;
	}

}