package com.javalec.team.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.team.dto.FaqDto;
import com.javalec.team.dto.GoodsDto;
import com.javalec.team.dto.NoticeDto;
import com.javalec.team.dto.QnaDto;
import com.javalec.team.dto.ReviewDto;
import com.javalec.team.dto.UserDto;
import com.javalec.team.service.MailSendService;
import com.javalec.team.service.UserService;


@Controller
public class UserController {
		
	@Autowired
	private UserService service;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private MailSendService mailService;
	
	@RequestMapping("login")
	public String login() {
		System.out.println("@@@### login()");
		
		return "user/login";
	}
	@RequestMapping("userPage")
	public String userpage(@RequestParam HashMap<String, String> param, Model model) {
		
		ArrayList<ReviewDto> myReviewList = service.getMyReviewList(param);
		ArrayList<FaqDto> myFaqList =  service.getMyFaqList(param);
		ArrayList<NoticeDto> myNotice_tList = service.getMyNotice_tList(param);
		ArrayList<QnaDto> myQnaList = service.getMyQnaList(param);
		ArrayList<GoodsDto> mygoodsList = service.getMygoodsList(param);
		model.addAttribute("myReviewList",myReviewList);
		model.addAttribute("myFaqList",myFaqList);
		model.addAttribute("myNotice_tList",myNotice_tList);
		model.addAttribute("myQnaList",myQnaList);
		model.addAttribute("mygoodsList",mygoodsList);
		return "user/userPage";
	}
	
	@RequestMapping("login_yn")
	public String login_yn(@RequestParam HashMap<String, String> param, Model model, HttpServletResponse response) throws IOException {
		ArrayList<UserDto> dtos = service.loginYn(param);
		model.addAttribute("dtos", dtos);
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		if (dtos.isEmpty()) {
			out.println("<script>alert('議댁옱�븯吏� �븡�뒗 �쉶�썝�엯�땲�떎.'); self.close();</script>");
			out.flush();
			return "user/login";
		} else {
			if (param.get("u_pwd").equals(dtos.get(0).getU_pwd())) {
				session.setAttribute("u_id", param.get("u_id"));
				session.setAttribute("u_auth", dtos.get(0).getU_auth());
				System.out.println(param.get("u_id"));
				System.out.println(dtos.get(0).getU_auth());
				return "redirect:index";
			} else {
				out.println("<script>alert('�븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇媛� �떎由낅땲�떎.'); self.close();</script>");
				out.flush();
				return "user/login";
			}
		}
		
	}
		
	@RequestMapping("register")
	public String register() {
			
		return "/user/register";
	}
	
	@RequestMapping("registerOk")
	public String registerOk(@RequestParam HashMap<String, String> param) {
//		System.out.println("@@@### userController.registerOk() start");
		
		UserDto dto =  service.confirmUserId(param);
		
		if (dto != null) {
			return "user/register";
		} else {
			try {
				service.write(param);
				return "redirect:login";
			} catch (Exception e) {
				return "user/register";
			}
		}
	}
	
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam HashMap<String, String> param) throws IOException {
		
		UserDto result =  service.checkId(param);
		int check = result.getUidcheck();
		
		
		if(check != 0) {
			return "fail";	// 以묐났 �븘�씠�뵒媛� 議댁옱
		} else {
			return "success";	// 以묐났 �븘�씠�뵒 x
		}	
	}
	
	//�씠硫붿씪 �씤利�
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("�씠硫붿씪 �씤利� �슂泥��씠 �뱾�뼱�샂!");
		System.out.println("�씠硫붿씪 �씤利� �씠硫붿씪 : " + email);
		return mailService.joinEmail(email);
	}
	
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam HashMap<String, String> param) {
		
		service.outUser(param);
		
		
		return "redirect:login";
	}
	
	@RequestMapping("findId")
	public String findId() {
		
		return "user/findId";
	}
	
	@RequestMapping("findIdOk")
	public String findIdOk(@RequestParam HashMap<String, String> param, HttpServletResponse response) throws IOException {
		
		UserDto dto = service.tryToFindId(param);
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
			if (dto == null) {
				out.println("<script>alert('議댁옱�븯吏� �븡�뒗 �쉶�썝�엯�땲�떎.'); self.close();</script>");
				out.flush();
				return "user/findId";
			} else {
				out.println("<script>alert('�쉶�썝�떂�쓽 �븘�씠�뵒�뒗 "+dto.getU_id()+" �엯�땲�떎.'); self.close();</script>");
				out.flush();
				return "redirect:login";
			}
		
	}

	
	@RequestMapping("findPwd")
	public String findPwd() {
		
		return "user/findPwd";
	}
	
	
	@RequestMapping("findPwdOk")
	public String findPwd(@RequestParam HashMap<String, String> param, HttpServletResponse response) throws IOException {
		
		UserDto dto = service.tryToFinPwd(param);
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		if (dto == null) {
			out.println("<script>alert('議댁옱�븯吏� �븡�뒗 �쉶�썝�엯�땲�떎.'); self.close();</script>");
			out.flush();
			return "user/findPwd";
		} else {
			out.println("<script>alert('�쉶�썝�떂�쓽 �뙣�뒪�썙�뱶�뒗 "+dto.getU_pwd()+" �엯�땲�떎.'); self.close();</script>");
			out.flush();
			return "redirect:login";
		}
		
	}
	
}
