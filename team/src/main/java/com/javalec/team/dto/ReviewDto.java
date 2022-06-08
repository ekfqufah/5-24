package com.javalec.team.dto;

import java.sql.Timestamp;

public class ReviewDto {
	private int r_code;
	private String r_name;
	private String u_id; //유저아이디 일단 만듦 fk걸어야 함 
	private int b_code; //예매코드 일단 만듦
//	private int b_yn;
	private Timestamp r_date;
	private int r_rate;
	private int r_good;
	private int m_code;
	
	private int rn;
	private int nn;
	
	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}
	
	

	public ReviewDto(int m_code) {
		this.m_code = m_code;
	}



	public int getM_code() {
		return m_code;
	}



	public void setM_code(int m_code) {
		this.m_code = m_code;
	}



	public ReviewDto(int r_code, String r_name, String u_id, int b_code, Timestamp r_date, int r_rate, int r_good,
			int rn, int nn) {
		this.r_code = r_code;
		this.r_name = r_name;
		this.u_id = u_id;
		this.b_code = b_code;
		this.r_date = r_date;
		this.r_rate = r_rate;
		this.r_good = r_good;
		this.rn = rn;
		this.nn = nn;
	}



	public int getR_code() {
		return r_code;
	}

	public void setR_code(int r_code) {
		this.r_code = r_code;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getB_code() {
		return b_code;
	}

	public void setB_code(int b_code) {
		this.b_code = b_code;
	}

	public Timestamp getR_date() {
		return r_date;
	}

	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}

	public int getR_rate() {
		return r_rate;
	}

	public void setR_rate(int r_rate) {
		this.r_rate = r_rate;
	}

	public int getR_good() {
		return r_good;
	}

	public void setR_good(int r_good) {
		this.r_good = r_good;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getNn() {
		return nn;
	}

	public void setNn(int nn) {
		this.nn = nn;
	}
	
	

}
