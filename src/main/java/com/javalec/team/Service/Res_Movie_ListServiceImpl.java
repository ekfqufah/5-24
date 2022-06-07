package com.javalec.team.service;

import com.javalec.team.AppConfig;
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

    Res_Movie_Reserve_Dao dao;
    AppConfig appConfig = new AppConfig();

    /*===== 예매 =====*/
    @Override
    public void listMovie(Model model) {
        dao = appConfig.dao();
        ArrayList<MovieDTO> mList = dao.getMovieList();;
        model.addAttribute("mlist", mList);
    }

    @Override
    public List<TheaterDTO> findTheaterByRegionCode(String Rcode) {
        dao = appConfig.dao();
        List<TheaterDTO> tlist = dao.getTheaterList(Rcode);
        return tlist;
    }

    @Override
    public List<HtimeDTO> findTheaterByMovie(String Mcode) {
        System.out.println("@@###Service : Mcode = " + Mcode);
//        dao = new Res_Movie_Reserve_Dao();
        dao = appConfig.dao();
        List<HtimeDTO> htlist = dao.getTheaterDetail(Mcode);
        return htlist;
    }

    @Override
    public void listTest(Model model) {
        dao = appConfig.dao();
        ArrayList<MovieDTO> pList = dao.listTest();
        model.addAttribute("plist",pList);
    }
}
