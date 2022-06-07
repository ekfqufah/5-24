drop table  book  cascade constraints;

CREATE TABLE book (
                      b_code  NUMBER(10) NOT NULL,
                      b_yn    VARCHAR2(100),
                      sc_code NUMBER(10) NOT NULL,
                      h_code  NUMBER(10) NOT NULL,
                      se_code NUMBER(10) NOT NULL,
                      u_id    VARCHAR2(100 BYTE) NOT NULL,
                      m_code NVARCHAR2(10),
                      b_date DATE NOT NULL,
                      p_code NUMBER(10) NOT NULL,
                      h_time VARCHAR2(10) NOT NULL
);
ALTER TABLE book ADD CONSTRAINT book_pk PRIMARY KEY ( b_code );

ALTER TABLE book
    ADD CONSTRAINT book_hall_fk FOREIGN KEY ( h_code )
        REFERENCES hall ( h_code ) ON DELETE CASCADE;
-- ALTER TABLE book
--     ADD CONSTRAINT book_screen_fk FOREIGN KEY ( sc_code )
--         REFERENCES screen ( sc_code ) ON DELETE CASCADE;
-- ALTER TABLE book
--     ADD CONSTRAINT book_seat_fk FOREIGN KEY ( se_code )
--         REFERENCES seat ( se_code ) ON DELETE CASCADE;
ALTER TABLE book
    ADD CONSTRAINT book_user_t_fk FOREIGN KEY ( u_id )
        REFERENCES user_t ( u_id ) ON DELETE CASCADE;
ALTER TABLE book
    ADD CONSTRAINT book_price_fk FOREIGN KEY ( p_code )
        REFERENCES price ( p_code ) ON DELETE CASCADE;
ALTER TABLE book
    ADD CONSTRAINT book_hall_time_fk FOREIGN KEY ( h_time )
        REFERENCES hall_time ( h_time ) ON DELETE CASCADE;


-- 2022.06.02 (Not Informed)
-- alter table book add m_code nvarchar2(10);
-- alter table book add b_date date;