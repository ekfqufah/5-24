package com.javalec.team.dto;

public class MovieMemory {
    String movieName; //�삁留� �쁺�솕 �젣紐�
    String theaterName; //�삁留� �쁺�솕愿�
    String regionName; //�삁留� �쁺�솕愿� 吏��뿭
    String date; //�삁留� �궇吏�
    String hall; //�삁留� �긽�쁺愿�
    String time; //�삁留� �떆媛�
    String mcode; //�삁留� �쁺�솕 肄붾뱶
    
    
    
	public MovieMemory() {
	}

	public MovieMemory(String movieName, String theaterName, String regionName, String date, String hall, String time,
			String mcode) {
		this.movieName = movieName;
		this.theaterName = theaterName;
		this.regionName = regionName;
		this.date = date;
		this.hall = hall;
		this.time = time;
		this.mcode = mcode;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHall() {
		return hall;
	}

	public void setHall(String hall) {
		this.hall = hall;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
    
    
    
    
    
}

