package com.javalec.team.dao;

import java.util.HashMap;

import com.javalec.team.dto.GoodDto;

public interface GoodDao {
	public void insert(HashMap<String, String> param);
	public GoodDto get(HashMap<String, String> param);
}
