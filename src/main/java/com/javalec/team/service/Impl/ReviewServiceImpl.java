package com.javalec.team.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.team.dao.ReviewDao;
import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.ReviewDto;
import com.javalec.team.service.ReviewService;
@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<ReviewDto> list(Criteria cri) {
		System.out.println("@@@### ReviewServiceImpl list() start");

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		ArrayList<ReviewDto> dtos = dao.list(cri);
		
		System.out.println("@@@### ReviewServiceImpl list() end");
		
		return dtos;
	}

	@Override
	public void write(HashMap<String, String> param) {
		System.out.println("@@@### ReviewServiceImpl write() start");

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.write(param);
		
		System.out.println("@@@### ReviewServiceImpl write() end");
	}

	@Override
	public ReviewDto show(HashMap<String, String> param) {
		System.out.println("@@@### ReviewServiceImpl show() start");
		
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		ReviewDto dto = dao.show(param);
		
		System.out.println("@@@### ReviewServiceImpl show() end");

		return dto;
	}

	@Override
	public void delete(HashMap<String, String> param) {
		System.out.println("@@@### ReviewServiceImpl delete() start");

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.delete(param);
		
		System.out.println("@@@### ReviewServiceImpl delete() end");
	}

	@Override
	public void modify(HashMap<String, String> param) {
		System.out.println("@@@### ReviewServiceImpl modify() start");
		
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.modify(param);
		
		System.out.println("@@@### ReviewServiceImpl modify() end");
		
	}

	@Override
	public int getTotal() {
		System.out.println("@@@### ReviewServiceImpl getTotal() start");
		
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		int dto = dao.getTotal();
		
		System.out.println("@@@### ReviewServiceImpl getTotal() end");
		
		return dto;
	}

	@Override
	public void upGood(HashMap<String, String> param) {
		System.out.println("@@@### ReviewServiceImpl upGood() start");
		
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.upGood(param);
		
		System.out.println("@@@### ReviewServiceImpl upGood() end");
		
	}

	@Override
	public void insertRate(HashMap<String, String> param) {
		System.out.println("@@@### ReviewServiceImpl insertRate() start");

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.insertRate(param);
		
		System.out.println("@@@### ReviewServiceImpl insertRate() end");
		
	}

	@Override
	public ReviewDto getMcode(HashMap<String, String> param) {
		System.out.println("@@@### ReviewServiceImpl getMcode() start");
		
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		ReviewDto dto = dao.getMcode(param);
		
		System.out.println("@@@### ReviewServiceImpl getMcode() end");
		return dto;
	}

	@Override
	public ReviewDto getRateAvg(HashMap<String, String> param) {
		System.out.println("@@@### ReviewServiceImpl getRateAvg() start");
		
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		ReviewDto dto = dao.getRateAvg(param);
		
		System.out.println("@@@### ReviewServiceImpl getRateAvg() end");
		return dto;
	}

}
