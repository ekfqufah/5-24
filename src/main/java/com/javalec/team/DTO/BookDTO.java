package com.javalec.team.DTO;

public class BookDTO {
    int b_code;
    int sc_code;
    int h_code;
    String b_yn;
    String u_id;
    int se_code;

    public BookDTO(int b_code, int sc_code, int h_code, String b_yn, String u_id, int se_code) {
        this.b_code = b_code;
        this.sc_code = sc_code;
        this.h_code = h_code;
        this.b_yn = b_yn;
        this.u_id = u_id;
        this.se_code = se_code;
    }

    public int getB_code() {
        return b_code;
    }

    public void setB_code(int b_code) {
        this.b_code = b_code;
    }

    public int getSc_code() {
        return sc_code;
    }

    public void setSc_code(int sc_code) {
        this.sc_code = sc_code;
    }

    public int getH_code() {
        return h_code;
    }

    public void setH_code(int h_code) {
        this.h_code = h_code;
    }

    public String getB_yn() {
        return b_yn;
    }

    public void setB_yn(String b_yn) {
        this.b_yn = b_yn;
    }

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }

    public int getSe_code() {
        return se_code;
    }

    public void setSe_code(int se_code) {
        this.se_code = se_code;
    }
}
