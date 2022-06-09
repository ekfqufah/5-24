package com.javalec.team.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.GoodDto;
import com.javalec.team.dto.ReviewDto;
import com.javalec.team.dto.pageMakerDto;
import com.javalec.team.service.GoodService;
import com.javalec.team.service.ReviewService;

@Controller
public class ReivewController {

	@Autowired
	HttpSession session;
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private GoodService goodservice;
	
	@RequestMapping("reviewList")
	public String list(Model model, Criteria cri) {
		System.out.println("@@@### ReivewController list() start");
		
		model.addAttribute("list", service.list(cri));
		
		int total = service.getTotal();
		
		pageMakerDto pageMake = new pageMakerDto(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		System.out.println("@@@### ReivewController list() end");
		
		return "/review/list";
	}
	
	@RequestMapping("/reviewWrite_view") //수정해야할듯 마이페이지에서 넘어온다
	public String write_view() {
		System.out.println("@@@### write_view()");
		
		return "review/write";
	}
	
	@RequestMapping("/reviewWrite")
	public String write(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### ReivewController write() start");
		
		service.write(param);
		
		ReviewDto dto = service.getMcode(param); //예매 테이블에서 영화 코드 가져옴
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_code", Integer.toString(dto.getM_code())); //영화코드 map에 담음
		ReviewDto rateDto = service.getRateAvg(map);  //영화코드 조건으로 해당영화의 평점 평균냄
		map.put("r_rate", Integer.toString(rateDto.getR_rate())); //평점 map에 담음
		
		service.insertRate(map); //영화 테이블에 평점 업데이트함
		
		System.out.println("@@@### ReivewController write() end");
		
		return "redirect:reviewList";
	}
	
	@RequestMapping("/reviewDelete")
	public String delete(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### ReivewController delete() start");
		
		service.delete(param);
		
		System.out.println("@@@### ReivewController delete() end");
		
		return "redirect:reviewList";
	}
	
	@RequestMapping("/reviewModify_view")
	public String modify_view(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### modify_view()");
		
		ReviewDto dto = service.show(param);
		model.addAttribute("show", dto);
		
		return "/review/modify";
	}
	
	@RequestMapping(value = "/reviewModify")
	public String modify(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### ReivewController modify() start");
		
		service.modify(param);
		
		System.out.println("@@@### ReivewController modify() end");
		
		return "redirect:reviewList";
	}
	
	@RequestMapping("/reviewGood")
	public String good(@RequestParam HashMap<String, String> param, HttpServletResponse response) throws IOException {
		System.out.println("@@@### ReivewController good() start");
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		//추천수를 올리기전에 추천 테이블 만들고 거기에 유저아이디, 리뷰코드, 추천코드, 추천yn만든다
		GoodDto dto = goodservice.get(param);
		if (goodservice.get(param) == null) {
			System.out.println("추천한적 없음 start");
			goodservice.insert(param);
			service.upGood(param);
			System.out.println("추천한적 없음 end");
		} else {
			System.out.println("추천한적 있음 start");
			
			out.println("<script>alert('이미 추천한 글입니다.');history.back();</script>");
			out.flush();
			
		}
		
		System.out.println("@@@### ReivewController good() end");
		
		return "redirect:reviewList";
	}
	
//	@RequestMapping("/good")
//	@ResponseBody
//	public int good(@RequestParam HashMap<String, String> param, Model model) {
//		System.out.println("@@@### ReivewController good() start");
//		
//		System.out.println("ajax id ==>"+param.get("u_id"));
//		System.out.println("ajax r_code ==>"+param.get("r_code"));
//		
//		GoodDto dto = goodservice.get(param);
//		int result = 0;
//		
//		if (dto.getGo_yn() == 0) {
//			result = 0;
//		}else {
//			result = 1;
//		}
//		
//		model.addAttribute("result", result);
//		System.out.println("@@@### ReivewController good() end");
//		return result;
//		
//	}
}
