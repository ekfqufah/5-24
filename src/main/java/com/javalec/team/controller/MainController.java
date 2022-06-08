package com.javalec.team.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.team.dto.MovieDto;
import com.javalec.team.service.Reg_movie_Service;


@Controller
public class MainController {
	@Autowired
	private Reg_movie_Service reg_service;
	
	@RequestMapping("/")
	public String index(Model model) {
		ArrayList<MovieDto> list = reg_service.list();
		model.addAttribute("list", list);
		return "main/index";	
	}
	
	@RequestMapping("/mainHeader")
	public String mainHeader() {
		return "main/mainHeader";	
	}
	
	@RequestMapping("/main_movie_list")
	public String main_movie_list() {
		return "main/main_movie_list";	
	}
	
	@RequestMapping("/main_movie_list_test")
	public String main_movie_list_test() {
		return "main/main_movie_list_cgv";	
	}
}
