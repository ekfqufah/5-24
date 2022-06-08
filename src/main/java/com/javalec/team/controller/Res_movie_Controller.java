package com.javalec.team.controller;

import com.javalec.team.util.Constant;
import com.javalec.team.AppConfig;
import com.javalec.team.dao.Res_Movie_Reserve_Dao;
import com.javalec.team.dto.*;
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
    Res_Movie_Reserve_Dao dao;

    @Autowired
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
        Constant.template =this.template;
    }

    //메인 -> 예매 페이지 이동
    @RequestMapping("reser")
    public String respage(Model model){
        ReserveService = appConfig.reserveList(); 
        ReserveService.listMovie(model); 
        return "reserve/reserve";
    }

    //예매 -> 좌석 선택 페이지 이동
    @RequestMapping("gspage")
    public String spage(){
        return "reserve/seat";
    }

    @RequestMapping("gspagasdsae")
    public String spagasdsade(){
        String str = "asdsadadadsasd";
        return "abc";
    }

    /*==================== SELECT ====================*/
    @RequestMapping("ajaxOne")
    @ResponseBody
    public List<TheaterDTO> getTheatherList(HttpServletRequest req){
        String Rcode = req.getParameter("Rcode"); 
        ReserveService = appConfig.reserveList();
        List<TheaterDTO> tlist = ReserveService.findTheaterByRegionCode(Rcode);
        return tlist;
    }

    @RequestMapping("ajaxTwo")
    @ResponseBody
    public List<HtimeDTO> getTimeAndHall(HttpServletRequest req){
        String Mcode = req.getParameter("Mcode");
        ReserveService = appConfig.reserveList();
        List<HtimeDTO> HallTimeList = ReserveService.findTheaterByMovie(Mcode);
        for (int i = 0;i<HallTimeList.size();i++){
            if(1 == HallTimeList.get(i).getH_num()){
                System.out.println("@@@###HallTimeLIst : "+ i+") " + HallTimeList.get(i).getH_time());
            }
        }
        return HallTimeList;
    }

    @RequestMapping("seat")
    public String selectSeat(HttpServletRequest req, HttpServletResponse response, Model model){
        response.setHeader("Content-Type","text/html;charset=utf-8");
        dao = appConfig.dao();

        String Mname = req.getParameter("SresultName"); 
        String Tname = req.getParameter("SresultTheater"); 
        String Rname = req.getParameter("SresultRegion"); 

        String Mcode = req.getParameter("resultNameCode"); 
        String Rcode = req.getParameter("resultRegionCode"); 
        String Tcode = req.getParameter("resultTheaterCode"); 

        String Sdate = req.getParameter("resultDate"); 
        String Shall = req.getParameter("resultHall"); 
        String Stime = req.getParameter("resultTime"); 

        MovieMemory mm = new MovieMemory(Mname, Tname, Rname, Sdate, Shall, Stime, Mcode);
        System.out.println(mm.toString());
        model.addAttribute("ReserveDetail",mm);

        int hnum = Integer.parseInt(Shall);
        ArrayList<HtimeDTO> jlist = dao.jValidation(hnum, Stime);
        int rstatus = jlist.get(0).getH_st();
        model.addAttribute("rst",rstatus);

        ArrayList<Integer> priceList = dao.getPrice(rstatus);
        for (int i =0;i< priceList.size();i++){
            priceList.get(i);
        }
        ArrayList<SeatDTO> slist = dao.getSeatInfo(Shall);

        model.addAttribute("sInfo",slist);
        model.addAttribute("pList",priceList); 
        return "reserve/seat";
    }

    @RequestMapping("procc")
    public void gt(HttpServletRequest req){
        String movieName = req.getParameter("name");
        String totalMoney = req.getParameter("amount");
        String date = req.getParameter("buyer_email");
        String pla = req.getParameter("buyer_addr");
        String sein = req.getParameter("buyer_postcode");

        System.out.println("=================================");
        System.out.println("movieName1 = " + movieName); //�쁺�솕 肄붾뱶
        System.out.println("totalMoney1 = " + totalMoney);
        System.out.println("buyer_email1 = " + date); //�씪�떆  2022-06-0721:10
        System.out.println("buyer_addr1 = " + pla); //吏��뿭+�긽�쁺愿�踰덊샇 異섏쿇2
        System.out.println("buyer_postcode1 = " + sein); //醫뚯꽍 踰덊샇 c1d1
        System.out.println("=================================");
    }
    
    //결제 완료 후 메인 페이지 이동
    @RequestMapping("st")
    public String nextt(){
        return "main/index";
    }
}
