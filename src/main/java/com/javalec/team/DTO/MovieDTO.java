package com.javalec.team.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
public class MovieDTO {
     String m_code; //
     Date m_date;   //
     String m_title;    //
     String m_intro;    //
     int m_time;
     Date m_period;
     int m_grade;   //
     String m_genre;    //
     String m_director; //
     int m_rate;    //
     String m_position;
     String m_pics;

    public MovieDTO(String m_code, String m_title, Date m_period) {
        this.m_code = m_code;
        this.m_title = m_title;
        this.m_period = m_period;
    }
}
