package com.kh.libreria.image.model.vo;

public class Image {
	private int img_no;
	private String origin_name;
	private String change_name;
	private String file_path;
	private String file_level;
	private String img_delete;
	private int ic_no;
	
	public Image() {
		
	}

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_level() {
		return file_level;
	}

	public void setFile_level(String file_level) {
		this.file_level = file_level;
	}

	public String getImg_delete() {
		return img_delete;
	}

	public void setImg_delete(String img_delete) {
		this.img_delete = img_delete;
	}

	public int getIc_no() {
		return ic_no;
	}

	public void setIc_no(int ic_no) {
		this.ic_no = ic_no;
	}

	public Image(int img_no, String origin_name, String change_name, String file_path, String file_level,
			String img_delete, int ic_no) {
		super();
		this.img_no = img_no;
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.file_path = file_path;
		this.file_level = file_level;
		this.img_delete = img_delete;
		this.ic_no = ic_no;
	}

	@Override
	public String toString() {
		return "Image [img_no=" + img_no + ", origin_name=" + origin_name + ", change_name=" + change_name
				+ ", file_path=" + file_path + ", file_level=" + file_level + ", img_delete=" + img_delete + ", ic_no="
				+ ic_no + "]";
	}
	
	

}
