package com.javalec.team.dto;

import java.util.Date;

public class ScreenDTO {
    int sc_code;
    String sc_time;
    int t_code;
    Date sc_date;
    int m_code;
    int h_code;

    public ScreenDTO(int sc_code, String sc_time, int t_code, Date sc_date, int m_code, int h_code) {
        this.sc_code = sc_code;
        this.sc_time = sc_time;
        this.t_code = t_code;
        this.sc_date = sc_date;
        this.m_code = m_code;
        this.h_code = h_code;
    }

    public int getSc_code() {
        return sc_code;
    }

    public void setSc_code(int sc_code) {
        this.sc_code = sc_code;
    }

    public String getSc_time() {
        return sc_time;
    }

    public void setSc_time(String sc_time) {
        this.sc_time = sc_time;
    }

    public int getT_code() {
        return t_code;
    }

    public void setT_code(int t_code) {
        this.t_code = t_code;
    }

    public Date getSc_date() {
        return sc_date;
    }

    public void setSc_date(Date sc_date) {
        this.sc_date = sc_date;
    }

    public int getM_code() {
        return m_code;
    }

    public void setM_code(int m_code) {
        this.m_code = m_code;
    }

    public int getH_code() {
        return h_code;
    }

    public void setH_code(int h_code) {
        this.h_code = h_code;
    }
}
