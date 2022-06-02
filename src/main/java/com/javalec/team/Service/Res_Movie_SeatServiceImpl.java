package com.javalec.team.service;

import com.javalec.team.dao.Res_Movie_Reserve_Dao;
import com.javalec.team.dto.HtimeDTO;
import com.javalec.team.dto.MovieDTO;
import com.javalec.team.dto.TheaterDTO;
import org.springframework.ui.Model;

import java.util.ArrayList;

public class Res_Movie_SeatServiceImpl implements Res_Movie_SeatService{

    Res_Movie_Reserve_Dao DAO;

    public ArrayList<HtimeDTO> jvalidate(int hall, String time){
        DAO = new Res_Movie_Reserve_Dao();
        ArrayList<HtimeDTO> jlist = DAO.jValidation(hall, time);
        return jlist;
    }

    public ArrayList<MovieDTO> findMovieInfoByMcode(String Mcode, Model model) {
        DAO = new Res_Movie_Reserve_Dao();
        ArrayList<MovieDTO> mInfoList = DAO.listMInfo(Mcode);
//        System.out.println("mInfoList.get(0).getM_title() = " + mInfoList.get(0).getM_title() + " Type : " + mInfoList.get(0).getM_title().getClass());
//        System.out.println("mInfoList.get(0).getM_title() = " + mInfoList.get(0).getM_intro() + " Type : " + mInfoList.get(0).getM_intro().getClass());
//        System.out.println("mInfoList.get(0).getM_title() = " + mInfoList.get(0).getM_genre() + " Type : " + mInfoList.get(0).getM_genre().getClass());
//        System.out.println("mInfoList.get(0).getM_title() = " + mInfoList.get(0).getM_director() + " Type : " + mInfoList.get(0).getM_director().getClass());
//        System.out.println("mInfoList.get(0).getM_title() = " + mInfoList.get(0).getM_rate() + " Type : ");
//        System.out.println("mInfoList.get(0).getM_title() = " + mInfoList.get(0).getM_rate() + " Type : ");
//        System.out.println("mInfoList.get(0).getM_title() = " + mInfoList.get(0).getM_grade() + " Type : ");
//        System.out.println("mInfoList.get(0).getM_title() = " + mInfoList.get(0).getM_grade() + " Type : " + mInfoList.get(0).getM_grade().getClass());

        model.addAttribute("sMlist",mInfoList);
        return mInfoList;
    }

    public ArrayList<TheaterDTO> findTheaterInfoByTcode(int Tcode, Model model) {
        DAO = new Res_Movie_Reserve_Dao();
        ArrayList<TheaterDTO> tInfoList = DAO.listTInfo(Tcode);
        model.addAttribute("sTlist",tInfoList);
        return tInfoList;
    }
}
