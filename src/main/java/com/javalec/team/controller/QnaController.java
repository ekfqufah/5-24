package com.javalec.team.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.QnaDto;
import com.javalec.team.dto.UserDto;
import com.javalec.team.dto.pageMakerDto;
import com.javalec.team.service.QnaService;
import com.javalec.team.service.UserService;
import com.javalec.team.service.Impl.MailSendService2;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@Autowired
	private UserService service2;
	
	@Autowired
	private MailSendService2 mailService1;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/qna_main")
	public String qna_main(Model model) {
		System.out.println("@@@### qna_main()");
		
		String u_id = (String) session.getAttribute("u_id");
		String u_auth = (String) session.getAttribute("u_auth");
		
		System.out.println("캐스팅안한 id="+session.getAttribute("u_id"));
		System.out.println("캐스팅안한 auth="+session.getAttribute("u_auth"));
		System.out.println("string으로 받은 id="+u_id);
		System.out.println("string으로 받은 auth="+u_auth);
		
		if (session.getAttribute("u_auth") == null) {
			System.out.println("@@@### doesn't login");
			
			return "qna/write";
			
		} else if (session.getAttribute("u_auth").equals("C")){
			System.out.println("@@@### login");
			
			System.out.println("@@@### userInfo start");

			HashMap<String, String> map = new HashMap<String, String>();
			map.put("u_id", u_id);
			
			System.out.println(map.get("u_id"));
			
			UserDto dto = service2.confirmUserId(map);
			model.addAttribute("userInfo", dto);
			
			System.out.println("@@@### userInfo end");
			
			return "qna/write";
			
		} else {
			System.out.println("@@@### admin");
			
			System.out.println("@@@### adminInfo start");
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("u_id", u_id);
			map.put("u_auth", u_auth);
			
			UserDto dto = service2.confirmUserId(map);
			model.addAttribute("adminInfo", dto);
			
			System.out.println("@@@### adminInfo end");
			
			return "redirect:/qnaList";
			
		}
		
	}
	
	@RequestMapping("/qnaList")
	public String list(@RequestParam HashMap<String, String> param, Model model, Criteria cri) {
		System.out.println("@@@### QnaController list() start");
		
		int total = service.getTotal();
		
		
		if (session.getAttribute("u_auth") == null) {
			System.out.println("nonuser go list start");
			
			System.out.println("이메일 잘받아왔나?"+param.get("q_email"));
			
			System.out.println("세션으로 받은 메일="+session.getAttribute("q_email"));
			
			if (param.get("q_email") == null) {
				System.out.println("param email이 null임 session으로 받음");
				cri.setQ_email((String) session.getAttribute("q_email"));
				
				System.out.println("cri PageNum ===>"+cri.getPageNum());
				System.out.println("cri Amount ===>"+cri.getAmount());
				System.out.println("cri Q_email ===>"+cri.getQ_email());
				
				param.put("q_email", (String) session.getAttribute("q_email"));
				int newTotal = service.newGetTotal(param);
				
				pageMakerDto pageMake = new pageMakerDto(cri, newTotal);
				
				model.addAttribute("pageMaker", pageMake);
				
			}else {
				System.out.println("session email이 null임 param으로 받음");
				cri.setQ_email(param.get("q_email"));
				
				System.out.println("cri PageNum ===>"+cri.getPageNum());
				System.out.println("cri Amount ===>"+cri.getAmount());
				System.out.println("cri Q_email ===>"+cri.getQ_email());
				
				int newTotal = service.newGetTotal(param);
				pageMakerDto pageMake = new pageMakerDto(cri, newTotal);
				
				model.addAttribute("pageMaker", pageMake);
				
			}

			
			
			ArrayList<QnaDto> dtos = service.newListPaging(cri);
			model.addAttribute("list", dtos);
			
			System.out.println("nonuser go list end");
			
			System.out.println("@@@### QnaController list() end");
			
			return "qna/list";

		} else if (session.getAttribute("u_auth").equals("A")) {
			System.out.println("admin go list start");
			
			cri.setQ_email((String) session.getAttribute("q_email"));
			
			System.out.println("cri PageNum ===>"+cri.getPageNum());
			System.out.println("cri Amount ===>"+cri.getAmount());
			System.out.println("cri Q_email ===>"+cri.getQ_email());
			
			pageMakerDto pageMake = new pageMakerDto(cri, total);
			
			model.addAttribute("pageMaker", pageMake);
			
			ArrayList<QnaDto> dtos = service.listPaging(cri);
			model.addAttribute("list", dtos);
			
			System.out.println("admin go list end");
			
			System.out.println("@@@### QnaController list() end");
			
			return "qna/list";
			
		} else {
			System.out.println("user go list start");
			
			System.out.println("이메일 잘받아왔나?"+param.get("q_email"));
			
			System.out.println("세션으로 받은 메일="+session.getAttribute("q_email"));
			
			
			//session.getAttribute("q_email"); 여러번 글 쓰면 세션 엉키나?
			
			
			if (param.get("q_email") == null) {
				param.put("q_email", (String) session.getAttribute("q_email"));
				
				cri.setQ_email((String) session.getAttribute("q_email"));
				
				System.out.println("cri PageNum ===>"+cri.getPageNum());
				System.out.println("cri Amount ===>"+cri.getAmount());
				System.out.println("cri Q_email ===>"+cri.getQ_email());
				
				ArrayList<QnaDto> dtos = service.newListPaging(cri);
				model.addAttribute("list", dtos);
				
				int newTotal = service.newGetTotal(param);
				pageMakerDto pageMake = new pageMakerDto(cri, newTotal);
				
				model.addAttribute("pageMaker", pageMake);
				
				
			} else {
				
				cri.setQ_email(param.get("q_email"));
				
				System.out.println("cri PageNum ===>"+cri.getPageNum());
				System.out.println("cri Amount ===>"+cri.getAmount());
				System.out.println("cri Q_email ===>"+cri.getQ_email());
				
				ArrayList<QnaDto> dtos = service.newListPaging(cri);
				model.addAttribute("list", dtos);
				
				int newTotal = service.newGetTotal(param);
				pageMakerDto pageMake = new pageMakerDto(cri, newTotal);
				
				model.addAttribute("pageMaker", pageMake);
				
				System.out.println("cri PageNum ===>"+cri.getPageNum());
				System.out.println("cri Amount ===>"+cri.getAmount());
				System.out.println("cri Q_email ===>"+cri.getQ_email());
			}
			
			
			System.out.println("user go list end");
			
			System.out.println("@@@### QnaController list() end");
			
			return "qna/list";
		}
		
	}
	
