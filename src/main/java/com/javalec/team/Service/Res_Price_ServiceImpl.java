package com.javalec.team.service;

import com.javalec.team.dao.Res_Movie_Reserve_Dao;
import com.javalec.team.dto.PriceDTO;
import org.springframework.ui.Model;

import java.util.ArrayList;

public class Res_Price_ServiceImpl implements Res_movie_List_Service {


    @Override
    public void list(Model model) {
        Res_Movie_Reserve_Dao dbDao = new Res_Movie_Reserve_Dao();
        ArrayList<PriceDTO> pList = dbDao.list();
        model.addAttribute("pricelist",pList);
    }
}
