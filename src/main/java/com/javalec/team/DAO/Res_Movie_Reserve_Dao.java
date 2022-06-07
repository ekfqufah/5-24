package com.javalec.team.dao;

import com.javalec.Util.Constant;
import com.javalec.team.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class Res_Movie_Reserve_Dao {
    private JdbcTemplate jdbcTemplate;

    public Res_Movie_Reserve_Dao() {
        jdbcTemplate = Constant.template;
    }

    //    public Res_Movie_Reserve_Dao() {
//        jdbcTemplate = Constant.template;
//    }
//    @Autowired
//    public void setDatasSource(DataSource dataSource){
//        this.jdbcTemplate = new JdbcTemplate(dataSource);
//    }

    //테스트용 SQL
    public ArrayList<MovieDTO> listTest() {
        String sql = "select m_code,m_title, m_period from movie";
//        String sql = "select t_name from theather where t_code like '"+Rcode+"%'";
        System.out.println("sql : " + sql);
        return (ArrayList<MovieDTO>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(MovieDTO.class));
    }
    /*==================== 예매 ====================*/
    //영화 목록 출력
    public ArrayList<MovieDTO> getMovieList(){
        String sql = "select m_code,m_title, m_period from movie";
        return (ArrayList<MovieDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(MovieDTO.class));
    }
    //영화 날짜 유효성 검사
    public int DateValidation(String MCode){
        String sql = "select 종영날짜 from 상영테이블 where m_code="+MCode;
//        Date
        return 0;
    }

    //선택한 지역의 영화관 리스트 출력
    public List<TheaterDTO> getTheaterList(String Rcode){
        String sql = "select t_code, t_name from theather where t_code like '"+Rcode+"%'";
        return (List<TheaterDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(TheaterDTO.class));
    }

    //상영 테이블에서 해당 영화의 상영관 번호 가져오기
    // MCode : 영화 코드
    public ArrayList<ScreenDTO> getTheaterNum(String Mcode){
        String sql = "select h_num from screen where m_code="+Mcode;
        return (ArrayList<ScreenDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(ScreenDTO.class));
    }

    //영화 코드를 이용해 상영관 번호, 영화 시간 가져오기
    public List<HtimeDTO> getTheaterDetail(String Mcode){
        System.out.println("@@@DAO=>Mcode = " + Mcode);
        //각 영화에 배정된 상영관 번호 numlist에 저장
        ArrayList<ScreenDTO> TheaterNum = getTheaterNum(Mcode);

        ArrayList<Integer> numlist = new ArrayList<Integer>();
        for(int i=0;i< TheaterNum.size();i++){
            //h_num 잘 나옴
            numlist.add(TheaterNum.get(i).getH_num());
        }

        StringBuilder sql = new StringBuilder("select h_num,h_time,h_st from hall_time where h_num="+numlist.get(0));
        for(int i=1;i<numlist.size();i++) {
            sql.append(
                    " union " +
                            "select h_num,h_time,h_st from hall_time where h_num="+numlist.get(i));
        }
        String Determinedsql = sql.toString();
        System.out.println(Determinedsql);
        return (List<HtimeDTO>) jdbcTemplate.query(Determinedsql, new BeanPropertyRowMapper(HtimeDTO.class));
    }

    /*==================== 좌석 선택 ====================*/
    public ArrayList<MovieDTO> listMInfo(String Mcode) {
        String sql = "select m_title, m_date, m_intro, m_genre, m_director, m_rate, m_grade from movie where m_code="+Mcode;
        System.out.println("sql = " + sql);
        return (ArrayList<MovieDTO>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(MovieDTO.class));
    }
    public ArrayList<TheaterDTO> listTInfo(int Tcode) {
        String sql = "select t_name, t_addr from theather where t_code="+Tcode;
        return (ArrayList<TheaterDTO>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(TheaterDTO.class));
    }

    //조조 여부 확인
    //상영관 번호 + 시간
    public ArrayList<HtimeDTO> jValidation(int hall, String time){
        String sql="select * from hall_time where h_num ="+hall+" and h_time = '"+time+"'";
        return (ArrayList<HtimeDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(HtimeDTO.class));
    }

    //가격 가져오기 (조조 여부에 따라)
    // 1. price 테이블에서 pcode 가져오기
    public ArrayList<PriceDTO> getPcode(){
        String sql ="select * from price";
        return (ArrayList<PriceDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(PriceDTO.class));
    }
    // 2. PCode로 조조 영화 여부 확인
    public ArrayList<Integer> getPrice(int status){
        ArrayList<PriceDTO> pCodeList = getPcode();
        ArrayList<Integer> priceList = new ArrayList<Integer>(); //가격 저장용 ArrayList
        for(int i = 0;i< pCodeList.size();i++){
            int code = pCodeList.get(i).getP_code();
            int pcode = (code/100)%100;
            if(status != pcode){
                priceList.add(pCodeList.get(i).getP_price());
            }
        }
        return priceList;
    }

    //좌석 정보 가져오기
    public ArrayList<SeatDTO> getSeatInfo(String sHall){
        String sql = "select h_num, se_code from seat where h_num="+sHall;
        return (ArrayList<SeatDTO>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(SeatDTO.class));
    }

}
