package com.javalec.team.dto;

import java.sql.Date;

public class ScreenDTO {
    int sc_code;
    int m_code;
    int h_num;
    Date m_date;
    Date m_period;

    public ScreenDTO() {
    }

    public ScreenDTO(int sc_code, int m_code, int h_num, Date m_date, Date m_period) {
        this.sc_code = sc_code;
        this.m_code = m_code;
        this.h_num = h_num;
        this.m_date = m_date;
        this.m_period = m_period;
    }

    public int getSc_code() {
        return sc_code;
    }

    public void setSc_code(int sc_code) {
        this.sc_code = sc_code;
    }

    public int getM_code() {
        return m_code;
    }

    public void setM_code(int m_code) {
        this.m_code = m_code;
    }

    public int getH_num() {
        return h_num;
    }

    public void setH_num(int h_num) {
        this.h_num = h_num;
    }

    public Date getM_date() {
        return m_date;
    }

    public void setM_date(Date m_date) {
        this.m_date = m_date;
    }

    public Date getM_period() {
        return m_period;
    }

    public void setM_period(Date m_period) {
        this.m_period = m_period;
    }
}
