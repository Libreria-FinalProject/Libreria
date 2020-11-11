package com.kh.libreria.image.model.vo;

public class ImageCategory {
	private int ic_no;
	private String ic_name;
	
	public ImageCategory() {
		
	}

	public ImageCategory(int ic_no, String ic_name) {
		super();
		this.ic_no = ic_no;
		this.ic_name = ic_name;
	}

	public int getIc_no() {
		return ic_no;
	}

	public void setIc_no(int ic_no) {
		this.ic_no = ic_no;
	}

	public String getIc_name() {
		return ic_name;
	}

	public void setIc_name(String ic_name) {
		this.ic_name = ic_name;
	}

	@Override
	public String toString() {
		return "ImageCategory [ic_no=" + ic_no + ", ic_name=" + ic_name + "]";
	}

	
}
