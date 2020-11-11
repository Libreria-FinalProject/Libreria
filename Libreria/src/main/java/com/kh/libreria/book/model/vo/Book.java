package com.kh.libreria.book.model.vo;

import java.sql.Date;

public class Book {
	private int b_no;
	private String b_title;
	private String b_content;
	private String b_pub;
	private int b_price;
	private int b_stock;
	private Date b_pub_date;
	private int b_sales_rate;
	private int b_cnt;
	private String b_gk;
	private int bc_no;
	private int img_no;
	private int bwp_no;
	private String b_delete;

	public Book() {
		
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_pub() {
		return b_pub;
	}

	public void setB_pub(String b_pub) {
		this.b_pub = b_pub;
	}

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}

	public int getB_stock() {
		return b_stock;
	}

	public void setB_stock(int b_stock) {
		this.b_stock = b_stock;
	}

	public Date getB_pub_date() {
		return b_pub_date;
	}

	public void setB_pub_date(Date b_pub_date) {
		this.b_pub_date = b_pub_date;
	}

	public int getB_sales_rate() {
		return b_sales_rate;
	}

	public void setB_sales_rate(int b_sales_rate) {
		this.b_sales_rate = b_sales_rate;
	}

	public int getB_cnt() {
		return b_cnt;
	}

	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}

	public String getB_gk() {
		return b_gk;
	}

	public void setB_gk(String b_gk) {
		this.b_gk = b_gk;
	}

	public int getBc_no() {
		return bc_no;
	}

	public void setBc_no(int bc_no) {
		this.bc_no = bc_no;
	}

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public int getBwp_no() {
		return bwp_no;
	}

	public void setBwp_no(int bwp_no) {
		this.bwp_no = bwp_no;
	}

	public String getB_delete() {
		return b_delete;
	}

	public void setB_delete(String b_delete) {
		this.b_delete = b_delete;
	}

	public Book(int b_no, String b_title, String b_content, String b_pub, int b_price, int b_stock, Date b_pub_date,
			int b_sales_rate, int b_cnt, String b_gk, int bc_no, int img_no, int bwp_no, String b_delete) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_pub = b_pub;
		this.b_price = b_price;
		this.b_stock = b_stock;
		this.b_pub_date = b_pub_date;
		this.b_sales_rate = b_sales_rate;
		this.b_cnt = b_cnt;
		this.b_gk = b_gk;
		this.bc_no = bc_no;
		this.img_no = img_no;
		this.bwp_no = bwp_no;
		this.b_delete = b_delete;
	}

	@Override
	public String toString() {
		return "Book [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", b_pub=" + b_pub
				+ ", b_price=" + b_price + ", b_stock=" + b_stock + ", b_pub_date=" + b_pub_date + ", b_sales_rate="
				+ b_sales_rate + ", b_cnt=" + b_cnt + ", b_gk=" + b_gk + ", bc_no=" + bc_no + ", img_no=" + img_no
				+ ", bwp_no=" + bwp_no + ", b_delete=" + b_delete + "]";
	}
	
	

}
