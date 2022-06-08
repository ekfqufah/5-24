package com.javalec.team.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.team.dao.QnaDao;
import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.QnaDto;
import com.javalec.team.service.QnaService;

@Service("QnaService")
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<QnaDto> list(HashMap<String, String> param) {
		System.out.println("@@@### QnaServiceImpl list() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		ArrayList<QnaDto> dtos = dao.list(param);
		
		System.out.println("@@@### QnaServiceImpl list() end");
		
		return dtos;
	}
	
	@Override
	public ArrayList<QnaDto> newList(HashMap<String, String> param) {
		System.out.println("@@@### QnaServiceImpl newList() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		ArrayList<QnaDto> dtos = dao.newList(param);
		
		System.out.println("@@@### QnaServiceImpl newList() end");
		
		return dtos;
	}

	@Override
	public void write(HashMap<String, String> param) {
		System.out.println("@@@### QnaServiceImpl write() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		dao.write(param);
		
		System.out.println("@@@### QnaServiceImpl write() end");
		
	}

	@Override
	public QnaDto show(HashMap<String, String> param) {
		System.out.println("@@@### QnaServiceImpl show() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		QnaDto dto = dao.show(param);
		
		System.out.println("@@@### QnaServiceImpl show() end");
		
		return dto;
	}

	@Override
	public void delete(HashMap<String, String> param) {
		System.out.println("@@@### QnaServiceImpl delete() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		dao.delete(param);
		
		System.out.println("@@@### QnaServiceImpl delete() end");
		
	}

	@Override
	public void modify(HashMap<String, String> param) {
		System.out.println("@@@### QnaServiceImpl modify() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		dao.modify(param);
		
		System.out.println("@@@### QnaServiceImpl modify() end");
		
	}

	@Override
	public int num() {
		int result = 0;
		System.out.println("@@@### QnaServiceImpl num() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		result = dao.num();
		
		System.out.println("@@@### QnaServiceImpl num() end");
		
		return result;
	}

//	@Override
//	public ArrayList<QnaDto> newListPaging(HashMap<String, String> param, Criteria cri) {
//		System.out.println("@@@### QnaServiceImpl newListPaging() start");
//		
//		QnaDao dao = sqlSession.getMapper(QnaDao.class);
//		ArrayList<QnaDto> dtos = dao.newListPaging(param, cri);
//		
//		System.out.println("@@@### QnaServiceImpl newListPaging() end");
//		
//		return dtos;
//	}
//	
//	@Override
//	public ArrayList<QnaDto> listPaging(HashMap<String, String> param, Criteria cri) {
//		System.out.println("@@@### QnaServiceImpl listPaging() start");
//		
//		QnaDao dao = sqlSession.getMapper(QnaDao.class);
//		ArrayList<QnaDto> dtos = dao.listPaging(param, cri);
//		
//		System.out.println("@@@### QnaServiceImpl listPaging() end");
//		
//		return dtos;
//	}                                     HashMap ���� ���� �Ѱܹ��� �� �ֳ� ����
	
	@Override
	public ArrayList<QnaDto> newListPaging(Criteria cri) {
		System.out.println("@@@### QnaServiceImpl newListPaging() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		ArrayList<QnaDto> dtos = dao.newListPaging(cri);
		
		System.out.println("@@@### QnaServiceImpl newListPaging() end");
		
		return dtos;
	}

	@Override
	public ArrayList<QnaDto> listPaging(Criteria cri) {
		System.out.println("@@@### QnaServiceImpl listPaging() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		ArrayList<QnaDto> dtos = dao.listPaging(cri);
		
		System.out.println("@@@### QnaServiceImpl listPaging() end");
		
		return dtos;
	}
	
	@Override
	public int getTotal() {
		System.out.println("@@@### QnaServiceImpl getTotal() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		int dto = dao.getTotal();
		
		System.out.println("@@@### QnaServiceImpl getTotal() end");
		
		return dto;
	}

	@Override
	public int newGetTotal(HashMap<String, String> param) {
		System.out.println("@@@### QnaServiceImpl newGetTotal() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		int dto = dao.newGetTotal(param);
		
		System.out.println("@@@### QnaServiceImpl newGetTotal() end");
		
		return dto;
	}

}
