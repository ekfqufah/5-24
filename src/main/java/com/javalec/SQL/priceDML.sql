INSERT INTO price(p_code, p_price) VALUES(20001,8000);
INSERT INTO price(p_code, p_price) VALUES(20002,1000);
INSERT INTO price(p_code, p_price) VALUES(20101,11000);
INSERT INTO price(p_code, p_price) VALUES(20102,14000);
INSERT INTO price(p_code, p_price) VALUES(30001,10000);
INSERT INTO price(p_code, p_price) VALUES(30002,11000);
INSERT INTO price(p_code, p_price) VALUES(30101,12000);
INSERT INTO price(p_code, p_price) VALUES(30102,15000);
commit;

--2022.05.30 (알려줘야함)
update price set p_price = 10000 where p_code = 20002;
delete from price where p_code like '3%';

