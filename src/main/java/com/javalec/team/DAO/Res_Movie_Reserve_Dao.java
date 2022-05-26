package com.javalec.team.dao;

import com.javalec.Util.Constant;
import com.javalec.team.dto.PriceDTO;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.ArrayList;

public class Res_Movie_Reserve_Dao {

    JdbcTemplate template = null;

    public Res_Movie_Reserve_Dao() {
        template = Constant.template;
    }


    public ArrayList<PriceDTO> list() {
        ArrayList<PriceDTO> priceList = null;
        String sql = "select p_code, p_price from price";
        return (ArrayList<PriceDTO>) template.query(sql, new BeanPropertyRowMapper(PriceDTO.class));
    }


}
