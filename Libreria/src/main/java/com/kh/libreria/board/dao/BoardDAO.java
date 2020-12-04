package com.kh.libreria.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.board.vo.Board;
import com.kh.libreria.board.vo.Reply;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.image.model.vo.Image;

@Repository("bdDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, int cate) {
		return sqlSession.selectOne("boardMapper.getListCount",cate);
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int cate) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", cate, rowBounds);
	}

	public int insertboard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bo_no) {
		return (Board)sqlSession.selectOne("boardMapper.selectBoard", bo_no);
	}

	public int updateBoardCount(SqlSessionTemplate sqlSession, int bo_no) {
		return sqlSession.update("boardMapper.updateBoardCount", bo_no);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bo_no) {
		return sqlSession.update("boardMapper.deleteBoard", bo_no);
	}

	public int insertImage(SqlSessionTemplate sqlSession, Image i) {
		return sqlSession.insert("boardMapper.insertImage", i);
	}

	public int insertBoardImg(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.insertBoardImg");
	}

	public Image selectImage(SqlSessionTemplate sqlSession, int bo_no) {
		return sqlSession.selectOne("boardMapper.selectImage", bo_no);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bo_no) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", bo_no);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
		return sqlSession.insert("boardMapper.insertReply", reply);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int reply_no) {
		return sqlSession.update("boardMapper.deleteReply", reply_no);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int updateImage(SqlSessionTemplate sqlSession, Image i) {
		return sqlSession.update("boardMapper.updateImage", i);
	}

	public int deleteImage(SqlSessionTemplate sqlSession, int img_no) {
		return sqlSession.update("boardMapper.deleteImage", img_no);
	}

	public Integer selectImageNo(SqlSessionTemplate sqlSession, int bo_no) {
		return sqlSession.selectOne("boardMapper.selectImageNo", bo_no);
	}

	public int insertBoardImg2(SqlSessionTemplate sqlSession, int bo_no) {
		return sqlSession.update("boardMapper.insertBoardImg2", bo_no);
	}

	public ArrayList<Reply> getReplyCount(SqlSessionTemplate sqlSession, PageInfo pi, int cate) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.getReplyCount", cate, rowBounds);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.getSearchListCount", map); 
	}

	public ArrayList<Board> searchFAQ(SqlSessionTemplate sqlSession,HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.searchFAQ", map, rowBounds);
	}
	
	

}
