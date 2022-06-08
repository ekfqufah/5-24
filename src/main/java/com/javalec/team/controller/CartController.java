package com.javalec.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.team.dao.CartDao;
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
//		System.out.println(param.get("g_code"));
//		System.out.println(param.get("g_name"));
//		System.out.println(param.get("g_price"));
//		System.out.println("들어옴?");
		cartlist(param,null);
//		System.out.println("@@"+param.get("g_code"));
//		System.out.println(param.get("g_name"));
//		System.out.println(param.get("g_price"));
//		System.out.println(param.get("c_amount"));
//		System.out.println(param.get("u_id"));
		
		int g_code = Integer.parseInt(param.get("g_code")) ;
		
		for (int i = 0; i < cartlist.size(); i++) {
			if( g_code == cartlist.get(i).getG_code()) {
//				System.out.println("g_code"+g_code);
//				System.out.println("안에있음?");
				updateCart(param, model);
//				return "redirect:goodsDisplay?g_code="+g_code;
				return "redirect:index";	
			}
		}
		
		
		
		//System.out.println(param.get("u_id"));
		int price = Integer.parseInt(param.get("g_price"))*Integer.parseInt(param.get("c_amount"));
		param.put("g_price", Integer.toString(price));
//		System.out.println(param.get("c_amount"));
		cartservice.insertCart(param);
		return "redirect:index";	
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
	public ArrayList<CartDto> cartlistbuy(String[] c_code,String u_id) {
		 ArrayList<CartDto> cartlist = new ArrayList<CartDto>();
		 HashMap<String, String> param = new HashMap<String, String>();
		for (int i = 0; i < c_code.length; i++) {
			param.put("c_code", c_code[i]);
			param.put("u_id", u_id);
			System.out.println("@@"+u_id);
			System.out.println("@@@"+c_code[i]);
			CartDto cartDto = cartservice.cartlistbuy(param);
			System.out.println("cartDto"+cartDto.getG_price());
			cartlist.add(cartDto);
		}
		return cartlist;
	}
	
	@RequestMapping("/deleteCart")
	public String deleteCart(@RequestParam HashMap<String, String> param,Model model) {
		//System.out.println("들어오냐?");
		
		if(model!=null) {
		cartservice.delCart(param);
		ArrayList<CartDto> cartlist =cartservice.getAllCart(param);
		model.addAttribute("cartlist",cartlist);
		return "cart/cartlist";
	
		//return "cart/cartdata";	
		}else {
			cartservice.delCart(param);
			//System.out.println("여기????");
			return null;
		}
	}
	
	@RequestMapping("/updateCart")
	public String updateCart(@RequestParam HashMap<String, String> param,Model model) {
		//System.out.println(param.get("u_id"));
	
		GoodsDto gooddto = goodsService.getGoods(param);
		param.put("g_price",Integer.toString(Integer.parseInt(param.get("c_amount"))* gooddto.getG_price()));
		/*
		 * System.out.println("g_price"+param.get("g_price"));
		 * System.out.println("c_code"+param.get("c_code"));
		 * System.out.println("u_id"+param.get("u_id"));
		 * System.out.println("c_amount"+param.get("c_amount"));
		 */
		cartservice.updateCart(param);
		ArrayList<CartDto> cartlist =cartservice.getAllCart(param);
		model.addAttribute("cartlist",cartlist);
		 return "cart/cartlist"; 
	}
	
}

