package com.javalec.team.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.FaqDto;

public interface FaqDao {
	public ArrayList<FaqDto> list(HashMap<String, String> param);
	public ArrayList<FaqDto> listPaging(Criteria cri);
	public void write(HashMap<String, String> param);
	public FaqDto show(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
//	public ArrayList<FaqDto> search(HashMap<String, String> param);     수정해야함
	public int num();
    /* 게시판 총 갯수 */
    public int getTotal();
}
