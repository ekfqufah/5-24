package com.javalec.team.dto;

import java.util.Date;

public class MovieDTO {
    private String m_code;
    private Date m_date;
    private String m_title;
    private String m_intro;
    private int m_time;
    private Date m_period;
    private int m_grade;
    private String m_genre;
    private String m_director;
    private int m_rate;
    private String m_position;
    private String m_pics;

    public MovieDTO(String m_code, Date m_date, String m_title, String m_intro, int m_time, Date m_period, int m_grade, String m_genre, String m_director, int m_rate, String m_position, String m_pics) {
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

    public Date getM_date() {
        return m_date;
    }

    public void setM_date(Date m_date) {
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

    public Date getM_period() {
        return m_period;
    }

    public void setM_period(Date m_period) {
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

    @Override
    public String toString() {
        return "MovieDTO{" +
                "m_code='" + m_code + '\'' +
                ", m_date=" + m_date +
                ", m_title='" + m_title + '\'' +
                ", m_intro='" + m_intro + '\'' +
                ", m_time=" + m_time +
                ", m_period=" + m_period +
                ", m_grade=" + m_grade +
                ", m_genre='" + m_genre + '\'' +
                ", m_director='" + m_director + '\'' +
                ", m_rate=" + m_rate +
                ", m_position='" + m_position + '\'' +
                ", m_pics='" + m_pics + '\'' +
                '}';
    }
}
