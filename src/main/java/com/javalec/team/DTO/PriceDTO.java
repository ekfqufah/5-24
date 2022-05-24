package com.javalec.team.DTO;

public class PriceDTO {
    int p_code;
    int p_price;

    public PriceDTO(int p_code, int p_price) {
        this.p_code = p_code;
        this.p_price = p_price;
    }

    public int getP_code() {
        return p_code;
    }

    public void setP_code(int p_code) {
        this.p_code = p_code;
    }

    public int getP_price() {
        return p_price;
    }

    public void setP_price(int p_price) {
        this.p_price = p_price;
    }
}
