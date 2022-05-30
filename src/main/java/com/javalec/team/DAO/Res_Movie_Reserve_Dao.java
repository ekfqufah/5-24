package com.javalec.team.dao;

import com.javalec.Util.Constant;
import com.javalec.team.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.lang.reflect.Array;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

@Repository
public class Res_Movie_Reserve_Dao {
    private JdbcTemplate jdbcTemplate;

    public Res_Movie_Reserve_Dao() {
        jdbcTemplate = Constant.template;
    }
    @Autowired
    public void setDatasSource(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    //테스트용 SQL
    public ArrayList<MovieDTO> listTest() {
        String sql = "select m_code,m_title, m_period from movie";
//        String sql = "select t_name from theather where t_code like '"+Rcode+"%'";
        System.out.println("sql : " + sql);
        return (ArrayList<MovieDTO>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(MovieDTO.class));
    }

    //영화 목록 출력
    public ArrayList<MovieDTO> getMovieList(){
        String sql = "select m_code,m_title, m_period from movie";
        return (ArrayList<MovieDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(MovieDTO.class));
    }
    //영화 날짜 유효성 검사
    public int DateValidation(String MCode){
        String sql = "select 종영날짜 from 상영테이블 where m_code="+MCode;
        Date
    }

    //선택한 지역의 영화관 리스트 출력
    public List<TheaterDTO> getTheaterList(String Rcode){
        String sql = "select t_code, t_name from theather where t_code like '"+Rcode+"%'";
        return (List<TheaterDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(TheaterDTO.class));
    }

//    public ArrayList<TheaterDTO> getTheaterList(String Rcode){
//        String sql = "select t_code, t_name from theather where t_code like '"+Rcode+"%'";
//        return (ArrayList<TheaterDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(TheaterDTO.class));
//    }

    //상영 테이블에서 해당 영화의 상영관 번호 가져오기
    // MCode : 영화 코드
    public ArrayList<ScreenDTO> getTheaterNum(String Mcode){
        String sql = "select 새로운 컬럼 from screen where m_code="+Mcode;
        return (ArrayList<ScreenDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(ScreenDTO.class));
    }

    //영화 코드를 이용해 상영관 번호, 영화 시간 가져오기
    public ArrayList<HtimeDTO> getTheaterDetail(String Mcode){
        //각 영화에 배정된 상영관 번호 numlist에 저장
        ArrayList<Integer> numlist = new ArrayList<Integer>();
        ArrayList<ScreenDTO> TheaterNum = getTheaterNum(Mcode);
        Iterator iter = TheaterNum.iterator();
        while(iter.hasNext()){
            numlist.add((Integer)iter.next());
        }

        StringBuilder sql = new StringBuilder("select * from h_time where h_num="+numlist.get(0));
        for(int i=1;i<numlist.size();i++) {
            sql.append(
                    " union " +
                            "select * from h_time where h_num="+numlist.get(i));
        }
        System.out.println(sql);
        return (ArrayList<HtimeDTO>) jdbcTemplate.query(String.valueOf(sql), new BeanPropertyRowMapper(HtimeDTO.class));
    }







}
