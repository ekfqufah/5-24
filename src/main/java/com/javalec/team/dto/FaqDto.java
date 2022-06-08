package com.javalec.team.dto;

import java.sql.Timestamp;

public class FaqDto {
	private int f_code;
	private String u_id;
	private String f_category;
	private String f_title;
	private String f_content;
	private Timestamp f_date;
	private int f_num;
	private int rn;
	
	
	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public FaqDto() {
		// TODO Auto-generated constructor stub
	}
	
	public FaqDto(int f_code, String u_id, String f_category, String f_title, String f_content, Timestamp f_date,
			int f_num) {
		this.f_code = f_code;
		this.u_id = u_id;
		this.f_category = f_category;
		this.f_title = f_title;
		this.f_content = f_content;
		this.f_date = f_date;
		this.f_num = f_num;
	}

	public int getF_code() {
		return f_code;
	}
	public void setF_code(int f_code) {
		this.f_code = f_code;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getF_category() {
		return f_category;
	}
	public void setF_category(String f_category) {
		this.f_category = f_category;
	}
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public Timestamp getF_date() {
		return f_date;
	}
	public void setF_date(Timestamp f_date) {
		this.f_date = f_date;
	}
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	
	
}