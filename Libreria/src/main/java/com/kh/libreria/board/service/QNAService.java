package com.kh.libreria.board.service;

import java.util.ArrayList;

import com.kh.libreria.board.vo.Board;
import com.kh.libreria.board.vo.Reply;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.image.model.vo.Image;

public interface QNAService {

	int getListCount(int cate);

	ArrayList<Board> selectList(PageInfo pi,int cate);

	int insertBoard(Board b);

	Board selectBoard(int bo_no);

	int updateBoardCount(int bo_no);

	int insertImage(Image i);

	int insertBoardImg();

	Image selectImage(int bo_no);

	ArrayList<Reply> selectReplyList(int bo_no);

	int insertReply(Reply reply);

	int deleteReply(int reply_no);

	int updateBoard(Board b);

	int updateImage(Image i);

	int deleteImage(int img_no);

	Integer selectImageNo(int bo_no);

	int insertBoardImg2(int bo_no);

	ArrayList<Reply> getReplyCount(PageInfo pi, int cate);

}
