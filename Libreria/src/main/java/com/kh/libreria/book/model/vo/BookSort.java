package com.kh.libreria.book.model.vo;

public class BookSort {
	private int bcf_no;
	private int bc_no;
	private int std;
	private String word;
	
	public BookSort() {
		
	}

	public BookSort(int bcf_no, int bc_no, int std) {
		super();
		this.bcf_no = bcf_no;
		this.bc_no = bc_no;
		this.std = std;
	}
	

	public BookSort(int std, String word) {
		super();
		this.std = std;
		this.word = word;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public int getBcf_no() {
		return bcf_no;
	}

	public void setBcf_no(int bcf_no) {
		this.bcf_no = bcf_no;
	}

	public int getBc_no() {
		return bc_no;
	}

	public void setBc_no(int bc_no) {
		this.bc_no = bc_no;
	}

	public int getStd() {
		return std;
	}

	public void setStd(int std) {
		this.std = std;
	}

	@Override
	public String toString() {
		return "BookSort [bcf_no=" + bcf_no + ", bc_no=" + bc_no + ", std=" + std + "]";
	}
	

}
