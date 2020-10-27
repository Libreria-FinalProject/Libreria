package com.kh.libreria.member.model.vo;

import java.sql.Date;

public class Member {
	private int mem_no;
	private String mem_email;
	private String mem_pw;
	private String mem_name;
	private String mem_gender;
	private Date mem_birth;
	private String mem_tel;
	private String mem_address;
	private Date mem_regdate;
	private String mem_status;
	private String mem_grade;
	private String mem_interest;
	private Date mem_logindate;
	private int mem_money;
	private String mem_delete;
	public Member() {
		super();
	}
	public Member(int mem_no, String mem_email, String mem_pw, String mem_name, String mem_gender, Date mem_birth,
			String mem_tel, String mem_address, Date mem_regdate, String mem_status, String mem_grade,
			String mem_interest, Date mem_logindate, int mem_money, String mem_delete) {
		super();
		this.mem_no = mem_no;
		this.mem_email = mem_email;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_gender = mem_gender;
		this.mem_birth = mem_birth;
		this.mem_tel = mem_tel;
		this.mem_address = mem_address;
		this.mem_regdate = mem_regdate;
		this.mem_status = mem_status;
		this.mem_grade = mem_grade;
		this.mem_interest = mem_interest;
		this.mem_logindate = mem_logindate;
		this.mem_money = mem_money;
		this.mem_delete = mem_delete;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public Date getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(Date mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public Date getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(Date mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	public String getMem_status() {
		return mem_status;
	}
	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}
	public String getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}
	public String getMem_interest() {
		return mem_interest;
	}
	public void setMem_interest(String mem_interest) {
		this.mem_interest = mem_interest;
	}
	public Date getMem_logindate() {
		return mem_logindate;
	}
	public void setMem_logindate(Date mem_logindate) {
		this.mem_logindate = mem_logindate;
	}
	public int getMem_money() {
		return mem_money;
	}
	public void setMem_money(int mem_money) {
		this.mem_money = mem_money;
	}
	public String getMem_delete() {
		return mem_delete;
	}
	public void setMem_delete(String mem_delete) {
		this.mem_delete = mem_delete;
	}
	@Override
	public String toString() {
		return "Member [mem_no=" + mem_no + ", mem_email=" + mem_email + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name
				+ ", mem_gender=" + mem_gender + ", mem_birth=" + mem_birth + ", mem_tel=" + mem_tel + ", mem_address="
				+ mem_address + ", mem_regdate=" + mem_regdate + ", mem_status=" + mem_status + ", mem_grade="
				+ mem_grade + ", mem_interest=" + mem_interest + ", mem_logindate=" + mem_logindate + ", mem_money="
				+ mem_money + ", mem_delete=" + mem_delete + "]";
	}
	
	
	
}
