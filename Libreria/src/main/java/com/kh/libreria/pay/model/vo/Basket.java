package com.kh.libreria.pay.model.vo;

import oracle.sql.DATE;

public class Basket {
	private int basket_no;
	private int b_no;
	private DATE add_date;
	private int basket_count;
	private char b_delete;
	private int mem_no;
	
	private Basket() {}

	public Basket(int basket_no, int b_no, DATE add_date, int basket_count, char b_delete, int mem_no) {
		super();
		this.basket_no = basket_no;
		this.b_no = b_no;
		this.add_date = add_date;
		this.basket_count = basket_count;
		this.b_delete = b_delete;
		this.mem_no = mem_no;
	}

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public DATE getAdd_date() {
		return add_date;
	}

	public void setAdd_date(DATE add_date) {
		this.add_date = add_date;
	}

	public int getBasket_count() {
		return basket_count;
	}

	public void setBasket_count(int basket_count) {
		this.basket_count = basket_count;
	}

	public char getB_delete() {
		return b_delete;
	}

	public void setB_delete(char b_delete) {
		this.b_delete = b_delete;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	@Override
	public String toString() {
		return "Basket [basket_no=" + basket_no + ", b_no=" + b_no + ", add_date=" + add_date + ", basket_count="
				+ basket_count + ", b_delete=" + b_delete + ", mem_no=" + mem_no + "]";
	}
	
	
	
}
