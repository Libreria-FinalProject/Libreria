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
	private String file_path;
	private String change_name;
	private String bwp_name;
	private String b_pub_name;
	//평점 평균
	private float avg_star;
//////판매정보 조회 시 필요한 변수 추가 - 기현 20.11.11
	private int sell_num;  // 판매번호
	private Date sell_date; // 판매일자
	private Date sell_decide_date; // 판매 확정일자
	private int sell_money; //판매금액
	
	public Book() {
		
	}

	public Book(int b_no, String b_title, String b_content, String b_pub, int b_price, int b_stock, Date b_pub_date,
			int b_sales_rate, int b_cnt, String b_gk, int bc_no, int img_no, int bwp_no, String b_delete,
			String file_path, String change_name, String bwp_name) {
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
		this.file_path = file_path;
		this.change_name = change_name;
		this.bwp_name = bwp_name;
	}
	
	public Book(int b_no, String b_title, String b_content, String b_pub, int b_price, int b_stock, Date b_pub_date,
			int b_sales_rate, int b_cnt, String b_gk, int bc_no, int img_no, int bwp_no, String b_delete,
			String file_path, String change_name, String bwp_name, String b_pub_name, int sell_num, Date sell_date,
			Date sell_decide_date, int sell_money) {
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
		this.file_path = file_path;
		this.change_name = change_name;
		this.bwp_name = bwp_name;
		this.b_pub_name = b_pub_name;
		this.sell_num = sell_num;
		this.sell_date = sell_date;
		this.sell_decide_date = sell_decide_date;
		this.sell_money = sell_money;
	}
	
	
	
	public Book(int b_no, String b_title, String b_content, String b_pub, int b_price, int b_stock, Date b_pub_date,
			int b_sales_rate, int b_cnt, String b_gk, int bc_no, int img_no, int bwp_no, String b_delete,
			String file_path, String change_name, String bwp_name, String b_pub_name, float avg_star, int sell_num,
			Date sell_date, Date sell_decide_date, int sell_money) {
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
		this.file_path = file_path;
		this.change_name = change_name;
		this.bwp_name = bwp_name;
		this.b_pub_name = b_pub_name;
		this.avg_star = avg_star;
		this.sell_num = sell_num;
		this.sell_date = sell_date;
		this.sell_decide_date = sell_decide_date;
		this.sell_money = sell_money;
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

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public String getBwp_name() {
		return bwp_name;
	}

	public void setBwp_name(String bwp_name) {
		this.bwp_name = bwp_name;
	}
	
	//////////////////////////////////////////
	public int getSell_num() {
		return sell_num;
	}

	public void setSell_num(int sell_num) {
		this.sell_num = sell_num;
	}

	public Date getSell_date() {
		return sell_date;
	}

	public void setSell_date(Date sell_date) {
		this.sell_date = sell_date;
	}

	public Date getSell_decide_date() {
		return sell_decide_date;
	}

	public void setSell_decide_date(Date sell_decide_date) {
		this.sell_decide_date = sell_decide_date;
	}

	public int getSell_money() {
		return sell_money;
	}

	public void setSell_money(int sell_money) {
		this.sell_money = sell_money;
	}
	
	
	////////////////////////////////////////

	public float getAvg_star() {
		return avg_star;
	}

	public void setAvg_star(float avg_star) {
		this.avg_star = avg_star;
	}

	public String getB_pub_name() {
		return b_pub_name;
	}

	public void setB_pub_name(String b_pub_name) {
		this.b_pub_name = b_pub_name;
	}

	@Override
	public String toString() {
		return "Book [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", b_pub=" + b_pub
				+ ", b_price=" + b_price + ", b_stock=" + b_stock + ", b_pub_date=" + b_pub_date + ", b_sales_rate="
				+ b_sales_rate + ", b_cnt=" + b_cnt + ", b_gk=" + b_gk + ", bc_no=" + bc_no + ", img_no=" + img_no
				+ ", bwp_no=" + bwp_no + ", b_delete=" + b_delete + ", file_path=" + file_path + ", change_name="
				+ change_name + ", bwp_name=" + bwp_name + ", b_pub_name=" + b_pub_name + ", avg_star=" + avg_star
				+ ", sell_num=" + sell_num + ", sell_date=" + sell_date + ", sell_decide_date=" + sell_decide_date
				+ ", sell_money=" + sell_money + "]";
	}

	

	

	

}