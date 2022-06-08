package com.javalec.team.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.javalec.team.dto.GoodsDto;
import com.javalec.team.dto.MovieDto;
import com.javalec.team.service.Reg_movie_Service;

@Controller
public class Reg_movie_Controller {
	@Autowired
	private Reg_movie_Service service;
	
	//0524 ������ ��ȭ �ֱ� - ����
	@RequestMapping("/reg_movie")
	public String reg_movie(Model model) {
		System.out.println("@@@### reg_movie()");
		
		return "reg_movie/reg_movie";
	}
	
	public void getMove(@RequestParam HashMap<String, String> param,Model model) {
		System.out.println("������?@@@@@@@@@@@@@@");
		MovieDto movieDto = service.getMove(param);		
		model.addAttribute("movie",movieDto);
		//System.out.println(param.get("m_code"));
		ArrayList<MovieDto> dtoList =service.getStillCut(param);
//		System.out.println(dtoList.get(0).getM_code());
//		System.out.println(dtoList.get(0).getM_imgcode());
		model.addAttribute("dtoList",dtoList);
	}
	

	@RequestMapping("/movieDisplay")
	public String goodsDisplay(@RequestParam HashMap<String, String> param,Model model) {
		//System.out.println("������?@@@@@@@@@@@@@@");
		getMove(param,model);
		return "reg_movie/movieDisplay";
	}

//	�������� ��� �� �ʿ���� ��
//	//0525 ������ ��ȭ ����Ʈ ���� - ����
//	@RequestMapping("/movie_list")
//	public String movie_list(Model model) {
//		System.out.println("@@@### reg_movie()");
//		
//		ArrayList<MovieDto> list = service.list();
//		model.addAttribute("list", list);
//		
//		return "reg_movie/movie_list";
//	}
	
	
	//0525 ������ ��ȭ ���� - ����
	@RequestMapping("/edit")
	public String edit(@RequestParam HashMap<String, String> param, Model model) {
		service.show(param);
		
		MovieDto dto = service.show(param);
		model.addAttribute("dto", dto);
		
		return "reg_movie/edit_movie";	
	}
	
	//0525 ������ ��ȭ db ���� - ����	
	@RequestMapping("/edit_movie")
	public String edit_movie(@RequestParam HashMap<String, String> param, Model model) {
		
		service.edit_movie(param);
		
		return "redirect:movie_list";	
	}
	
	//0525 ������ ��ȭ ���� - ����
	@RequestMapping(value = "/del_movie")
	public String del_movie(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("�餷��???????");
		System.out.println( param.get("m_code"));
		service.del_movie(param);
		return "redirect:movie_list";	
	}
	
	//0526 �������� ���� ùȭ��. �⺻���� order by �ֽż� - ����
	@RequestMapping("/movie_list")
	public String movie_list() {
		//System.out.println("request@@@@@@ @ ===>"+request.getParameter("kind"));
		//ajax(request,model);
		
		return "reg_movie/movie_list";
	}	
	
//	@RequestMapping("board/content")
//	public String con(Model model) { //�������������������
//		System.out.println("������?????????");
//		/* model.addAttribute("img", "/resources/img/testimg.png"); */
//		return "reg_movie/movie_list";
//	}
	
