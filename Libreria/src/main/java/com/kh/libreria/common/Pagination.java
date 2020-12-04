package com.kh.libreria.common;

public class Pagination {
	
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
			
		int pageLimit=10;
		int maxPage;
		int startPage; 
		int endPage;
		int boardLimit= 5;
		
		maxPage= (int)Math.ceil((double)listCount / boardLimit);
		startPage=(currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		if(maxPage < endPage) {
			endPage=maxPage;
		}
		pi = new PageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
		
		
		
		return pi;	
	}
	public static PageInfo getBookPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
			
		int pageLimit=10;
		int maxPage;
		int startPage; 
		int endPage;
		int boardLimit= 20;
		
		maxPage= (int)Math.ceil((double)listCount / boardLimit);
		startPage=(currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		if(maxPage < endPage) {
			endPage=maxPage;
		}
		pi = new PageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
		
		
		
		return pi;	
	}
	
}
