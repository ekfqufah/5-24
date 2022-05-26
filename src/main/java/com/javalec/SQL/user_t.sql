--DROP TABLE user_t CASCADE CONSTRAINTS;
CREATE TABLE USER_T
(U_ID VARCHAR2(100)
    ,U_NAME VARCHAR2(100)
    ,U_PWD VARCHAR2(100)
    ,U_ADDR1 VARCHAR2(1000)
    ,U_ADDR2 VARCHAR2(1000)
    ,U_ADDR3 VARCHAR2(1000)
    ,U_DATE DATE
    ,U_BIRTH VARCHAR2(100)
    ,U_tel VARCHAR2(100)
    ,U_EMAIL VARCHAR2(100)
    ,U_AUTH VARCHAR2(10)default 'C'
    ,U_POINT NUMBER(30)default 0
    ,U_MONEY NUMBER(30)default 0
);
insert into user_t values ('admin', 'admin1', '1234', '604-080', '서울', '동작구', '2010/10/10', '1944/4/5', '010-0100-1010', 'admin@a.com','A', '999999', '9999999');
insert into user_t values ('user1', 'userAA', '1234', '604-211', '울산', '서구', '2021/12/18', '1985/7/15', '010-4862-8421', 'user1@b.com','C', '100', '759');
insert into user_t values ('user2', 'userBB', '1234', '710-581', '대구', '창신구', '2015/1/5', '1971/8/2', '010-8942-8416', 'user2@C.com','B', '10200', '2440');
insert into user_t values ('a1', 'a11', '1234', '812-588', '밀양', '방구', '2018/6/7', '1988/7/2', '010-5452-5113', 'a1@a.com','C', '200', '40');
insert into user_t values ('a2', 'a22', '1234', '882-815', '김해', '다방구', '2022/3/4', '1992/11/7', '010-2551-8472', 'a2@BB.com','C', '15', '0');
commit;