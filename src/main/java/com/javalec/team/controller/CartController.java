package com.javalec.team.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.team.dto.CartDto;
import com.javalec.team.dto.GoodsDto;
import com.javalec.team.service.CartService;
import com.javalec.team.service.GoodsService;

@Controller
public class CartController {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private CartService cartservice;
	@Autowired
	private GoodsService goodsService;
	ArrayList<CartDto> cartlist = new ArrayList<CartDto>();

	@RequestMapping("cartProcess")
	public String cartProcess(@RequestParam HashMap<String, String> param,Model model) {
		cartlist(param,null);
		int g_code = Integer.parseInt(param.get("g_code")) ;
		for (int i = 0; i < cartlist.size(); i++) {
			if( g_code == cartlist.get(i).getG_code()) {
				updateCart(param, model);
				return "redirect:goodsList";	
			}
		}
		int price = Integer.parseInt(param.get("g_price"))*Integer.parseInt(param.get("c_amount"));
		param.put("g_price", Integer.toString(price));
		cartservice.insertCart(param);
		return "redirect:/";	
	}
	
	@RequestMapping("cartlist")
	public String cartlist(@RequestParam HashMap<String, String> param,Model model) {	
		cartlist =cartservice.getAllCart(param);
		if(model !=null) {
//			System.out.println(param.get("u_id"));
//			System.out.println("@@@@@@@@@@@"+cartlist.get(0).getImg_1());
			model.addAttribute("cartlist",cartlist);
			return "cart/cartlist";	
			/*if(cartlist.size() > 0 ) {
				
			}else {
				model.addAttribute("cart","0");
				return "redirect:index";
			}*/
		}else {
			return null;
		}
	}
	
	@RequestMapping("/cartlistbuy")
	public ArrayList<CartDto> cartlistbuy(String[] c_code) {
		 ArrayList<CartDto> cartlist = new ArrayList<CartDto>();
		 HashMap<String, String> param = new HashMap<String, String>();
		for (int i = 0; i < c_code.length; i++) {
			param.put("c_code", c_code[i]);
			param.put("u_id", "wjdcksgml");
			CartDto cartDto = cartservice.cartlistbuy(param);
			cartlist.add(cartDto);
		}
		return cartlist;
	}
	
	@RequestMapping("/deleteCart")
	public String deleteCart(@RequestParam HashMap<String, String> param,Model model) {

		if(model!=null) {
		cartservice.delCart(param);
		ArrayList<CartDto> cartlist =cartservice.getAllCart(param);
		model.addAttribute("cartlist",cartlist);
		return "cart/cartlist";
		}else {
			cartservice.delCart(param);
			return null;
		}
	}
	
	@RequestMapping("/updateCart")
	public String updateCart(@RequestParam HashMap<String, String> param,Model model) {
		GoodsDto gooddto = goodsService.getGoods(param);
		param.put("g_price",Integer.toString(Integer.parseInt(param.get("c_amount"))* gooddto.getG_price()));
		cartservice.updateCart(param);
		ArrayList<CartDto> cartlist =cartservice.getAllCart(param);
		model.addAttribute("cartlist",cartlist);
		 return "cart/cartlist"; 
	}
}

