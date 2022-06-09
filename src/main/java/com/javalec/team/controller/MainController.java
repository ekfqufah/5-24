package com.javalec.team.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	public String main_movie_list(Model model) {
		
		ArrayList<MovieDto> list = reg_service.list();
		model.addAttribute("list", list);
		
		return "main/main_movie_list";	
	}
	

	//0526 정렬 체크
		@RequestMapping("/sort_check")
		public String sort_check(HttpServletRequest request, Model model) {
		
			System.out.println("request 값 제대로 나옴??? sort_check ===>"+request.getParameter("kind"));
			
			String sort = "";
			
			
			if (request.getParameter("kind") == null) {	// 처음화면 시작시 null값이라서. 첫화면 컨트롤러 새로 만들어서 그럴 일 없겠지만
				sort = "m_code desc";
				
			} else {
				
				if (request.getParameter("kind").trim().equals("최신순")) {
					sort = "m_date desc";
					System.out.println("ddd");
				} else if (request.getParameter("kind").trim().equals("오래된순")) {
					sort = "m_date";
				} else if (request.getParameter("kind").trim().equals("인기순")) {	// 일단 평점순으로 임시설정
					sort = "m_rate desc";
				}
			}
		
			// 정렬순 dao에 보내기 위해 담음
			model.addAttribute("sort", sort);
			ArrayList<MovieDto> list_sort = reg_service.list_sort(model);
			
			for (int i = 0; i < list_sort.size(); i++) {
				String str = String.valueOf(list_sort.get(i).getM_date());
				str = str.substring(0, 10);
				list_sort.get(i).setM_date2(str);
			}
			
			/*
			 * System.out.println(list_sort.get(0).getM_date());
			 * System.out.println(list_sort.get(0).getM_period());
			 */
			
			
			model.addAttribute("list", list_sort);
			model.addAttribute("sort_name", request.getParameter("kind"));
			
			return "main/main_movie_list";
		}
		//0531 영화 검색 - 근지
		@RequestMapping("/serch_mov_main")
		public String serch_mov_main(HttpServletRequest request, Model model) {
			System.out.println("검색 내용=====>"+request.getParameter("kind").trim());
			
			model.addAttribute("serch_mov",request.getParameter("kind").trim());	
			ArrayList<MovieDto> list_sort = reg_service.serch_mov(model);
			
			for (int i = 0; i < list_sort.size(); i++) {
				String str = String.valueOf(list_sort.get(i).getM_date());
				str = str.substring(0, 10);
				list_sort.get(i).setM_date2(str);
			}
			
			model.addAttribute("list", list_sort);
			return "main/main_movie_list";
		}
	
		
	
}
