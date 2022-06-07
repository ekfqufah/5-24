drop  table hall_time cascade constraints;

create table hall_time(
    h_num NUMBER(2) NOT NULL,
    h_time VARCHAR2(10) NOT NULL,
    h_st NUMBER(2) NOT NULL
);
ALTER TABLE hall_time ADD CONSTRAINT hall_time_pk PRIMARY KEY ( h_time );

-- DML

INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'09:00',1);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'11:15',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'13:30',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'15:45',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'18:00',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'20:15',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'22:30',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(2,'09:10',1);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(2,'12:10',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(2,'15:10',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(2,'18:10',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(2,'21:10',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(3,'09:45',1);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(3,'12:55',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(3,'16:05',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(3,'19:15',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(3,'22:25',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(4,'09:30',1);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(4,'12:25',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(4,'15:20',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(4,'18:15',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(4,'21:10',0);

commit;

--220603

