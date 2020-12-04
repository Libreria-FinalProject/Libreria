package com.kh.libreria.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.board.dao.BoardDAO;
import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.image.model.vo.Image;

@Service("fService")
public class FAQServiceImpl implements FAQService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bdDAO;

	@Override
	public int getListCount(int cate) {
		return bdDAO.getListCount(sqlSession, cate);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi, int cate) {
		return bdDAO.selectList(sqlSession, pi, cate);
	}

	@Override
	public Board selectBoard(int bo_no) {	
		return bdDAO.selectBoard(sqlSession, bo_no);
	}

	@Override
	public int updateBoardCount(int bo_no) {
		return bdDAO.updateBoardCount(sqlSession, bo_no);
	}

	@Override
	public int deleteBoard(int bo_no) {
		return bdDAO.deleteBoard(sqlSession, bo_no)
	;}

	@Override
	public int insertBoard(Board b) {
		return bdDAO.insertboard(sqlSession, b);
	}

	@Override
	public int insertImage(Image i) {
		return bdDAO.insertImage(sqlSession, i);
	}

	@Override
	public int insertBoardImg() {
		return bdDAO.insertBoardImg(sqlSession);
	}

	@Override
	public int getSearchListCount(HashMap<String, String> map) {
		return bdDAO.getSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> searchFAQ(HashMap<String, String> map, PageInfo pi) {
		return bdDAO.searchFAQ(sqlSession, map, pi);
	}

}
