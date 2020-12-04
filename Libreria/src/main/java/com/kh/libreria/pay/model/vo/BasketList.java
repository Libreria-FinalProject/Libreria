package com.kh.libreria.pay.model.vo;

public class BasketList {
	private int b_no ;
	private String b_title ;
	private int b_price ;
	private int img_no ;
	private int basket_count ;
	private char basket_delete ;
	private int mem_no ;
	
	public BasketList() {
		
	}

	public BasketList(int b_no, String b_title, int b_price, int img_no, int basket_count, char basket_delete,
			int mem_no) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_price = b_price;
		this.img_no = img_no;
		this.basket_count = basket_count;
		this.basket_delete = basket_delete;
		this.mem_no = mem_no;
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

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public int getBasket_count() {
		return basket_count;
	}

	public void setBasket_count(int basket_count) {
		this.basket_count = basket_count;
	}

	public char getBasket_delete() {
		return basket_delete;
	}

	public void setBasket_delete(char basket_delete) {
		this.basket_delete = basket_delete;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	@Override
	public String toString() {
		return "BasketList [b_no=" + b_no + ", b_title=" + b_title + ", b_price=" + b_price + ", img_no=" + img_no
				+ ", basket_count=" + basket_count + ", basket_delete=" + basket_delete + ", mem_no=" + mem_no + "]";
	}
	
	
	
}

