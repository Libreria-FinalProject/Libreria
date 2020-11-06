package com.kh.libreria.book.model.vo;

public class BookFrameCategory {
	private int bcf_no;
	private String bcf_ct;
	
	public BookFrameCategory() {
		
		
	}

	public BookFrameCategory(int bcf_no, String bcf_ct) {
		super();
		this.bcf_no = bcf_no;
		this.bcf_ct = bcf_ct;
	}

	public int getBcf_no() {
		return bcf_no;
	}

	public void setBcf_no(int bcf_no) {
		this.bcf_no = bcf_no;
	}

	public String getBcf_ct() {
		return bcf_ct;
	}

	public void setBcf_ct(String bcf_ct) {
		this.bcf_ct = bcf_ct;
	}

	@Override
	public String toString() {
		return "BookFrameCategory [bcf_no=" + bcf_no + ", bcf_ct=" + bcf_ct + "]";
	}
	
	

}
