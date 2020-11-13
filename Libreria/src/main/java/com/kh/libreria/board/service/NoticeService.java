package com.kh.libreria.board.service;

import java.util.ArrayList;

import com.kh.libreria.board.vo.Board;
import com.kh.libreria.common.PageInfo;

public interface NoticeService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int insertBoard(Board b);

	Board selectBoard(int bo_no);

}
