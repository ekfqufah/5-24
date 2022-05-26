package com.javalec.team.dto;

public class TestDTO {
    private String mCode;
    private String tCOde;
    private String tName;

    public TestDTO(String mCode, String tCOde, String tName) {
        this.mCode = mCode;
        this.tCOde = tCOde;
        this.tName = tName;
    }

    public String getmCode() {
        return mCode;
    }

    public void setmCode(String mCode) {
        this.mCode = mCode;
    }

    public String gettCOde() {
        return tCOde;
    }

    public void settCOde(String tCOde) {
        this.tCOde = tCOde;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }
}
