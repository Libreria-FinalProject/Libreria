package com.kh.libreria.board.service;

import java.util.ArrayList;

import com.kh.libreria.board.vo.Board;
import com.kh.libreria.board.vo.Reply;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.image.model.vo.Image;

public interface NoticeService {

	int getListCount(int cate);

	ArrayList<Board> selectList(PageInfo pi, int cate);

	int insertBoard(Board b);

	Board selectBoard(int bo_no);

	int insertImage(Image i);

	int insertBoardImg();

	int updateBoardCount(int bo_no);

	Image selectImage(int bo_no);

	int updateBoard(Board b);

	int selectImageNo(int bo_no);

	int updateImage(Image i);

	int insertBoardImg2(int bo_no);

	int deleteImage(int img_no);


}
