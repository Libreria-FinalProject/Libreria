package com.kh.libreria.member.model.vo;

import java.sql.Date;

public class Card {
	private int rc_no;
	private String card_no;
	private String card_company;
	private Date card_expire;
	private int card_pwd;
	private String card_status;
	private int mem_no;
	
	public Card() {
		super();
	}
	
	public Card(int rc_no, String card_no, String card_company, Date card_expire, int card_pwd, String card_status,
			int mem_no) {
		super();
		this.rc_no = rc_no;
		this.card_no = card_no;
		this.card_company = card_company;
		this.card_expire = card_expire;
		this.card_pwd = card_pwd;
		this.card_status = card_status;
		this.mem_no = mem_no;
	}

	public int getRc_no() {
		return rc_no;
	}

	public void setRc_no(int rc_no) {
		this.rc_no = rc_no;
	}

	public String getCard_no() {
		return card_no;
	}

	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}

	public String getCard_company() {
		return card_company;
	}

	public void setCard_company(String card_company) {
		this.card_company = card_company;
	}

	public Date getCard_expire() {
		return card_expire;
	}

	public void setCard_expire(Date card_expire) {
		this.card_expire = card_expire;
	}

	public int getCard_pwd() {
		return card_pwd;
	}

	public void setCard_pwd(int card_pwd) {
		this.card_pwd = card_pwd;
	}

	public String getCard_status() {
		return card_status;
	}

	public void setCard_status(String card_status) {
		this.card_status = card_status;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	@Override
	public String toString() {
		return "Card [rc_no=" + rc_no + ", card_no=" + card_no + ", card_company=" + card_company + ", card_expire="
				+ card_expire + ", card_pwd=" + card_pwd + ", card_status=" + card_status + ", mem_no=" + mem_no + "]";
	}
	
	
}
