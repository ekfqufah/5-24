package com.javalec.team.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.team.dao.NoticeDao;
import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.NoticeDto;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<NoticeDto> list(HashMap<String, String> param) {
		System.out.println("@@@### NoticeServiceImpl list() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		ArrayList<NoticeDto> dtos = dao.list(param);
		
		System.out.println("@@@### NoticeServiceImpl list() end");
		
		return dtos;
	}

	@Override
	public void write(HashMap<String, String> param) {
		System.out.println("@@@### NoticeServiceImpl write() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		dao.write(param);
		
		System.out.println("@@@### NoticeServiceImpl write() end");
		
	}

	@Override
	public NoticeDto show(HashMap<String, String> param) {
		System.out.println("@@@### NoticeServiceImpl show() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		NoticeDto dto = dao.show(param);
		
		System.out.println("@@@### NoticeServiceImpl show() end");
		
		return dto;
	}

	@Override
	public void delete(HashMap<String, String> param) {
		System.out.println("@@@### NoticeServiceImpl delete() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		dao.delete(param);
		
		System.out.println("@@@### NoticeServiceImpl delete() end");
		
	}

	@Override
	public void modify(HashMap<String, String> param) {
		System.out.println("@@@### NoticeServiceImpl modify() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		dao.modify(param);
		
		System.out.println("@@@### NoticeServiceImpl modify() end");
		
	}

	@Override
	public void upView(HashMap<String, String> param) {
		System.out.println("@@@### NoticeServiceImpl upView() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		dao.upView(param);
		
		System.out.println("@@@### NoticeServiceImpl upView() end");
	}

	@Override
	public int num() {
		int result = 0;
		System.out.println("@@@### NoticeServiceImpl num() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		result = dao.num();
		
		System.out.println("@@@### NoticeServiceImpl num() end");
		
		return result;
	}

	@Override
	public ArrayList<NoticeDto> listPaging(Criteria cri) {
		System.out.println("@@@### NoticeServiceImpl listPaging() start");

		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		ArrayList<NoticeDto> dtos = dao.listPaging(cri);
		
		System.out.println("@@@### NoticeServiceImpl listPaging() end");
		
		return dtos;
	}

	@Override
	public int getTotal() {
		System.out.println("@@@### NoticeServiceImpl getTotal() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		int dto = dao.getTotal();
		
		System.out.println("@@@### NoticeServiceImpl getTotal() end");
		
		return dto;
	}

}
