package com.javalec.team.DTO;

public class HallDTO {
    int h_code;
    int t_code;
    String h_name;

    public HallDTO(int h_code, int t_code, String h_name) {
        this.h_code = h_code;
        this.t_code = t_code;
        this.h_name = h_name;
    }

    public int getH_code() {
        return h_code;
    }

    public void setH_code(int h_code) {
        this.h_code = h_code;
    }

    public int getT_code() {
        return t_code;
    }

    public void setT_code(int t_code) {
        this.t_code = t_code;
    }

    public String getH_name() {
        return h_name;
    }

    public void setH_name(String h_name) {
        this.h_name = h_name;
    }
}
