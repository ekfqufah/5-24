package com.javalec.team.DTO;

public class SeatDTO {
    int se_code;
    int p_price;
    int h_code;

    public SeatDTO(int se_code, int p_price, int h_code) {
        this.se_code = se_code;
        this.p_price = p_price;
        this.h_code = h_code;
    }

    public int getSe_code() {
        return se_code;
    }

    public void setSe_code(int se_code) {
        this.se_code = se_code;
    }

    public int getP_price() {
        return p_price;
    }

    public void setP_price(int p_price) {
        this.p_price = p_price;
    }

    public int getH_code() {
        return h_code;
    }

    public void setH_code(int h_code) {
        this.h_code = h_code;
    }
}
