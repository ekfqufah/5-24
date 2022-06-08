package com.javalec.team.service.Impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.team.dao.GoodDao;
import com.javalec.team.dto.GoodDto;
import com.javalec.team.service.GoodService;

@Service("GoodService")
public class GoodServiceImpl implements GoodService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(HashMap<String, String> param) {
		System.out.println("@@@### GoodServiceImpl insert() start");

		GoodDao dao = sqlSession.getMapper(GoodDao.class);
		dao.insert(param);
		
		System.out.println("@@@### GoodServiceImpl insert() end");
		
	}

	@Override
	public GoodDto get(HashMap<String, String> param) {
		System.out.println("@@@### GoodServiceImpl get() start");

		GoodDao dao = sqlSession.getMapper(GoodDao.class);
		GoodDto dto = dao.get(param);
		
		System.out.println("@@@### GoodServiceImpl get() end");
		
		return dto;
	}

}
