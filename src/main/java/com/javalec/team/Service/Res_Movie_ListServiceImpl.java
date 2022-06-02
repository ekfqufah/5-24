package com.javalec.team.service;

import com.javalec.team.dao.Res_Movie_Reserve_Dao;
import com.javalec.team.dto.HtimeDTO;
import com.javalec.team.dto.MovieDTO;
import com.javalec.team.dto.TheaterDTO;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

@Service
public class Res_Movie_ListServiceImpl implements Res_movie_ListService {

    /*===== 예매 =====*/
    @Override
    public void listMovie(Model model) {
        Res_Movie_Reserve_Dao dao = new Res_Movie_Reserve_Dao();
        ArrayList<MovieDTO> mList = dao.getMovieList();;
        model.addAttribute("mlist", mList);
    }

    @Override
    public List<TheaterDTO> findTheaterByRegionCode(String Rcode) {
        Res_Movie_Reserve_Dao dao = new Res_Movie_Reserve_Dao();
        List<TheaterDTO> tlist = dao.getTheaterList(Rcode);
        return tlist;
    }

    @Override
    public List<HtimeDTO> findTheaterByMovie(String Mcode) {
        Res_Movie_Reserve_Dao dao = new Res_Movie_Reserve_Dao();
        List<HtimeDTO> htlist = dao.getTheaterDetail(Mcode);
        return htlist;
    }


//
//    @Override //지역별 극장 리스트
//    public void findRegionTheater(String rCode, Model model) {
//        Res_Movie_Reserve_Dao dao = new Res_Movie_Reserve_Dao();
//        ArrayList<TheaterDTO> tList = dao.getTheaterList(rCode);
//        model.addAttribute("theaterList",tList);
//    }


    @Override
    public void listTest(Model model) {
        Res_Movie_Reserve_Dao dao = new Res_Movie_Reserve_Dao();
        ArrayList<MovieDTO> pList = dao.listTest();
        model.addAttribute("plist",pList);
    }
}
