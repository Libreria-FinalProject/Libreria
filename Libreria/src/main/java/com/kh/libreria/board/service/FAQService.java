package com.kh.libreria.board.service;

import java.util.ArrayList;

import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;

public interface FAQService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

	Board selectBoard(int bo_no);

}
