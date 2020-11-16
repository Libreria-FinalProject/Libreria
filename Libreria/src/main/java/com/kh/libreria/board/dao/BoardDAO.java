package com.kh.libreria.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;

@Repository("bnDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}

	public int insertboard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int bo_no) {
		return sqlSession.update("boardMapper.addReadCount", bo_no);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bo_no) {
		return (Board)sqlSession.selectOne("boardMapper.selectBoard", bo_no);
	}
	
	

}
