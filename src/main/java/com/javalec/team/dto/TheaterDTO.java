package com.javalec.team.dto;

public class TheaterDTO {
    int t_code;
    String t_name;
    String t_addr;
    int t_tel;
	public TheaterDTO() {
	}
	public TheaterDTO(int t_code, String t_name, String t_addr, int t_tel) {
		this.t_code = t_code;
		this.t_name = t_name;
		this.t_addr = t_addr;
		this.t_tel = t_tel;
	}
	public int getT_code() {
		return t_code;
	}
	public void setT_code(int t_code) {
		this.t_code = t_code;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_addr() {
		return t_addr;
	}
	public void setT_addr(String t_addr) {
		this.t_addr = t_addr;
	}
	public int getT_tel() {
		return t_tel;
	}
	public void setT_tel(int t_tel) {
		this.t_tel = t_tel;
	}
    
    
    

}
