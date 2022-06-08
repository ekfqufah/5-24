package com.javalec.team.dto;

public class GoodDto {
	private int go_code;
	private String u_id;
	private int r_code;
	private int go_yn;
	
	public GoodDto() {
		// TODO Auto-generated constructor stub
	}
	
	public GoodDto(int go_code, String u_id, int r_code, int go_yn) {
		this.go_code = go_code;
		this.u_id = u_id;
		this.r_code = r_code;
		this.go_yn = go_yn;
	}
	public int getGo_code() {
		return go_code;
	}
	public void setGo_code(int go_code) {
		this.go_code = go_code;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getR_code() {
		return r_code;
	}
	public void setR_code(int r_code) {
		this.r_code = r_code;
	}
	public int getGo_yn() {
		return go_yn;
	}
	public void setGo_yn(int go_yn) {
		this.go_yn = go_yn;
	}
	
	
}
