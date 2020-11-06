package com.kh.libreria.book.model.vo;

public class BookSubCategory {
	private int bc_no;
	private String bc_ct;
	private int bcf_no;
	
	public BookSubCategory() {
		
	}

	public int getBc_no() {
		return bc_no;
	}

	public void setBc_no(int bc_no) {
		this.bc_no = bc_no;
	}

	public String getBc_ct() {
		return bc_ct;
	}

	public void setBc_ct(String bc_ct) {
		this.bc_ct = bc_ct;
	}

	public int getBcf_no() {
		return bcf_no;
	}

	public void setBcf_no(int bcf_no) {
		this.bcf_no = bcf_no;
	}

	public BookSubCategory(int bc_no, String bc_ct, int bcf_no) {
		super();
		this.bc_no = bc_no;
		this.bc_ct = bc_ct;
		this.bcf_no = bcf_no;
	}

	public BookSubCategory(int bc_no, String bc_ct) {
		super();
		this.bc_no = bc_no;
		this.bc_ct = bc_ct;
	}

	@Override
	public String toString() {
		return "BookCategory [bc_no=" + bc_no + ", bc_ct=" + bc_ct + ", bcf_no=" + bcf_no + "]";
	}
	
	
}
