package com.javalec.team.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.javalec.team.dto.GoodsDto;
import com.javalec.team.dto.MovieDto;

public interface GoodsDao {
	public GoodsDto getGoods(HashMap<String, String> param);
	public void insertBuy(HashMap<String, String> param);
	public void insertGoods(HashMap<String, String> param);
	public void insertGoodsImg(HashMap<String, String> param);
	public GoodsDto getGoodsGcode();
	public ArrayList<GoodsDto> list_sort(HashMap<String, String> param);
	
	public void del_goods(HashMap<String, String> param);
	public GoodsDto show(HashMap<String, String> param);
	
	public void edit_goods(HashMap<String, String> param);
	public void edit_goodsimg(HashMap<String, String> param);
}
