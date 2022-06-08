package com.javalec.team.dto;

import java.sql.Timestamp;

public class MovieDto {
	private String m_code;	//영화코드(pk)
	private Timestamp m_date;	//개봉일자
	private String m_date2;	//개봉일자
	
	private String m_title;	//영화제목
	private String m_intro;	//영화소개
	private int m_time;	//상영시간
	private Timestamp m_period;	//마지막상영일
	private int m_grade;	//관람등급
	private String m_genre;	//장르
//	private int r_code;	//리뷰코드
	private String m_director;	//감독명
	private int m_rate;	//평점
	private String m_position;	//영화포스터
	private String m_pics;	//영화스틸컷
	private String m_actor; //출연배우
	private String m_detail; //영화상세설명
	
	
	public String getM_actor() {
		return m_actor;
	}

	public void setM_actor(String m_actor) {
		this.m_actor = m_actor;
	}

	public String getM_detail() {
		return m_detail;
	}

	public void setM_detail(String m_detail) {
		this.m_detail = m_detail;
	}

	public String getM_date2() {
		return m_date2;
	}

	public void setM_date2(String m_date2) {
		this.m_date2 = m_date2;
	}
	
	
	public MovieDto() {
	}
	
	public MovieDto(String m_code, Timestamp m_date, String m_title, String m_intro, int m_time, Timestamp m_period,
			int m_grade, String m_genre, String m_director, int m_rate, String m_position, String m_pics) {
		this.m_code = m_code;
		this.m_date = m_date;
		this.m_title = m_title;
		this.m_intro = m_intro;
		this.m_time = m_time;
		this.m_period = m_period;
		this.m_grade = m_grade;
		this.m_genre = m_genre;
		this.m_director = m_director;
		this.m_rate = m_rate;
		this.m_position = m_position;
		this.m_pics = m_pics;
	}

	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public Timestamp getM_date() {
		return m_date;
	}
	public void setM_date(Timestamp m_date) {
		this.m_date = m_date;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_intro() {
		return m_intro;
	}
	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
	}
	public int getM_time() {
		return m_time;
	}
	public void setM_time(int m_time) {
		this.m_time = m_time;
	}
	public Timestamp getM_period() {
		return m_period;
	}
	public void setM_period(Timestamp m_period) {
		this.m_period = m_period;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_genre() {
		return m_genre;
	}
	public void setM_genre(String m_genre) {
		this.m_genre = m_genre;
	}
	public String getM_director() {
		return m_director;
	}
	public void setM_director(String m_director) {
		this.m_director = m_director;
	}
	public int getM_rate() {
		return m_rate;
	}
	public void setM_rate(int m_rate) {
		this.m_rate = m_rate;
	}
	public String getM_position() {
		return m_position;
	}
	public void setM_position(String m_position) {
		this.m_position = m_position;
	}
	public String getM_pics() {
		return m_pics;
	}
	public void setM_pics(String m_pics) {
		this.m_pics = m_pics;
	}
	
	
}
