package com.javalec.team.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("review/list")
	public String list(Model model, Criteria cri) {
		System.out.println("@@@### ReivewController list() start");
		
		model.addAttribute("list", service.list(cri));
		
		int total = service.getTotal();
		
		pageMakerDto pageMake = new pageMakerDto(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		System.out.println("@@@### ReivewController list() end");
		
		return "/review/list";
	}
	
	@RequestMapping("/review/write_view") //�����ؾ��ҵ� �������������� �Ѿ�´�
	public String write_view() {
		System.out.println("@@@### write_view()");
		
		return "review/write";
	}
	
	@RequestMapping("/review/write")
	public String write(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### ReivewController write() start");
		
		service.write(param);
		
		ReviewDto dto = service.getMcode(param); //���� ���̺��� ��ȭ �ڵ� ������
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_code", Integer.toString(dto.getM_code())); //��ȭ�ڵ� map�� ����
		ReviewDto rateDto = service.getRateAvg(map);  //��ȭ�ڵ� �������� �ش翵ȭ�� ���� ��ճ�
		map.put("r_rate", Integer.toString(rateDto.getR_rate())); //���� map�� ����
		
		service.insertRate(map); //��ȭ ���̺� ���� ������Ʈ��
		
		System.out.println("@@@### ReivewController write() end");
		
		return "redirect:list";
	}
	
	@RequestMapping("/review/delete")
	public String delete(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### ReivewController delete() start");
		
		service.delete(param);
		
		System.out.println("@@@### ReivewController delete() end");
		
		return "redirect:list";
	}
	
	@RequestMapping("/review/modify_view")
	public String modify_view(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### modify_view()");
		
		ReviewDto dto = service.show(param);
		model.addAttribute("show", dto);
		
		return "/review/modify";
	}
	
	@RequestMapping(value = "/review/modify")
	public String modify(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### ReivewController modify() start");
		
		service.modify(param);
		
		System.out.println("@@@### ReivewController modify() end");
		
		return "redirect:list";
	}
	
	@RequestMapping("/good")
	@ResponseBody
	public int good(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### ReivewController good() start");
		
		System.out.println("ajax id ==>"+param.get("u_id"));
		System.out.println("ajax r_code ==>"+param.get("r_code"));
		
		GoodDto dto = goodservice.get(param);
		int result = 0;
		
		if (dto.getGo_yn() == 0) {
			result = 0;
		}else {
			result = 1;
		}
		
		model.addAttribute("result", result);
		System.out.println("@@@### ReivewController good() end");
		return result;
		
	}
}
