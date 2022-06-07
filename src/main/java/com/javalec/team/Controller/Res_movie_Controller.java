package com.javalec.team.controller;

import com.javalec.Util.Constant;
import com.javalec.team.AppConfig;
import com.javalec.team.dao.Res_Movie_Reserve_Dao;
import com.javalec.team.dto.*;
import com.javalec.team.service.Res_Movie_ListServiceImpl;
//import com.javalec.team.service.Res_Movie_SeatService;
import com.javalec.team.service.Res_movie_ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class Res_movie_Controller {
    AppConfig appConfig = new AppConfig();
    public JdbcTemplate template;
    Res_movie_ListService ReserveService;
//    Res_Movie_SeatService SeatService;
    Res_Movie_Reserve_Dao dao;

    @Autowired
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
        Constant.template =this.template;
    }

    /*----- select 테스트 -----*/
    @RequestMapping("selecttest")
    @ResponseBody
    public String pricelist(Model model) {
        dao = appConfig.dao();
        ArrayList<MovieDTO> pList = dao.listTest();
        model.addAttribute("plist",pList);
//        ReserveService = new Res_Movie_ListServiceImpl();
//        ReserveService.listTest(model);
        //m_code, m_title
        return "reserve/list";
    }

    /*-----페이지 이동-----*/
    @RequestMapping("/")
    public String list(Model model){
        return "reserve/home";
    }

//  예매 사이트 이동
    @RequestMapping("getreserved")
    public String respage(Model model){
        ReserveService = appConfig.reserveList(); //영화 리스트 받아옴
        ReserveService.listMovie(model); //list : MovieList
        return "reserve/reserve";
    }

//  좌석 선택 사이트 이동 DEMO1
    @RequestMapping("gspage")
    public String spage(){
        return "reserve/seat";
    }


    /*==================== SELECT ====================*/
    /*----- 지역별 영화관 조회 -----*/
    @RequestMapping("ajaxOne")
    @ResponseBody
    public List<TheaterDTO> getTheatherList(HttpServletRequest req){
        String Rcode = req.getParameter("Rcode"); // View에서 지역 코드 받아옴
        ReserveService = appConfig.reserveList();
        List<TheaterDTO> tlist = ReserveService.findTheaterByRegionCode(Rcode);
        return tlist;
    }

    /*----- 선택한 영화의 상영관 및 시간 조회 -----*/
    @RequestMapping("ajaxTwo")
    @ResponseBody
    public List<HtimeDTO> getTimeAndHall(HttpServletRequest req){
        String Mcode = req.getParameter("Mcode");
        ReserveService = appConfig.reserveList();
//        ReserveService = new Res_Movie_ListServiceImpl();
        List<HtimeDTO> HallTimeList = ReserveService.findTheaterByMovie(Mcode);
        for (int i = 0;i<HallTimeList.size();i++){
            if(1 == HallTimeList.get(i).getH_num()){
                System.out.println("@@@###HallTimeLIst : "+ i+") " + HallTimeList.get(i).getH_time());
            }
//            System.out.println("@@@###HallTimeLIst : "+ i+") " + HallTimeList.get(i).getH_num());
        }
        return HallTimeList;
    }

//  좌석 선택
    @RequestMapping("seat")
    public String selectSeat(HttpServletRequest req, HttpServletResponse response, Model model){
        response.setHeader("Content-Type","text/html;charset=utf-8");
        dao = appConfig.dao();

        String Mname = req.getParameter("SresultName"); //영화 제목
        String Tname = req.getParameter("SresultTheater"); //영화관 명
        String Rname = req.getParameter("SresultRegion"); //지역 명

        String Mcode = req.getParameter("resultNameCode"); //영화 코드
        String Rcode = req.getParameter("resultRegionCode"); //지역 번호(1~9)
        String Tcode = req.getParameter("resultTheaterCode"); //영화관 코드(101~90x)

        String Sdate = req.getParameter("resultDate"); //선택 날짜
        String Shall = req.getParameter("resultHall"); //선택 상영관 (1~4)
        String Stime = req.getParameter("resultTime"); //선택 시간

        MovieMemory mm = new MovieMemory(Mname, Tname, Rname, Sdate,Shall,Stime);
        System.out.println(mm.toString());
        model.addAttribute("ReserveDetail",mm);

        //조조 여부 (0,1)
        int hnum = Integer.parseInt(Shall);
        ArrayList<HtimeDTO> jlist = dao.jValidation(hnum, Stime);
        int rstatus = jlist.get(0).getH_st();
        model.addAttribute("rst",rstatus);

        ArrayList<Integer> priceList = dao.getPrice(rstatus);
        for (int i =0;i< priceList.size();i++){
            priceList.get(i);
        }

        //좌석 리스트 가져오기
        ArrayList<SeatDTO> slist = dao.getSeatInfo(Shall);
        

        //선택된 좌석 제외


        model.addAttribute("sInfo",slist); //좌석 정보
        model.addAttribute("pList",priceList); //가격 정보
        return "reserve/seat";
    }


//
//    @RequestMapping("pProc")
//    public void getBookedTest(HttpServletRequest req){
//        String movieName = req.getParameter("name");
//        System.out.println("movieName = " + movieName);
//        String totalMoney = req.getParameter("amount");
//        System.out.println("totalMoney = " + totalMoney);
//    }


    @RequestMapping("st")
    public String gt(HttpServletRequest req){
        String movieName = req.getParameter("name");
        System.out.println("movieName = " + movieName);
        String totalMoney = req.getParameter("amount");
        System.out.println("totalMoney = " + totalMoney);
        return "checkReserveData";
    }
}
