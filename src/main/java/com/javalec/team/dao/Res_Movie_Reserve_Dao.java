package com.javalec.team.dao;

import com.javalec.team.util.Constant;
import com.javalec.team.dto.*;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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

    //�뀒�뒪�듃�슜 SQL
    public ArrayList<MovieDto> listTest() {
        String sql = "select m_code,m_title, m_period from movie";
//        String sql = "select t_name from theather where t_code like '"+Rcode+"%'";
        System.out.println("sql : " + sql);
        return (ArrayList<MovieDto>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(MovieDto.class));
    }
    /*==================== �삁留� ====================*/
    //�쁺�솕 紐⑸줉 異쒕젰
    public ArrayList<MovieDto> getMovieList(){
        String sql = "select m_code,m_title, m_period from movie";
        return (ArrayList<MovieDto>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(MovieDto.class));
    }
    //�쁺�솕 �궇吏� �쑀�슚�꽦 寃��궗
    public int DateValidation(String MCode){
        String sql = "select 醫낆쁺�궇吏� from �긽�쁺�뀒�씠釉� where m_code="+MCode;
//        Date
        return 0;
    }

    //�꽑�깮�븳 吏��뿭�쓽 �쁺�솕愿� 由ъ뒪�듃 異쒕젰
    public List<TheaterDTO> getTheaterList(String Rcode){
        String sql = "select t_code, t_name from theather where t_code like '"+Rcode+"%'";
        return (List<TheaterDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(TheaterDTO.class));
    }

    //�긽�쁺 �뀒�씠釉붿뿉�꽌 �빐�떦 �쁺�솕�쓽 �긽�쁺愿� 踰덊샇 媛��졇�삤湲�
    // MCode : �쁺�솕 肄붾뱶
    public ArrayList<ScreenDTO> getTheaterNum(String Mcode){
        String sql = "select h_num from screen where m_code="+Mcode;
        return (ArrayList<ScreenDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(ScreenDTO.class));
    }

    //�쁺�솕 肄붾뱶瑜� �씠�슜�빐 �긽�쁺愿� 踰덊샇, �쁺�솕 �떆媛� 媛��졇�삤湲�
    public List<HtimeDTO> getTheaterDetail(String Mcode){
        System.out.println("@@@DAO=>Mcode = " + Mcode);
        //媛� �쁺�솕�뿉 諛곗젙�맂 �긽�쁺愿� 踰덊샇 numlist�뿉 ���옣
        ArrayList<ScreenDTO> TheaterNum = getTheaterNum(Mcode);

        ArrayList<Integer> numlist = new ArrayList<Integer>();
        for(int i=0;i< TheaterNum.size();i++){
            //h_num �옒 �굹�샂
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

    /*==================== 醫뚯꽍 �꽑�깮 ====================*/
    public ArrayList<MovieDto> listMInfo(String Mcode) {
        String sql = "select m_title, m_date, m_intro, m_genre, m_director, m_rate, m_grade from movie where m_code="+Mcode;
        System.out.println("sql = " + sql);
        return (ArrayList<MovieDto>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(MovieDto.class));
    }
    public ArrayList<TheaterDTO> listTInfo(int Tcode) {
        String sql = "select t_name, t_addr from theather where t_code="+Tcode;
        return (ArrayList<TheaterDTO>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(TheaterDTO.class));
    }

    //議곗“ �뿬遺� �솗�씤
    //�긽�쁺愿� 踰덊샇 + �떆媛�
    public ArrayList<HtimeDTO> jValidation(int hall, String time){
        String sql="select * from hall_time where h_num ="+hall+" and h_time = '"+time+"'";
        return (ArrayList<HtimeDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(HtimeDTO.class));
    }

    //媛�寃� 媛��졇�삤湲� (議곗“ �뿬遺��뿉 �뵲�씪)
    // 1. price �뀒�씠釉붿뿉�꽌 pcode 媛��졇�삤湲�
    public ArrayList<PriceDTO> getPcode(){
        String sql ="select * from price";
        return (ArrayList<PriceDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(PriceDTO.class));
    }
    // 2. PCode濡� 議곗“ �쁺�솕 �뿬遺� �솗�씤
    public ArrayList<Integer> getPrice(int status){
        ArrayList<PriceDTO> pCodeList = getPcode();
        ArrayList<Integer> priceList = new ArrayList<Integer>(); //媛�寃� ���옣�슜 ArrayList
        for(int i = 0;i< pCodeList.size();i++){
            int code = pCodeList.get(i).getP_code();
            int pcode = (code/100)%100;
            if(status != pcode){
                priceList.add(pCodeList.get(i).getP_price());
            }
        }
        return priceList;
    }

    //醫뚯꽍 �젙蹂� 媛��졇�삤湲�
    public ArrayList<SeatDTO> getSeatInfo(String sHall){
        String sql = "select h_num, se_code from seat where h_num="+sHall;
        return (ArrayList<SeatDTO>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(SeatDTO.class));
    }

}
