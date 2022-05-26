package com.javalec.team.controller;

import com.javalec.Util.Constant;
import com.javalec.team.dto.TestDTO;
import com.javalec.team.service.Res_Price_ServiceImpl;
import com.javalec.team.service.Res_movie_List_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class Res_movie_Controller {
    JdbcTemplate template;
    Res_movie_List_Service ReserveService;

    @Autowired
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
        Constant.template =this.template;
    }
    /*-----페이지 이동-----*/
    @RequestMapping("/")
    public String list(Model model){
        return "reserve/reserve";
    }
    /*
    @RequestMapping("reserve/reservePage")
    public String respage(Model model){
        return "reserve/reserve";
        ReserveService = new Res_Price_ServiceImpl();
    }*/

    /*----- 시간 및 상영관 조회 ---20220526서버통신됨--*/
    @RequestMapping("reserve")
    @ResponseBody
    public String findvacant(@RequestParam("resultName") String rn, @RequestParam("resultRegionCode") String rrc, @RequestParam("resultTheaterCode") String rt, Model model) {
        System.out.println(rn);
        System.out.println(rrc);
        System.out.println(rt);
        System.out.println("findvacant실행");
        return "reserve/reserve";
    }

    /*----- select 테스트 -----*/
    @RequestMapping("/reserve/list")
    public String pricelist(Model model) {
        ReserveService.list(model);

        return "reserve/list";
    }
    @RequestMapping("ajaxtesting")
    @ResponseBody
//    Map pluss(int num1, int num2, Model model){
//	Map pluss(@RequestParam("num1") String aaa, Model model){
    String pluss(@RequestParam ("num1") String aaa, @RequestParam ("num2") String bbb, Model model){
        System.out.println("@@@### aaa ===>"+aaa);
        System.out.println("@@@### bbb ===>"+bbb);

//        Map rs = new HashMap<String, Object>();
//        rs.put("rs",aaa);
//        rs.put("msg","더하기임");
//        model.addAttribute("m",rs);
        model.addAttribute("rs",aaa);
//        return rs;
        return "at";
    }



}
