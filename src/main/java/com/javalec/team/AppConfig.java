package com.javalec.team;


import com.javalec.team.dao.Res_Movie_Reserve_Dao;
import com.javalec.team.service.Res_movie_ListService;
import com.javalec.team.service.Impl.Res_Movie_ListServiceImpl;


public class AppConfig {
	
	 public Res_movie_ListService reserveList(){
	        return new Res_Movie_ListServiceImpl();
	    }
	    public Res_Movie_Reserve_Dao dao(){
	        return new Res_Movie_Reserve_Dao();
	    }
}