//	@RequestMapping("/qna/list")
//	public String list(@RequestParam HashMap<String, String> param, Model model) {
//		System.out.println("@@@### QnaController list() start");
//		
//		if (session.getAttribute("u_auth") == null) {
//			System.out.println("nonuser go list start");
//			
//			System.out.println("이메일 잘받아왔나?"+param.get("q_email"));
//			
//			System.out.println("세션으로 받은 메일="+session.getAttribute("q_email"));
//			
//			param.put("q_email", (String) session.getAttribute("q_email"));
//			
//			ArrayList<QnaDto> dtos = service.newList(param);
//			model.addAttribute("list", dtos);
//			
//			System.out.println("nonuser go list end");
//			
//			System.out.println("@@@### QnaController list() end");
//			
//			return "qna/list";
//			
//		} else if (session.getAttribute("u_auth").equals("A")) {
//			System.out.println("admin go list start");
//			
//			ArrayList<QnaDto> dtos = service.list(param);
//			model.addAttribute("list", dtos);
//			
//			System.out.println("admin go list end");
//			
//			System.out.println("@@@### QnaController list() end");
//			
//			return "qna/list";
//			
//		} else {
//			System.out.println("user go list start");
//			
//			System.out.println("이메일 잘받아왔나?"+param.get("q_email"));
//			
//			System.out.println("세션으로 받은 메일="+session.getAttribute("q_email"));
//			
//			//session.getAttribute("q_email"); 여러번 글 쓰면 세션 엉키나?
//			
//			
//			if (param.get("q_email") == null) {
//				param.put("q_email", (String) session.getAttribute("q_email"));
//				ArrayList<QnaDto> dtos = service.newList(param);
//				model.addAttribute("list", dtos);
//				
//			} else {
//				ArrayList<QnaDto> dtos = service.newList(param);
//				model.addAttribute("list", dtos);
//			}
//			
//			
//			System.out.println("user go list end");
//			
//			System.out.println("@@@### QnaController list() end");
//			
//			return "qna/list";
//		}
//		
//	}
	
	@RequestMapping("/qnaWrite")
	public String write(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### QnaController write() start");
		
		service.write(param);
		
		session.setAttribute("q_email", param.get("q_email"));
		
		System.out.println("@@@### QnaController write() end");
		
		return "redirect:qnaList";
	}
	
	@RequestMapping("/qnaShow")
	public String show(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### QnaController show() start");
		
		QnaDto dto = service.show(param);
		model.addAttribute("show", dto);
		
		System.out.println("@@@### QnaController show() end");
		
		return "qna/show";
	}
	
	@RequestMapping("/qnaDelete")
	public String delete(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### QnaController delete() start");
		
		service.delete(param);
		
		System.out.println("@@@### QnaController delete() end");
		
		return "redirect:qnaList";
	}
	
	@RequestMapping("/qnaModify_view")
	public String modify_view(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### modify_view()");
		
		QnaDto dto = service.show(param);
		model.addAttribute("show", dto);
		
		return "/qna/modify";
	}
	
	@RequestMapping(value = "/qnaModify")
	public String modify(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### QnaController modify() start");
		
		service.modify(param);
		
		System.out.println("@@@### QnaController modify() end");
		
		return "redirect:qnaList";
	}
	
	@RequestMapping(value = "/mailCheck1", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일인증 : " + email);
		
		return mailService1.joinEmail1(email);
	}

}
