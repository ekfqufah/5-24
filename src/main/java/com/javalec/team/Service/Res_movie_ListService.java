package com.javalec.team.service;

import com.javalec.team.dto.HtimeDTO;
import com.javalec.team.dto.TheaterDTO;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

public interface Res_movie_ListService {
    //영화 목록
//    public void listMovie(Model model);
    public void listMovie(Model model);

    //지역별 극장 목록
    public List<TheaterDTO> findTheaterByRegionCode(String Rcode);

//    선택 영화의 상영관 및 시간
//    public List<HtimeDTO> findTheaterByMovie(String Mcode);











    public void listTest(Model model);

//
//    public void findAvailableTheater(String mCode, String tCode, String date, Model model);

    //findAvailableTheater(movie, theater, date)
    //

}
