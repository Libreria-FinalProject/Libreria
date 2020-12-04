package com.kh.libreria.board.vo;

import java.sql.Date;

public class Reply {
	private int reply_no;
	private String reply_content;
	private int mem_no;
	private int bo_no;
	private Date reply_date;
	private String reply_delete;
	private int reply_count;
	
	private String mem_name;
	
	public Reply() {
		super();
	}
	
	public Reply(int reply_no, String reply_content, int mem_no, int bo_no, Date reply_date, String reply_delete,
			String mem_name, int reply_count) {
		super();
		this.reply_no = reply_no;
		this.reply_content = reply_content;
		this.mem_no = mem_no;
		this.bo_no = bo_no;
		this.reply_date = reply_date;
		this.reply_delete = reply_delete;
		this.mem_name = mem_name;
		this.reply_count = reply_count;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getBo_no() {
		return bo_no;
	}
	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply_delete() {
		return reply_delete;
	}
	public void setReply_delete(String reply_delete) {
		this.reply_delete = reply_delete;
	}
	
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	@Override
	public String toString() {
		return "Reply [reply_no=" + reply_no + ", reply_content=" + reply_content + ", mem_no=" + mem_no + ", bo_no="
				+ bo_no + ", reply_date=" + reply_date + ", reply_delete=" + reply_delete + ", mem_name=" + mem_name
				+ "]";
	}

	
}
