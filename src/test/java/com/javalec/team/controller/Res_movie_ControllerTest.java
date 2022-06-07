package com.javalec.team.controller;

import com.javalec.team.AppConfig;
import junit.framework.TestCase;

public class Res_movie_ControllerTest extends TestCase {

    public static void main(String[] args) {
        AppConfig ap = new AppConfig();
        ap.dao();
        ap.reserveList();
//        ap.seatService();
    }
}