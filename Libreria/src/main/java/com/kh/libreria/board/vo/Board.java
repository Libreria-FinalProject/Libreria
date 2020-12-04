package com.kh.libreria.board.vo;

import java.sql.Date;

public class Board {
	private int bo_no;
	private String bo_title;
	private String bo_content;
	private Date bo_date;
	private int bo_count;
	private String bo_delete;
	private int mem_no;
	private int cate_no;
	
	private String mem_name; 
	
	public Board() {
		super();
	}


	public Board(int bo_no, String bo_title, String bo_content, Date bo_date, int bo_count, String bo_delete,
			int mem_no, int cate_no, String mem_name) {
		super();
		this.bo_no = bo_no;
		this.bo_title = bo_title;
		this.bo_content = bo_content;
		this.bo_date = bo_date;
		this.bo_count = bo_count;
		this.bo_delete = bo_delete;
		this.mem_no = mem_no;
		this.cate_no = cate_no;
		this.mem_name = mem_name;
	}



	public int getBo_no() {
		return bo_no;
	}

	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}

	public String getBo_title() {
		return bo_title;
	}

	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}

	public String getBo_content() {
		return bo_content;
	}

	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}

	public Date getBo_date() {
		return bo_date;
	}

	public void setBo_date(Date bo_date) {
		this.bo_date = bo_date;
	}

	public int getBo_count() {
		return bo_count;
	}

	public void setBo_count(int bo_count) {
		this.bo_count = bo_count;
	}

	public String getBo_delete() {
		return bo_delete;
	}

	public void setBo_delete(String bo_delete) {
		this.bo_delete = bo_delete;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getCate_no() {
		return cate_no;
	}

	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	@Override
	public String toString() {
		return "Board [bo_no=" + bo_no + ", bo_title=" + bo_title + ", bo_content=" + bo_content + ", bo_date="
				+ bo_date + ", bo_count=" + bo_count + ", bo_delete=" + bo_delete + ", mem_no=" + mem_no + ", cate_no="
				+ cate_no + "]";
	}
	
	

	
	
}
