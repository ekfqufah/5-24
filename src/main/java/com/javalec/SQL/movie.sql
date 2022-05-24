drop  table review cascade constraints;
drop  table user_t cascade constraints;
drop  table cart cascade constraints;
drop  table theather cascade constraints;
drop  table price cascade constraints;
drop  table goods cascade constraints;
drop  table hall cascade constraints;
drop  table seat cascade constraints;
drop  table movie cascade constraints;
drop table screen  cascade constraints;
drop table  book  cascade constraints;
drop table  history  cascade constraints;
drop table  notice_t  cascade constraints;
drop table  FAQ  cascade constraints;
CREATE TABLE book (
                      b_code  NUMBER(10) NOT NULL,
                      b_yn    VARCHAR2(100),
                      sc_code NUMBER(10) NOT NULL,
                      h_code  NUMBER(10) NOT NULL,
                      se_code NUMBER(10) NOT NULL,
                      u_id    VARCHAR2(100 BYTE) NOT NULL
);
ALTER TABLE book ADD CONSTRAINT book_pk PRIMARY KEY ( b_code );
CREATE TABLE cart (
                      c_code   NUMBER(10) NOT NULL,
                      c_amount NUMBER(10),
                      g_code   NUMBER(10) NOT NULL,
                      u_id     VARCHAR2(100 BYTE) NOT NULL
);
ALTER TABLE cart ADD CONSTRAINT cart_pk PRIMARY KEY ( c_code );
CREATE TABLE faq (
                     f_code     NUMBER(3) NOT NULL,
                     f_category VARCHAR2(20),
                     f_title    VARCHAR2(200),
                     f_content  VARCHAR2(200),
                     f_date     DATE,
                     u_id       VARCHAR2(100 BYTE) NOT NULL
);
ALTER TABLE faq ADD CONSTRAINT faq_pk PRIMARY KEY ( f_code );
CREATE TABLE goods (
                       g_code  NUMBER(10) NOT NULL,
                       g_name  VARCHAR2(100 BYTE),
                       g_price NUMBER(10)
);
ALTER TABLE goods ADD CONSTRAINT goods_pk PRIMARY KEY ( g_code );
CREATE TABLE hall (
                      h_code NUMBER(10) NOT NULL,
                      h_name VARCHAR2(100),
                      t_code NUMBER(10) NOT NULL
);
ALTER TABLE hall ADD CONSTRAINT hall_pk PRIMARY KEY ( h_code );
CREATE TABLE history (
                         h_code   NVARCHAR2(10) NOT NULL,
                         h_amount NUMBER(10),
                         u_id     VARCHAR2(100 BYTE) NOT NULL,
                         g_code   NUMBER(10) NOT NULL
);
ALTER TABLE history ADD CONSTRAINT history_pk PRIMARY KEY ( h_code );
CREATE TABLE movie (
                       m_code     NVARCHAR2(10) NOT NULL,
                       m_date     DATE,
                       m_title    VARCHAR2(1000),
                       m_intro    VARCHAR2(1000 BYTE),
                       n_time     NVARCHAR2(10),
                       m_period   DATE,
                       m_grade    NUMBER(10),
                       m_genre    VARCHAR2(1000),
                       m_director VARCHAR2(1000),
                       m_rate     NUMBER(10),
                       m_position VARCHAR2(1000),
                       m_pice     VARCHAR2(1000)
);
ALTER TABLE movie ADD CONSTRAINT movie_pk PRIMARY KEY ( m_code );
CREATE TABLE notice_t (
                          n_code    NUMBER(5),
                          n_title   VARCHAR2(50),
                          n_content VARCHAR2(3000),
                          n_date    DATE,
                          n_view    NUMBER(5),
                          u_id      VARCHAR2(100 BYTE) NOT NULL
);
CREATE TABLE price (
                       p_code  NUMBER(10) NOT NULL,
                       p_price NUMBER(10)
);
ALTER TABLE price ADD CONSTRAINT price_pk PRIMARY KEY ( p_code );
CREATE TABLE review (
                        r_code    NUMBER(10) NOT NULL,
                        r_name    VARCHAR2(100 BYTE),
                        r_content VARCHAR2(100 BYTE),
                        r_date    DATE
);
ALTER TABLE review ADD CONSTRAINT review_pk PRIMARY KEY ( r_code );
CREATE TABLE screen (
                        sc_code NUMBER(10) NOT NULL,
                        sc_time VARCHAR2(1000),
                        t_code  NUMBER(10),
                        sc_date DATE,
                        m_code  NUMBER(10) NOT NULL,
                        h_code  NUMBER(10) NOT NULL
);
ALTER TABLE screen ADD CONSTRAINT screen_pk PRIMARY KEY ( sc_code );
CREATE TABLE seat (
                      se_code NUMBER(10) NOT NULL,
                      p_code  NUMBER(10) NOT NULL,
                      h_code  NUMBER(10) NOT NULL
);
ALTER TABLE seat ADD CONSTRAINT seat_pk PRIMARY KEY ( se_code );
CREATE TABLE theather (
                          t_code NUMBER(10) NOT NULL,
                          t_name VARCHAR2(100 BYTE),
                          t_addr VARCHAR2(300 BYTE),
                          t_tel  VARCHAR2(100 BYTE)
);
ALTER TABLE theather ADD CONSTRAINT theather_pk PRIMARY KEY ( t_code );
CREATE TABLE user_t (
                        u_id    VARCHAR2(100 BYTE) NOT NULL,
                        u_name  VARCHAR2(100 BYTE),
                        u_date  DATE,
                        u_birth VARCHAR2(100 BYTE),
                        u_tel   VARCHAR2(100 BYTE),
                        u_pwd   VARCHAR2(100 BYTE),
                        u_email VARCHAR2(100 BYTE),
                        u_auth  VARCHAR2(100 BYTE),
                        u_point NUMBER(10),
                        u_addr  VARCHAR2(200 BYTE)
);
ALTER TABLE user_t ADD CONSTRAINT user_t_pk PRIMARY KEY ( u_id );
ALTER TABLE book
    ADD CONSTRAINT book_hall_fk FOREIGN KEY ( h_code )
        REFERENCES hall ( h_code ) ON DELETE CASCADE;
