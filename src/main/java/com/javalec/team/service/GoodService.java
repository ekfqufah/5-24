package com.javalec.team.service;

import java.util.HashMap;

import com.javalec.team.dto.GoodDto;

public interface GoodService {
	public void insert(HashMap<String, String> param);
	public GoodDto get(HashMap<String, String> param);
}
