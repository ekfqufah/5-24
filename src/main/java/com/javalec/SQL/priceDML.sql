drop  table price cascade constraints;
CREATE TABLE price (
                       p_code  NUMBER(10) NOT NULL,
                       p_price NUMBER(10)
);
ALTER TABLE price ADD CONSTRAINT price_pk PRIMARY KEY ( p_code );

--DML
INSERT INTO price(p_code, p_price) VALUES(20001,8000);
INSERT INTO price(p_code, p_price) VALUES(20002,10000);
INSERT INTO price(p_code, p_price) VALUES(20101,11000);
INSERT INTO price(p_code, p_price) VALUES(20102,14000);

commit;


