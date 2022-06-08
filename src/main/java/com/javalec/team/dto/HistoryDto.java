package com.javalec.team.dto;

public class HistoryDto {
	private int his_code;
	private int c_amount;
	private String u_id;
	private int g_code;
	
	public HistoryDto() {
	}
	public HistoryDto(int his_code, int c_amount, String u_id, int g_code) {
		this.his_code = his_code;
		this.c_amount = c_amount;
		this.u_id = u_id;
		this.g_code = g_code;
	}
	
	public int getHis_code() {
		return his_code;
	}
	public void setHis_code(int his_code) {
		this.his_code = his_code;
	}
	public int getC_amount() {
		return c_amount;
	}
	public void setC_amount(int c_amount) {
		this.c_amount = c_amount;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getG_code() {
		return g_code;
	}
	public void setG_code(int g_code) {
		this.g_code = g_code;
	}
	
}