	//0526 ���� �������� üũ - ����
	/* @RequestMapping("ajax") */
	@RequestMapping("/ajax")
	@ResponseBody
	public ArrayList<MovieDto> ajax(HttpServletRequest request, Model model) {
	
		System.out.println("request �� ����� ����??? ajax ===>"+request.getParameter("kind"));
		
		String sort = "";
		
		
		if (request.getParameter("kind") == null) {	// ó��ȭ�� ���۽� null���̶�. ùȭ�� ��Ʈ�ѷ� ���� ���� �׷� �� ��������!
			sort = "m_date desc";
			
		} else {
			
			if (request.getParameter("kind").trim().equals("�ֽż�")) {
				
				sort = "m_code desc";
			} else if (request.getParameter("kind").trim().equals("�����ȼ�")) {
				
				sort = "m_code";
			} else if (request.getParameter("kind").trim().equals("�α��")) {	// �ϴ� ���������� �ӽü���
				
				sort = "m_rate desc";
			}
		}
	
		// ���ļ� dao�� ������ ���� ����
		model.addAttribute("sort", sort);
		ArrayList<MovieDto> list_sort = service.list_sort(model);
		
		for (int i = 0; i < list_sort.size(); i++) {
			String str = String.valueOf(list_sort.get(i).getM_date());
			str = str.substring(0, 10);
			list_sort.get(i).setM_date2(str);
		}
		
		
		 System.out.println(list_sort.get(0).getM_period());
		
		
		
		//model.addAttribute("list_sort", list_sort);
		return list_sort;
	}
	
	
//	for (int j = 0; j < list_sort.size(); j++) {
//		String m_code = list_sort.get(j).getM_code();
//		param.put("m_code", m_code);
//		ArrayList<MovieDto> listPicsImg = service.listPicsImg(param);
//		model.addAttribute(m_code, listPicsImg);
//		System.out.println("11");
//	}
//	System.out.println("2");
	
	
	//0524 ������ ��ȭ db �ֱ� - ����
		@RequestMapping("/reg_movie_insert")
		public String reg_movie_insert(MultipartHttpServletRequest mtfRequest ,@RequestParam HashMap<String, String> param, Model model , HttpServletRequest request) {
			List<MultipartFile> m_positionfiles = mtfRequest.getFiles("m_position");
			List<MultipartFile> m_picsfiles = mtfRequest.getFiles("m_pics");
			 //String path = "C:\\test\\"; 

			
			 ServletContext servletContext = request.getSession().getServletContext();
			 String path = servletContext.getRealPath("/");
			 path += "resources\\";
			 System.out.println("path@@@@"+path);
			for (MultipartFile mf : m_positionfiles) {
				String originFileName = mf.getOriginalFilename(); // ���� ���� ��
				long fileSize = mf.getSize(); // ���� ������

				System.out.println("originFileName : " + originFileName);
				System.out.println("fileSize : " + fileSize);
				
				String filename = System.currentTimeMillis() + originFileName;
				String safeFile = path +filename;
				
				param.put("m_originimg", originFileName);
				param.put("m_position", filename);
				param.put("m_pics", "");
				
				try {
					mf.transferTo(new File(safeFile));
					service.reg_movie(param);
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		    MovieDto movieDto = service.getm_code();
			for (MultipartFile mf : m_picsfiles) {
				String originFileName = mf.getOriginalFilename(); // ���� ���� ��
				long fileSize = mf.getSize(); // ���� ������
				param.put("m_code", movieDto.getM_code());
				System.out.println("originFileName : " + originFileName);
				System.out.println("fileSize : " + fileSize);
				
				 
				
				String filename = System.currentTimeMillis() + originFileName;
				String safeFile = path +filename;
				
				param.put("m_originimg", originFileName);
				param.put("m_pics", filename);
				
				try {
					mf.transferTo(new File(safeFile));
					service.reg_movieimg(param);
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			/*
			 * System.out.println("@@@### reg_movie_insert() start");
			 * System.out.println("@@@### ��ȭ���� �信�� ��Ʈ�ѷ��� �ѱ۱�����?===>"+param.get("m_title"));
			 * System.out.println(param.get("m_pics"));
			 */
			
			
			return "redirect:main_movie_list";
		}
		
		
		
//	@RequestMapping(value = "movieimg")
//	public String requestupload2(MultipartHttpServletRequest mtfRequest ,@RequestParam HashMap<String, String> param) {
//		List<MultipartFile> fileList = mtfRequest.getFiles("file");
//
//		System.out.println("src value : " + param.get("g_name"));
//		System.out.println("src value : " + param.get("g_price"));
//
//		String path = "C:\\test\\";
//		
//
//		goodsService.insertGoods(param);
//		GoodsDto dto = goodsService.getGoodsGcode();
//		int g_code = dto.getG_code();
//		param.put("g_code", Integer.toString(g_code));
//		int count = 0;
//		
//		for (MultipartFile mf : fileList) {
//			 count ++;
//			String originFileName = mf.getOriginalFilename(); // ���� ���� ��
//			long fileSize = mf.getSize(); // ���� ������
//
//			System.out.println("originFileName : " + originFileName);
//			System.out.println("fileSize : " + fileSize);
//			
//			String filename = System.currentTimeMillis() + originFileName;
//			String safeFile = path +filename;
//			
//			param.put("img_origin", originFileName);
//			
//			if(count == 1) {
//				param.put("img_1", filename);
//				param.put("img_2", "");
//			}else {
//				param.put("img_1", "");
//				param.put("img_2", filename);
//			}
//			
//			
//			try {
//				mf.transferTo(new File(safeFile));
//				goodsService.insertGoodsImg(param);
//				
//			} catch (IllegalStateException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//
//		return "redirect:/";
//	}
}
