package com.javalec.team.dto;

import com.javalec.team.AppConfig;
import com.javalec.team.service.Res_movie_ListService;
import junit.framework.TestCase;
import org.junit.Test;

public class MovieDTOTest extends TestCase {

    AppConfig appConfig;
    Res_movie_ListService sList = appConfig.reserveList();
    @Test
    public static void main(String[] args) {
        int num = 20001;
        System.out.println(num/100%100);
    }

}