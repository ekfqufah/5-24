package com.javalec.team.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.javalec.team.dto.FaqDto;
import com.javalec.team.dto.GoodsDto;
import com.javalec.team.dto.MovieDto;
import com.javalec.team.dto.NoticeDto;
import com.javalec.team.dto.QnaDto;
import com.javalec.team.dto.ReviewDto;
import com.javalec.team.dto.UserDto;


public interface UserService {
	public ArrayList<UserDto> loginYn(HashMap<String, String> param);
	
	public void write(HashMap<String, String> param);
	
	public void outUser(HashMap<String, String> param);
	
	public UserDto checkId(HashMap<String, String> param);
	
	public UserDto confirmUserId(HashMap<String, String> param);
	
	public UserDto tryToFindId(HashMap<String, String> param);
	
	public UserDto tryToFinPwd(HashMap<String, String> param);
	
	public ArrayList<MovieDto> getMybookList(HashMap<String, String> param);
	
	public ArrayList<ReviewDto> getMyReviewList(HashMap<String, String> param);
	public ArrayList<FaqDto> getMyFaqList(HashMap<String, String> param);
	public ArrayList<NoticeDto> getMyNotice_tList(HashMap<String, String> param);
	public ArrayList<QnaDto> getMyQnaList(HashMap<String, String> param);
	public ArrayList<GoodsDto> getMygoodsList(HashMap<String, String> param);
	
}

