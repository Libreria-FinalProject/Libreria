package com.kh.libreria.book.model.vo;

public class BookWriter {
	private int bwp_no;
	private String bwp_name;
	private String bwp_intro;
	
	public BookWriter() {
		
	}

	public int getBwp_no() {
		return bwp_no;
	}

	public void setBwp_no(int bwp_no) {
		this.bwp_no = bwp_no;
	}

	public String getBwp_name() {
		return bwp_name;
	}

	public void setBwp_name(String bwp_name) {
		this.bwp_name = bwp_name;
	}

	public String getBwp_intro() {
		return bwp_intro;
	}

	public void setBwp_intro(String bwp_intro) {
		this.bwp_intro = bwp_intro;
	}

	public BookWriter(int bwp_no, String bwp_name, String bwp_intro) {
		super();
		this.bwp_no = bwp_no;
		this.bwp_name = bwp_name;
		this.bwp_intro = bwp_intro;
	}

	@Override
	public String toString() {
		return "BookWriter [bwp_no=" + bwp_no + ", bwp_name=" + bwp_name + ", bwp_intro=" + bwp_intro + "]";
	}
	
	
	
	
	
	

}
