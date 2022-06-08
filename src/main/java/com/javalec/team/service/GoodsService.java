package com.javalec.team.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.javalec.team.dto.GoodsDto;
import com.javalec.team.dto.MovieDto;

public interface GoodsService {
	public GoodsDto getGoods(HashMap<String, String> param);
	public void insertBuy(HashMap<String, String> param);
	
	public void insertGoods(HashMap<String, String> param);
	public void insertGoodsImg(HashMap<String, String> param);
	public GoodsDto getGoodsGcode();
	public ArrayList<GoodsDto> list_sort(HashMap<String, String> param);
}
