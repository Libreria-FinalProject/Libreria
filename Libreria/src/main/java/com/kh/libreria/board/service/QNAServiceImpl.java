package com.kh.libreria.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.libreria.board.dao.BoardDAO;
import com.kh.libreria.board.vo.Board;
import com.kh.libreria.board.vo.Reply;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.image.model.vo.Image;

@Service("qnaService")
public class QNAServiceImpl implements QNAService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bdDAO;
	
	@Override
	public int getListCount(int cate) {
		
		return bdDAO.getListCount(sqlSession,cate);
		
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi, int cate) {
		
		return bdDAO.selectList(sqlSession, pi, cate);
	}

	@Override
	public int insertBoard(Board b) {
		return bdDAO.insertboard(sqlSession, b);
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
	public int insertImage(Image i) {
		return bdDAO.insertImage(sqlSession, i);
	}

	@Override
	public int insertBoardImg() {
		return bdDAO.insertBoardImg(sqlSession);
	}

	@Override
	public Image selectImage(int bo_no) {
		return bdDAO.selectImage(sqlSession, bo_no);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bo_no) {
		return bdDAO.selectReplyList(sqlSession, bo_no);
	}

	@Override
	public int insertReply(Reply reply) {
		return bdDAO.insertReply(sqlSession, reply);
	}

	@Override
	public int deleteReply(int reply_no) {
		return bdDAO.deleteReply(sqlSession, reply_no);
	}

	@Override
	public int updateBoard(Board b) {
		return bdDAO.updateBoard(sqlSession, b);
	}

	@Override
	public int updateImage(Image i) {
		return bdDAO.updateImage(sqlSession, i);
	}

	@Override
	public int deleteImage(int img_no) {
		return bdDAO.deleteImage(sqlSession, img_no);
	}

	@Override
	public Integer selectImageNo(int bo_no) {
		return bdDAO.selectImageNo(sqlSession, bo_no);
	}

	@Override
	public int insertBoardImg2(int bo_no) {
		return bdDAO.insertBoardImg2(sqlSession, bo_no);
	}

	@Override
	public ArrayList<Reply> getReplyCount(PageInfo pi, int cate) {
		return bdDAO.getReplyCount(sqlSession,pi, cate );
	}

}
