package com.javalec.team.dto;

public class CartDto {
	
	private int c_code;
	private int c_amount;
	private int g_code;
	private String u_id;
	private int g_price;
	public int getC_code() {
		return c_code;
	}
	public int getG_price() {
		return g_price;
	}
	public void setG_price(int g_price) {
		this.g_price = g_price;
	}
	public void setC_code(int c_code) {
		this.c_code = c_code;
	}
	public int getC_amount() {
		return c_amount;
	}
	public void setC_amount(int c_amount) {
		this.c_amount = c_amount;
	}
	public int getG_code() {
		return g_code;
	}
	public void setG_code(int g_code) {
		this.g_code = g_code;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
}
