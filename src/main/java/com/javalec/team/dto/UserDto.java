package com.javalec.team.dto;

import java.sql.Timestamp;

public class UserDto {
	private String u_id;
	private String u_pwd;
	private String u_name;
	private String u_addr1;	//快祈锅龋
	private String u_addr2;	//林家
	private String u_addr3;	//惑技林家
	private Timestamp u_date;
	private String u_birth;
	private String u_tel;
	private String u_email;
	private String u_auth;
	private int u_point;
	private int u_money;
	
	private int uidcheck;
	

	public UserDto() {
		// TODO Auto-generated constructor stub
	}
	
	public UserDto(String u_id, String u_pwd, String u_name, String u_addr1, String u_addr2, String u_addr3,
			Timestamp u_date, String u_birth, String u_tel, String u_email, String u_auth, int u_point, int u_money) {
		this.u_id = u_id;
		this.u_pwd = u_pwd;
		this.u_name = u_name;
		this.u_addr1 = u_addr1;
		this.u_addr2 = u_addr2;
		this.u_addr3 = u_addr3;
		this.u_date = u_date;
		this.u_birth = u_birth;
		this.u_tel = u_tel;
		this.u_email = u_email;
		this.u_auth = u_auth;
		this.u_point = u_point;
		this.u_money = u_money;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_addr1() {
		return u_addr1;
	}

	public void setU_addr1(String u_addr1) {
		this.u_addr1 = u_addr1;
	}

	public String getU_addr2() {
		return u_addr2;
	}

	public void setU_addr2(String u_addr2) {
		this.u_addr2 = u_addr2;
	}

	public String getU_addr3() {
		return u_addr3;
	}

	public void setU_addr3(String u_addr3) {
		this.u_addr3 = u_addr3;
	}

	public Timestamp getU_date() {
		return u_date;
	}

	public void setU_date(Timestamp u_date) {
		this.u_date = u_date;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_tel() {
		return u_tel;
	}

	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_auth() {
		return u_auth;
	}

	public void setU_auth(String u_auth) {
		this.u_auth = u_auth;
	}

	public int getU_point() {
		return u_point;
	}

	public void setU_point(int u_point) {
		this.u_point = u_point;
	}

	public int getU_money() {
		return u_money;
	}

	public void setU_money(int u_money) {
		this.u_money = u_money;
	}

	public int getUidcheck() {
		return uidcheck;
	}
	
	public void setUidcheck(int uidcheck) {
		this.uidcheck = uidcheck;
	}

	@Override
	public String toString() {
		return "UserDto [u_id=" + u_id + ", u_pwd=" + u_pwd + ", u_name=" + u_name + ", u_addr1=" + u_addr1
				+ ", u_addr2=" + u_addr2 + ", u_addr3=" + u_addr3 + ", u_date=" + u_date + ", u_birth=" + u_birth
				+ ", u_tel=" + u_tel + ", u_email=" + u_email + ", u_auth=" + u_auth + ", u_point=" + u_point
				+ ", u_money=" + u_money + "]";
	}
	
	
}
