package com.javalec.team.dto;


public class HallDTO {
    int h_code;
    String h_name;
    int t_code;
    
	public HallDTO() {
	}
	public HallDTO(int h_code, String h_name, int t_code) {
		this.h_code = h_code;
		this.h_name = h_name;
		this.t_code = t_code;
	}
	public int getH_code() {
		return h_code;
	}
	public void setH_code(int h_code) {
		this.h_code = h_code;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public int getT_code() {
		return t_code;
	}
	public void setT_code(int t_code) {
		this.t_code = t_code;
	}
    
    

}