ALTER TABLE book
    ADD CONSTRAINT book_screen_fk FOREIGN KEY ( sc_code )
        REFERENCES screen ( sc_code ) ON DELETE CASCADE;
ALTER TABLE book
    ADD CONSTRAINT book_seat_fk FOREIGN KEY ( se_code )
        REFERENCES seat ( se_code ) ON DELETE CASCADE;
ALTER TABLE book
    ADD CONSTRAINT book_user_t_fk FOREIGN KEY ( u_id )
        REFERENCES user_t ( u_id ) ON DELETE CASCADE;
ALTER TABLE cart
    ADD CONSTRAINT cart_user_t_fk FOREIGN KEY ( u_id )
        REFERENCES user_t ( u_id ) ON DELETE CASCADE;
ALTER TABLE faq
    ADD CONSTRAINT faq_user_t_fk FOREIGN KEY ( u_id )
        REFERENCES user_t ( u_id ) ON DELETE CASCADE;
ALTER TABLE cart
    ADD CONSTRAINT g_code FOREIGN KEY ( g_code )
        REFERENCES goods ( g_code ) ON DELETE CASCADE;
ALTER TABLE history
    ADD CONSTRAINT history_goods_fk FOREIGN KEY ( g_code )
        REFERENCES goods ( g_code ) ON DELETE CASCADE;
ALTER TABLE history
    ADD CONSTRAINT history_user_t_fk FOREIGN KEY ( u_id )
        REFERENCES user_t ( u_id ) ON DELETE CASCADE;
ALTER TABLE notice_t
    ADD CONSTRAINT notice_t_user_t_fk FOREIGN KEY ( u_id )
        REFERENCES user_t ( u_id ) ON DELETE CASCADE;
ALTER TABLE screen
    ADD CONSTRAINT screen_hall_fk FOREIGN KEY ( h_code )
        REFERENCES hall ( h_code ) ON DELETE CASCADE;
ALTER TABLE screen
    ADD CONSTRAINT screen_theather_fk FOREIGN KEY ( m_code )
        REFERENCES theather ( t_code ) ON DELETE CASCADE;
ALTER TABLE seat
    ADD CONSTRAINT seat_hall_fk FOREIGN KEY ( h_code )
        REFERENCES hall ( h_code ) ON DELETE CASCADE;
ALTER TABLE seat
    ADD CONSTRAINT seat_price_fk FOREIGN KEY ( p_code )
        REFERENCES price ( p_code ) ON DELETE CASCADE;
ALTER TABLE hall
    ADD CONSTRAINT t_code FOREIGN KEY ( t_code )
        REFERENCES theather ( t_code ) ON DELETE CASCADE;
--비활성화
--ALTER TABLE 유저명.테이블명 DISABLE CONSTRAINT 제약조건명;
ALTER TABLE book  DISABLE CONSTRAINT book_hall_fk;
ALTER TABLE book  DISABLE CONSTRAINT book_screen_fk;
ALTER TABLE book  DISABLE CONSTRAINT book_seat_fk;
ALTER TABLE book  DISABLE CONSTRAINT book_user_t_fk;
ALTER TABLE cart  DISABLE CONSTRAINT cart_user_t_fk;
ALTER TABLE faq  DISABLE CONSTRAINT faq_user_t_fk;
ALTER TABLE cart  DISABLE CONSTRAINT g_code;
ALTER TABLE history  DISABLE CONSTRAINT history_goods_fk;
ALTER TABLE history  DISABLE CONSTRAINT history_user_t_fk;
ALTER TABLE notice_t  DISABLE CONSTRAINT notice_t_user_t_fk;
ALTER TABLE screen  DISABLE CONSTRAINT screen_hall_fk;
ALTER TABLE screen  DISABLE CONSTRAINT screen_theather_fk;
ALTER TABLE seat  DISABLE CONSTRAINT seat_hall_fk;
ALTER TABLE seat  DISABLE CONSTRAINT seat_price_fk;
ALTER TABLE hall  DISABLE CONSTRAINT t_code;
ALTER TABLE book DISABLE CONSTRAINT book_pk;
ALTER TABLE cart  DISABLE CONSTRAINT cart_pk;
ALTER TABLE faq  DISABLE CONSTRAINT faq_pk;
ALTER TABLE goods  DISABLE CONSTRAINT goods_pk;
ALTER TABLE hall  DISABLE CONSTRAINT hall_pk;
ALTER TABLE history  DISABLE CONSTRAINT history_pk;
ALTER TABLE movie  DISABLE CONSTRAINT movie_pk;
ALTER TABLE price  DISABLE CONSTRAINT price_pk;
ALTER TABLE review  DISABLE CONSTRAINT review_pk;
ALTER TABLE screen  DISABLE CONSTRAINT screen_pk;
ALTER TABLE seat  DISABLE CONSTRAINT seat_pk;
ALTER TABLE theather   DISABLE CONSTRAINT theather_pk;
ALTER TABLE user_t   DISABLE CONSTRAINT user_t_pk;
--제약조건활성화
--ALTER TABLE 유저명.테이블명 ENABLE NOVALIDATE CONSTRAINT 제약조건명; /*기존 데이터에 대한 정합성 체크 없