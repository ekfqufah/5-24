package com.javalec.team.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.javalec.Util.Constant;
import com.javalec.team.dao.Res_Movie_Reserve_Dao;
import com.javalec.team.dto.HallDTO;
import com.javalec.team.dto.MovieDTO;
import com.javalec.team.dto.TheaterDTO;
import com.javalec.team.service.Res_Movie_ListServiceImpl;
import com.javalec.team.service.Res_movie_ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class Res_movie_Controller {
    JdbcTemplate template;
    Res_movie_ListService ReserveService;

    @Autowired
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
        Constant.template =this.template;
    }

    /*-----페이지 이동-----*/
    @RequestMapping("/")
    public String list(Model model){
        return "reserve/home";
    }


    /*----- select 테스트 -----*/
    @RequestMapping("selecttest")
    @ResponseBody
    public String pricelist(Model model) {
        Res_Movie_Reserve_Dao dao = new Res_Movie_Reserve_Dao();
        ArrayList<MovieDTO> pList = dao.listTest();
        model.addAttribute("plist",pList);
//        ReserveService = new Res_Movie_ListServiceImpl();
//        ReserveService.listTest(model);
        //m_code, m_title
        return "reserve/list";
    }

//        예매 사이트 이동
    @RequestMapping("getreserved")
    public String respage(Model model){
//        영화 리스트 받아옴
        ReserveService = new Res_Movie_ListServiceImpl();
        ReserveService.listMovie(model);
//        list : MovieList
        return "reserve/reserve";
    }

    /*==================== SELECT ====================*/
    /*----- 지역별 영화관 조회 -----*/

//    @RequestMapping("ajaxOne")
//    public String getTheatherList(HttpServletRequest req, Model model){
//        String Rcode = req.getParameter("Rcode");
//        System.out.println("@@@Controller Rcode : " + Rcode);
//        ReserveService = new Res_Movie_ListServiceImpl();
//        ReserveService.findTheaterByRegionCode(Rcode, model);
//
//
//
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("rs","1234");
//        model.addAttribute("mt1",map);
//        return "reserve/reserve";
//    }
    @RequestMapping("ajaxOne")
    @ResponseBody
    public List<TheaterDTO> getTheatherList(HttpServletRequest req){
        String Rcode = req.getParameter("Rcode");
        ReserveService = new Res_Movie_ListServiceImpl();
        List<TheaterDTO> tlist = ReserveService.findTheaterByRegionCode(Rcode);
        return tlist;
    }

//    @RequestMapping("ajaxTwo")
//    @ResponseBody
//    public List<HallDTO> getHallAndTimeList(HttpServletRequest req){
//        String Rcode = req.getParameter("Rcode");
//        ReserveService = new Res_Movie_ListServiceImpl();
//        List<TheaterDTO> tlist = ReserveService.findTheaterByRegionCode(Rcode);
//        return tlist;
//    }

//    @RequestMapping("findSpecificTheater")
//    public String getTheatherList(HttpServletRequest req, Model model){
//        String rCode = req.getParameter("rCode");
//        System.out.println("Controller rcode : " + rCode);
//        ReserveService = new Res_Movie_ListServiceImpl();
//        ReserveService.listTest(rCode, model);
//        System.out.println("Controller ==> getmodel" + model.getClass());
//        return "reserve/reserve";
//    }
//
//    /*----- 시간 및 상영관 조회 ---20220526서버통신됨--*/
//    @RequestMapping("reserve")
//    @ResponseBody
//    public String findvacant(@RequestParam("resultName") String rn, @RequestParam("resultRegionCode") String rrc, @RequestParam("resultTheaterCode") String rt, Model model) {
//        System.out.println(rn);
//        System.out.println(rrc);
//        System.out.println(rt);
//
//        System.out.println("findvacant실행");
//        return "reserve/reserve";
//    }

//  좌석 선택
    @RequestMapping("seat")
    public String selectSeat(HttpServletRequest req, Model model){
        return "reserve/seat";
    }


}
