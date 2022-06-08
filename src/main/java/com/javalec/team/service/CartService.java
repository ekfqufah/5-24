package com.javalec.team.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.javalec.team.dto.CartDto;

public interface CartService {
	public void insertCart(HashMap<String, String> param);
	public ArrayList<CartDto> getAllCart(HashMap<String, String> param);
	public CartDto cartlistbuy(HashMap<String, String> param);
	public void  delCart(HashMap<String, String> param);
	public void  updateCart(HashMap<String, String> param);
	
	
	
}
