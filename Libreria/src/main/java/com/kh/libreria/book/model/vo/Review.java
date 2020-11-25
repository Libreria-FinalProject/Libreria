package com.kh.libreria.book.model.vo;

import java.sql.Date;

public class Review {
	private int rev_no;
	private int b_no;
	private int rev_star;
	private String rev_content;	
	private Date rev_date;
	//view를 위한 변수 추가;
	private String mem_name;
	private int mem_no;
	
	public Review(int rev_no, int b_no, int rev_star, String rev_content, Date rev_date, String mem_name, int mem_no) {
		super();
		this.rev_no = rev_no;
		this.b_no = b_no;
		this.rev_star = rev_star;
		this.rev_content = rev_content;
		this.rev_date = rev_date;
		this.mem_name = mem_name;
		this.mem_no = mem_no;
	}
	
	
	
	public int getRev_no() {
		return rev_no;
	}



	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}



	public int getB_no() {
		return b_no;
	}



	public void setB_no(int b_no) {
		this.b_no = b_no;
	}



	public int getRev_star() {
		return rev_star;
	}



	public void setRev_star(int rev_star) {
		this.rev_star = rev_star;
	}



	public String getRev_content() {
		return rev_content;
	}



	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}



	public Date getRev_date() {
		return rev_date;
	}



	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}



	public String getMem_name() {
		return mem_name;
	}



	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}



	public int getMem_no() {
		return mem_no;
	}



	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}



	@Override
	public String toString() {
		return "Review [rev_no=" + rev_no + ", b_no=" + b_no + ", rev_star=" + rev_star + ", rev_content=" + rev_content
				+ ", rev_date=" + rev_date + ", mem_name=" + mem_name + ", mem_no=" + mem_no + "]";
	}
	
	
	
	
	
}
