package com.kh.libreria.board.vo;

public class BoardIMG {
	private int bo_no;
	private int img_no;
	
	public BoardIMG() {}

	public BoardIMG(int bo_no, int img_no) {
		super();
		this.bo_no = bo_no;
		this.img_no = img_no;
	}

	public int getBo_no() {
		return bo_no;
	}

	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	@Override
	public String toString() {
		return "BoardIMG [bo_no=" + bo_no + ", img_no=" + img_no + "]";
	}
	
	
}
