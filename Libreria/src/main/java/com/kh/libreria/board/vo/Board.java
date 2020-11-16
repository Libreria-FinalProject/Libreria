package com.kh.libreria.board.vo;

public class Board {
	private int bo_no;
	private String bo_title;
	private String bo_content;
	private String bo_date;
	private String bo_count;
	private String bo_delete;
	private String mem_no;
	private String cate_no;
	
	private String originalFileName;
	private String renameFileName;
	
	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public Board() {}

	public Board(int bo_no, String bo_title, String bo_content, String bo_date, String bo_count, String bo_delete,
			String mem_no, String cate_no) {
		super();
		this.bo_no = bo_no;
		this.bo_title = bo_title;
		this.bo_content = bo_content;
		this.bo_date = bo_date;
		this.bo_count = bo_count;
		this.bo_delete = bo_delete;
		this.mem_no = mem_no;
		this.cate_no = cate_no;
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

	public String getBo_date() {
		return bo_date;
	}

	public void setBo_date(String bo_date) {
		this.bo_date = bo_date;
	}

	public String getBo_count() {
		return bo_count;
	}

	public void setBo_count(String bo_count) {
		this.bo_count = bo_count;
	}

	public String getBo_delete() {
		return bo_delete;
	}

	public void setBo_delete(String bo_delete) {
		this.bo_delete = bo_delete;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getCate_no() {
		return cate_no;
	}

	public void setCate_no(String cate_no) {
		this.cate_no = cate_no;
	}

	@Override
	public String toString() {
		return "Board [bo_no=" + bo_no + ", bo_title=" + bo_title + ", bo_content=" + bo_content + ", bo_date="
				+ bo_date + ", bo_count=" + bo_count + ", bo_delete=" + bo_delete + ", mem_no=" + mem_no + ", cate_no="
				+ cate_no + "]";
	}
	
	
}
