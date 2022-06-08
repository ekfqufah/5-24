package com.javalec.team.dto;

import java.sql.Timestamp;

public class QnaDto {
	private int q_code;
	private String u_id;
	private String q_category;
	private String q_title;
	private String q_content;
	private Timestamp q_date;
	private int q_num;
	private String q_email;
	private String q_answer;
	private int rn;
	
	
	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public QnaDto(String q_answer) {
		this.q_answer = q_answer;
	}

	public String getQ_answer() {
		return q_answer;
	}

	public void setQ_answer(String q_answer) {
		this.q_answer = q_answer;
	}

	public QnaDto() {
		// TODO Auto-generated constructor stub
	}
	
	public QnaDto(int q_code, String u_id, String q_category, String q_title, String q_content, Timestamp q_date,
			int q_num, String q_email) {
		this.q_code = q_code;
		this.u_id = u_id;
		this.q_category = q_category;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.q_num = q_num;
		this.q_email = q_email;
	}

	public int getQ_code() {
		return q_code;
	}
	public void setQ_code(int q_code) {
		this.q_code = q_code;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getQ_category() {
		return q_category;
	}
	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Timestamp getQ_date() {
		return q_date;
	}
	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getQ_email() {
		return q_email;
	}
	public void setQ_email(String q_email) {
		this.q_email = q_email;
	}
	
}
