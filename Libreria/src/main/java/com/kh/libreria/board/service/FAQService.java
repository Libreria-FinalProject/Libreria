package com.kh.libreria.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.image.model.vo.Image;

public interface FAQService {

	int getListCount(int cate);

	ArrayList<Board> selectList(PageInfo pi, int cate);

	Board selectBoard(int bo_no);

	int updateBoardCount(int bo_no);

	int deleteBoard(int bo_no);

	int insertBoard(Board b);

	int insertImage(Image i);

	int insertBoardImg();

	int getSearchListCount(HashMap<String, String> map);

	ArrayList<Board> searchFAQ(HashMap<String, String> map, PageInfo pi);


}
