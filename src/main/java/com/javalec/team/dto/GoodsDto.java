package com.javalec.team.dto;

public class GoodsDto {
	private int g_code;
	private String g_name;
	private int g_price;
	private String img_origin;
	private String img_1;
	
	public String getImg_origin() {
		return img_origin;
	}
	public void setImg_origin(String img_origin) {
		this.img_origin = img_origin;
	}
	public String getImg_1() {
		return img_1;
	}
	public void setImg_1(String img_1) {
		this.img_1 = img_1;
	}
	public int getG_code() {
		return g_code;
	}
	public void setG_code(int g_code) {
		this.g_code = g_code;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public int getG_price() {
		return g_price;
	}
	public void setG_price(int g_price) {
		this.g_price = g_price;
	}
}

