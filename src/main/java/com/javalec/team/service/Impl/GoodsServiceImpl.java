package com.javalec.team.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.team.dao.CartDao;
import com.javalec.team.dao.GoodsDao;
import com.javalec.team.dto.GoodsDto;
import com.javalec.team.dto.MovieDto;
import com.javalec.team.service.GoodsService;




@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private SqlSession sqlSession;
	//CartDao dao = sqlSession.getMapper(CartDao.class);
	@Override
	public GoodsDto getGoods(HashMap<String, String> param) {
//		System.out.println("GoodsServiceImpl����");
		GoodsDao dao = sqlSession.getMapper(GoodsDao.class);
		GoodsDto  dto = dao.getGoods(param);
//		System.out.println("GoodsServiceImpl��");
		return  dto;
	}
	
	@Override
	public void insertBuy(HashMap<String, String> param) {
		GoodsDao dao = sqlSession.getMapper(GoodsDao.class);
		dao.insertBuy(param);
		
	}

	@Override
	public void insertGoods(HashMap<String, String> param) {
		GoodsDao dao = sqlSession.getMapper(GoodsDao.class);
		dao.insertGoods(param);
	}

	@Override
	public void insertGoodsImg(HashMap<String, String> param) {
		GoodsDao dao = sqlSession.getMapper(GoodsDao.class);
		dao.insertGoodsImg(param);
		
	}

	@Override
	public GoodsDto getGoodsGcode() {
		GoodsDao dao = sqlSession.getMapper(GoodsDao.class);
		GoodsDto dto = dao.getGoodsGcode();
		return dto;
	}

	@Override
	public ArrayList<GoodsDto> list_sort(HashMap<String, String> param) {
		GoodsDao dao = sqlSession.getMapper(GoodsDao.class);
		ArrayList<GoodsDto> dto = dao.list_sort(param);
		return dto;
	}
	

	
}
