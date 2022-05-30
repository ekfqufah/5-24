package com.javalec.team.res;

public class findvacancy {
    public static void main(String[] args) {
        int theaterAvailable = (int) (Math.random()*10);
        System.out.println("theaterAvailable = " + theaterAvailable);
        String num = "4";
        System.out.println("select t_name from theather where t_code like '"+num+"%'");
    }
}