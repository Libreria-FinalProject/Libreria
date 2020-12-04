package com.kh.libreria.admin.model.vo;

import java.sql.Date;

public class SellData {
	private int sell_num;
	private Date sell_date;
	private Date sell_decide_date;
	private int sell_money;
	private int b_no;
	private String b_title;
	private String b_pub_name;
	private String bwp_name;
	private String bc_ct;
	private int mem_no;
	
	public SellData() {
		super();
	}
	public SellData(int sell_num, Date sell_date, Date sell_decide_date, int sell_money, int b_no, String b_title,
			String b_pub_name, String bwp_name, String bc_ct, int mem_no) {
		super();
		this.sell_num = sell_num;
		this.sell_date = sell_date;
		this.sell_decide_date = sell_decide_date;
		this.sell_money = sell_money;
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_pub_name = b_pub_name;
		this.bwp_name = bwp_name;
		this.bc_ct = bc_ct;
		this.mem_no = mem_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
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
	public String getB_pub_name() {
		return b_pub_name;
	}
	public void setB_pub_name(String b_pub_name) {
		this.b_pub_name = b_pub_name;
	}
	public String getBwp_name() {
		return bwp_name;
	}
	public void setBwp_name(String bwp_name) {
		this.bwp_name = bwp_name;
	}
	public String getBc_ct() {
		return bc_ct;
	}
	public void setBc_ct(String bc_ct) {
		this.bc_ct = bc_ct;
	}
	@Override
	public String toString() {
		return "SellData [sell_num=" + sell_num + ", sell_date=" + sell_date + ", sell_decide_date=" + sell_decide_date
				+ ", sell_money=" + sell_money + ", b_no=" + b_no + ", b_title=" + b_title + ", b_pub_name="
				+ b_pub_name + ", bwp_name=" + bwp_name + ", bc_ct=" + bc_ct + "]";
	}
	
	
	
	
}
