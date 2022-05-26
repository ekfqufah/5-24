package com.javalec.team.service;

import com.javalec.team.dao.Res_Movie_Reserve_Dao;
import com.javalec.team.dto.MovieDTO;
import org.springframework.ui.Model;

import java.util.ArrayList;

public class Res_movie_ServiceImpl implements Res_movie_List_Service {
    @Override
    public void list(Model model) {

    }


//    @Override
//    public void list(Model model) {
//        Res_Movie_Reserve_Dao dao = new Res_Movie_Reserve_Dao();
//        ArrayList<MovieDTO> dtos = dao.listMovie();
//        model.addAttribute("movies",dtos);
//    }
}
