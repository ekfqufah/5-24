package com.javalec.team.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.team.dao.FaqDao;
import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.FaqDto;

@Service("FaqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<FaqDto> list(HashMap<String, String> param) {
		System.out.println("@@@### FaqServiceImpl list() start");
		
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		ArrayList<FaqDto> dtos = dao.list(param);
		
		System.out.println("@@@### FaqServiceImpl list() end");
		
		return dtos;
	}

	@Override
	public void write(HashMap<String, String> param) {
		System.out.println("@@@### FaqServiceImpl write() start");
		
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		dao.write(param);
		
		System.out.println("@@@### FaqServiceImpl write() end");
	}

	@Override
	public FaqDto show(HashMap<String, String> param) {
		System.out.println("@@@### FaqServiceImpl show() start");
		
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		FaqDto dto = dao.show(param);
		
		System.out.println("@@@### FaqServiceImpl show() end");
		
		return dto;
	}

	@Override
	public void delete(HashMap<String, String> param) {
		System.out.println("@@@### FaqServiceImpl delete() start");
		
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		dao.delete(param);
		
		System.out.println("@@@### FaqServiceImpl delete() end");
	}

	@Override
	public void modify(HashMap<String, String> param) {
		System.out.println("@@@### FaqServiceImpl modify() start");
		
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		dao.modify(param);
		
		System.out.println("@@@### FaqServiceImpl modify() end");
	}

	@Override
	public int num() {
		int result = 0;
		System.out.println("@@@### FaqServiceImpl num() start");
		
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		result = dao.num();
		
		System.out.println("@@@### FaqServiceImpl num() end");
		
		return result;
	}

	@Override
	public ArrayList<FaqDto> listPaging(Criteria cri) {
		
		System.out.println("@@@### FaqServiceImpl listPaging() start");
		
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		ArrayList<FaqDto> dtos = dao.listPaging(cri);
		
		System.out.println("@@@### FaqServiceImpl listPaging() end");
		
		return dtos;
	}

	@Override
	public int getTotal() {
		System.out.println("@@@### FaqServiceImpl getTotal() start");
		
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		int dto = dao.getTotal();
		
		System.out.println("@@@### FaqServiceImpl getTotal() end");
		
		return dto;
	}

//	@Override																	수정해야함
//	public ArrayList<FaqDto> search(HashMap<String, String> param) {
//		System.out.println("@@@### FaqServiceImpl search() start");
//		
//		FaqDao dao = sqlSession.getMapper(FaqDao.class);
//		ArrayList<FaqDto> dtos = dao.search(param);
//		
//		System.out.println("@@@### FaqServiceImpl search() end");
//		
//		return dtos;
//	}

}
