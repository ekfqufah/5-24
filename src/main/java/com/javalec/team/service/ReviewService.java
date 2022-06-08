package com.javalec.team.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.MovieDto;
import com.javalec.team.dto.ReviewDto;

public interface ReviewService {
	public ArrayList<ReviewDto> list(Criteria cri);
	public void write(HashMap<String, String> param);
	public ReviewDto show(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
    public int getTotal();
    public void upView(HashMap<String, String> param);
    public void insertRate(HashMap<String, String> param);
    public ReviewDto getMcode(HashMap<String, String> param);
    public ReviewDto getRateAvg(HashMap<String, String> param);
   
}
