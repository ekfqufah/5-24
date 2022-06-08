package com.javalec.team.dto;

import java.sql.Timestamp;

public class NoticeDto {
	private int n_code;
	private String u_id;
	private String n_title;
	private String n_content;
	private Timestamp n_date;
	private int n_view;
	private int n_num;
	private int rn;
	private int nn;
	
	
	public int getNn() {
		return nn;
	}

	public void setNn(int nn) {
		this.nn = nn;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public NoticeDto() {
		// TODO Auto-generated constructor stub
	}
	
	public NoticeDto(int n_num) {
		this.n_num = n_num;
	}

	public NoticeDto(int n_code, String u_id, String n_title, String n_content, Timestamp n_date, int n_view) {
		this.n_code = n_code;
		this.u_id = u_id;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_date = n_date;
		this.n_view = n_view;
	}

	public int getN_code() {
		return n_code;
	}
	public void setN_code(int n_code) {
		this.n_code = n_code;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Timestamp getN_date() {
		return n_date;
	}
	public void setN_date(Timestamp n_date) {
		this.n_date = n_date;
	}
	public int getN_view() {
		return n_view;
	}
	public void setN_view(int n_view) {
		this.n_view = n_view;
	}
	
	
}
