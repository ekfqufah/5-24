//package com.javalec.team.service;
//
//import com.javalec.team.AppConfig;
//import com.javalec.team.dao.Res_Movie_Reserve_Dao;
//import com.javalec.team.dto.HtimeDTO;
//import com.javalec.team.dto.MovieDTO;
//import com.javalec.team.dto.TheaterDTO;
//import org.springframework.stereotype.Service;
//import org.springframework.ui.Model;
//
//import java.util.ArrayList;
//
//@Service
//public class Res_Movie_SeatServiceImpl implements Res_Movie_SeatService{
//
//    Res_Movie_Reserve_Dao dao;
//    AppConfig appConfig = new AppConfig();
//
//    public ArrayList<HtimeDTO> jvalidate(int hall, String time){
//        dao = appConfig.dao();
//        ArrayList<HtimeDTO> jlist = dao.jValidation(hall, time);
//        return jlist;
//    }
//
//    public ArrayList<MovieDTO> findMovieInfoByMcode(String Mcode, Model model) {
//        dao = appConfig.dao();
//        ArrayList<MovieDTO> mInfoList = dao.listMInfo(Mcode);
//        model.addAttribute("sMlist",mInfoList);
//        return mInfoList;
//    }
//
//    public ArrayList<TheaterDTO> findTheaterInfoByTcode(int Tcode, Model model) {
//        dao = appConfig.dao();
//        ArrayList<TheaterDTO> tInfoList = dao.listTInfo(Tcode);
//        model.addAttribute("sTlist",tInfoList);
//        return tInfoList;
//    }
//}
