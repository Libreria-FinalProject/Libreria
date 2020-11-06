package com.kh.libreria.member.model.vo;

import java.sql.Date;

public class Money {
	private int hm_no;
	private int charge_money;
	private Date charge_date;
	private String charge_way;
	private int mem_no;
	
	public Money() {
		super();
	}
	public Money(int hm_no, int charge_money, Date charge_date, String charge_way, int mem_no) {
		super();
		this.hm_no = hm_no;
		this.charge_money = charge_money;
		this.charge_date = charge_date;
		this.charge_way = charge_way;
		this.mem_no = mem_no;
	}
	public int getHm_no() {
		return hm_no;
	}
	public void setHm_no(int hm_no) {
		this.hm_no = hm_no;
	}
	public int getCharge_money() {
		return charge_money;
	}
	public void setCharge_money(int charge_money) {
		this.charge_money = charge_money;
	}
	public Date getCharge_date() {
		return charge_date;
	}
	public void setCharge_date(Date charge_date) {
		this.charge_date = charge_date;
	}
	public String getCharge_way() {
		return charge_way;
	}
	public void setCharge_way(String charge_way) {
		this.charge_way = charge_way;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	@Override
	public String toString() {
		return "Money [hm_no=" + hm_no + ", charge_money=" + charge_money + ", charge_date=" + charge_date
				+ ", charge_way=" + charge_way + ", mem_no=" + mem_no + "]";
	}
	
}
