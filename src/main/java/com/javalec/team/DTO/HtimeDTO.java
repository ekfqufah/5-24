package com.javalec.team.dto;

public class HtimeDTO {
    private int h_num;
    private String h_time;
    private int h_st;

    public HtimeDTO(int h_num, String h_time, int h_st) {
        this.h_num = h_num;
        this.h_time = h_time;
        this.h_st = h_st;
    }

    public int getH_num() {
        return h_num;
    }

    public void setH_num(int h_num) {
        this.h_num = h_num;
    }

    public String getH_time() {
        return h_time;
    }

    public void setH_time(String h_time) {
        this.h_time = h_time;
    }

    public int getH_st() {
        return h_st;
    }

    public void setH_st(int h_st) {
        this.h_st = h_st;
    }
}
