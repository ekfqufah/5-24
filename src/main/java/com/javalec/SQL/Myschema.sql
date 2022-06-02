--(알려줘야함)
-- h_time : 상영관, 상영 시간, 조조 여부
create table h_time(
   h_num number(2),
   h_time varchar(10),
   h_st number(2)
);


-- screen 수정(220531)
CREATE SEQUENCE  "TEAM"."SCREEN_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
CREATE TABLE screen (
                        sc_code NUMBER(10) NOT NULL,
                        m_code  NUMBER(10) NOT NULL,
                        h_num NUMBER(2),
                        m_date DATE,
                        m_period DATE
);
ALTER TABLE screen ADD CONSTRAINT screen_pk PRIMARY KEY ( sc_code );


-- Seat
drop table seat cascade constraints;
create table seat(
                     h_num number(2),
                     se_code varchar(5)
);
