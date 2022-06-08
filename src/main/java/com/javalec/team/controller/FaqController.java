package com.javalec.team.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.FaqDto;
import com.javalec.team.dto.pageMakerDto;
import com.javalec.team.service.FaqService;

@Controller
public class FaqController {

	@Autowired
	private FaqService service;
	
	@RequestMapping("/faq/list")
	public String list(@RequestParam HashMap<String, String> param, Model model, Criteria cri) {
		System.out.println("@@@### FaqController list() start");
		
//		ArrayList<FaqDto> dtos = service.list(param);
//		model.addAttribute("list", dtos);
		model.addAttribute("list", service.listPaging(cri));
		
		int total = service.getTotal();
		
		pageMakerDto pageMake = new pageMakerDto(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		System.out.println("@@@### FaqController list() end");
		
		return "/faq/list";
	}
	
//	@RequestMapping("/faq/list")
//	public String list(@RequestParam HashMap<String, String> param, Model model) {
//		System.out.println("@@@### FaqController list() start");
//		
//		ArrayList<FaqDto> dtos = service.list(param);
//		model.addAttribute("list", dtos);
//		
//		System.out.println("@@@### FaqController list() end");
//		
//		return "/faq/list";
//	}
	
	@RequestMapping("/faq/write_view")
	public String write_view(Model model) {
		System.out.println("@@@### write_view()");
		
		int num = service.num();
		
		System.out.println("Num ===>"+num);
		
		model.addAttribute("num", num);
		
		return "/faq/write";
	}
	
	@RequestMapping("/faq/write")
	public String write(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### FaqController write() start");
		
		service.write(param);
		
		System.out.println("@@@### FaqController write() end");
		
		return "redirect:list";
	}
	
	@RequestMapping("/faq/show")
	public String show(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### FaqController show() start");
		
		FaqDto dto = service.show(param);
		model.addAttribute("show", dto);
		
		System.out.println("@@@### FaqController show() end");
		
		return "/faq/show";
	}
	
	@RequestMapping("/faq/delete")
	public String delete(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### FaqController delete() start");
		
		service.delete(param);
		
		System.out.println("@@@### FaqController delete() end");
		
		return "redirect:list";
	}
	
	@RequestMapping("/faq/modify_view")
	public String modify_view(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### modify_view()");
		
		FaqDto dto = service.show(param);
		model.addAttribute("show", dto);
		
		return "/faq/modify";
	}
	
	@RequestMapping(value = "/faq/modify")
	public String modify(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### FaqController modify() start");
		
		service.modify(param);
		
		System.out.println("@@@### FaqController modify() end");
		
		return "redirect:list";
	}
}
