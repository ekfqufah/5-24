package com.javalec.team.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.javalec.team.dto.MovieDto;
import com.javalec.team.service.Reg_movie_Service;

@Controller
public class Reg_movie_Controller {
	@Autowired
	private Reg_movie_Service service;
	
	//0524 관리자 영화 넣기 - 근지
	@RequestMapping("/reg_movie")
//	@RequestMapping("/reg_movie/reg_movie")
	public String reg_movie(Model model) {
		System.out.println("@@@### reg_movie()");
		
		return "reg_movie/reg_movie";
	}
	
	//0524 관리자 영화 db 넣기 - 근지
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
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

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
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	    MovieDto movieDto = service.getm_code();
		for (MultipartFile mf : m_picsfiles) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
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
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		/*
		 * System.out.println("@@@### reg_movie_insert() start");
		 * System.out.println("@@@### 영화제목 뷰에서 컨트롤러로 한글깨지니?===>"+param.get("m_title"));
		 * System.out.println(param.get("m_pics"));
		 */
		
		
		return "redirect:movie_list";
	}
	

	//에이젝스 사용 후 필요없게 됨 - 다시 필요함
	//0525 관리자 영화 리스트 보기 - 근지
	@RequestMapping("/movie_list")
	public String movie_list(Model model) {
		System.out.println("@@@### reg_movie()");
		
		ArrayList<MovieDto> list = service.list();
		model.addAttribute("list", list);
		
		return "reg_movie/movie_list";
	}
	
	
	//0525 관리자 영화 수정 - 근지
	@RequestMapping("/edit")
	public String edit(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("edit() 도착?");
		
		MovieDto dto = service.show(param);
		model.addAttribute("dto", dto);
		
		return "reg_movie/edit_movie";	
	}
	
	//0525 관리자 영화 db 수정 - 근지	
	@RequestMapping("/edit_movie")
	public String edit_movie(MultipartHttpServletRequest mtfRequest ,@RequestParam HashMap<String, String> param, Model model, HttpServletRequest request) {
		
			List<MultipartFile> m_positionfiles = mtfRequest.getFiles("m_position");
			List<MultipartFile> m_picsfiles = mtfRequest.getFiles("m_pics");
			 //String path = "C:\\test\\"; 

			
			 ServletContext servletContext = request.getSession().getServletContext();
			 String path = servletContext.getRealPath("/");
			 path += "resources\\";
			 System.out.println("path@@@@"+path);
			for (MultipartFile mf : m_positionfiles) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				long fileSize = mf.getSize(); // 파일 사이즈

				System.out.println("originFileName : " + originFileName);
				System.out.println("fileSize : " + fileSize);
				
				String filename = System.currentTimeMillis() + originFileName;
				String safeFile = path +filename;
				
				param.put("m_originimg", originFileName);
				param.put("m_position", filename);
				param.put("m_pics", "");
				
				try {
					mf.transferTo(new File(safeFile));
					service.edit_movie(param);
					
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
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				long fileSize = mf.getSize(); // 파일 사이즈
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
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		
//		service.edit_movie(param);
		return "redirect:movie_list";	
	}
	
	//0525 관리자 영화 삭제 - 근지
	@RequestMapping(value = "/del_movie")
	public String del_movie(@RequestParam HashMap<String, String> param, Model model) {
		service.del_movie(param);
		
		return "redirect:movie_list";	
	}
	
//	//0526 에이젝스 사용시 첫화면. 기본값은 order by 최신순 - 근지 - 이게 필요 없어짐
////	@RequestMapping("/movie_list")
//	@RequestMapping("/reg_movie/movie_list")
//	public String movie_list(HttpServletRequest request, Model model) {
//		System.out.println("request 값 제대로 나옴??? movie_list ===>"+request.getParameter("kind"));
//		
//		return "reg_movie/movie_list";
//	}	
	
	
	//0526 정렬 에이젝스 체크 - 근지
	/* @RequestMapping("ajax") */
	@RequestMapping("/ajax")
	@ResponseBody
	public ArrayList<MovieDto> ajax(HttpServletRequest request, Model model) {
	
		System.out.println("request 값 제대로 나옴??? ajax ===>"+request.getParameter("kind"));
		
		String sort = "";
		
		
		if (request.getParameter("kind") == null) {	// 처음화면 시작시 null값이라서. 첫화면 컨트롤러 새로 만들어서 그럴 일 없겠지만
			sort = "m_code desc";
			
		} else {
			
			if (request.getParameter("kind").trim().equals("최신순")) {
				
				sort = "m_code desc";
			} else if (request.getParameter("kind").trim().equals("오래된순")) {
				
				sort = "m_code";
			} else if (request.getParameter("kind").trim().equals("인기순")) {	// 일단 평점순으로 임시설정
				
				sort = "m_rate desc";
			}
		}
	
		// 정렬순 dao에 보내기 위해 담음
		model.addAttribute("sort", sort);
		ArrayList<MovieDto> list_sort = service.list_sort(model);
		
		for (int i = 0; i < list_sort.size(); i++) {
			String str = String.valueOf(list_sort.get(i).getM_date());
			str = str.substring(0, 10);
			list_sort.get(i).setM_date2(str);
		}
		
		/*
		 * System.out.println(list_sort.get(0).getM_date());
		 * System.out.println(list_sort.get(0).getM_period());
		 */
		
		
		//model.addAttribute("list_sort", list_sort);
		
		return list_sort;
	}
	
	//0531 영화 검색 - 근지
	@RequestMapping("/serch_mov")
	@ResponseBody
	public ArrayList<MovieDto> serch_mov(HttpServletRequest request, Model model) {
		System.out.println("검색 내용=====>"+request.getParameter("kind").trim());
		
		model.addAttribute("serch_mov",request.getParameter("kind").trim());	
		ArrayList<MovieDto> list_sort = service.serch_mov(model);
		
		for (int i = 0; i < list_sort.size(); i++) {
			String str = String.valueOf(list_sort.get(i).getM_date());
			str = str.substring(0, 10);
			list_sort.get(i).setM_date2(str);
		}
		
		return list_sort;
	}

	
	public void getMove(@RequestParam HashMap<String, String> param,Model model) {
		//System.out.println("들어오냐?@@@@@@@@@@@@@@");
		MovieDto movieDto = service.getMove(param);		
		model.addAttribute("movie",movieDto);
		//return "goods/goodsDisplay";
	}
	

	@RequestMapping("movieDisplay")
	public String goodsDisplay(@RequestParam HashMap<String, String> param,Model model) {
		//System.out.println("들어오냐?@@@@@@@@@@@@@@");
		getMove(param,model);
		return "reg_movie/movieDisplay";
	}
}
