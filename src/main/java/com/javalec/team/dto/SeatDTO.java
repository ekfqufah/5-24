package com.javalec.team.dto;


public class SeatDTO {
    String se_code;
    int h_code;
    
	public SeatDTO() {
	}
	public SeatDTO(String se_code, int h_code) {
		this.se_code = se_code;
		this.h_code = h_code;
	}
	public String getSe_code() {
		return se_code;
	}
	public void setSe_code(String se_code) {
		this.se_code = se_code;
	}
	public int getH_code() {
		return h_code;
	}
	public void setH_code(int h_code) {
		this.h_code = h_code;
	}
    
    
    
    
}
