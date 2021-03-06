CREATE TABLE  member_tbl_02(
	custno NUMBER(6) PRIMARY KEY NOT NULL,
	custname varchar2(20),
	phone varchar2 (13),
	address varchar2(60),
	joindate DATE,
	grade char(1),
	city char(2)
);

SELECT * FROM member_tbl_02 ;

CREATE SEQUENCE member_seq02 INCREMENT BY 1
START WITH 100001;

INSERT INTO MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES(member_seq02.nextval, '???ູ', '010-1111-2222','???? ???빮?? ?ְ?1?? ', '20151202','A','01');
INSERT INTO MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES(member_seq02.nextval, '???ູ', '010-1111-3333','???? ???빮?? ?ְ?2?? ', '20151206','B','01');
INSERT INTO MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES(member_seq02.nextval, '??????', '010-1111-4444','?︪?? ?︪?? ????1?? ', '20151001','B','30');
INSERT INTO MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES(member_seq02.nextval, '?ֻ???', '010-1111-5555','?︪?? ?︪?? ????2?? ', '20151113','A','30');
INSERT INTO MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES(member_seq02.nextval, '????ȭ', '010-1111-6666','???ֵ? ???ֽ? ?ܳ????? ', '20151225','B','60');
INSERT INTO MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES(member_seq02.nextval, '??????', '010-1111-7777','???ֵ? ???ֽ? ???????? ', '20151211','C','60');

CREATE TABLE money_tbl_02(
	custno number(6) NOT NULL,
	salenol number(8) NOT NULL,
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar2(4),
	sdate DATE,
	CONSTRAINT money_pk PRIMARY KEY (custno,salenol),
	CONSTRAINT custno_fk FOREIGN KEY (custno) REFERENCES member_tbl_02 (custno)
);
SELECT * FROM MONEY_TBL_02 mt ;
INSERT INTO MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100001, 20160001, 500, 5, 2500, 'A001', '20160101');
INSERT INTO MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100001, 20160002, 1000, 4, 4000, 'A002', '20160101');
INSERT INTO MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100001, 20160003, 500, 3, 1500, 'A008', '20160101');
INSERT INTO MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100002, 20160004, 2000, 1, 2000, 'A004', '20160102');
INSERT INTO MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100002, 20160005, 500, 1, 500, 'A001', '20160103');
INSERT INTO MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100003, 20160006, 1500, 2, 3000, 'A003', '20160103');
INSERT INTO MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160007, 500, 2, 1000, 'A001', '20160104');
INSERT INTO MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160008, 300, 1, 300, 'A005', '20160104');
INSERT INTO MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160009, 600, 1, 600, 'A006', '20160104');
INSERT INTO MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');

--????
SELECT CUSTNO ,SUM(price) "????" FROM MONEY_TBL_02 mt GROUP BY CUSTNO ;
--ȸ????????ȸ
SELECT mt.custno "ȸ????ȣ" ,custname "ȸ??????",
DECODE(grade,'A','VIP','B','?Ϲ?','C','????') AS "????????" , p."????" 
FROM MEMBER_TBL_02 mt ,
(SELECT CUSTNO ,SUM(price) "????" FROM MONEY_TBL_02 mt GROUP BY CUSTNO) P
WHERE mt.CUSTNO =p.custno ORDER BY "????" DESC ; 

--???? ???? : "?????? ???? ȸ???? 0???? ?????Ѵ?"
--			1) null???? 0???? ?????ϴ? ?Լ? : nvl 2) ?ܺ????????? ?????մϴ?. 
--			3)?????հ谡 ???? ???? ȸ????ȣ ?????? ????
SELECT mt.custno "ȸ????ȣ" ,custname "ȸ??????",
DECODE(grade,'A','VIP','B','?Ϲ?','C','????') AS "????????" ,NVL("????",0) "????"
FROM MEMBER_TBL_02 mt ,
(SELECT CUSTNO ,SUM(price) "????" FROM MONEY_TBL_02 mt GROUP BY CUSTNO ) P
WHERE mt.CUSTNO =p.custno(+)	--2)
ORDER BY "????" DESC,"ȸ????ȣ"; 	--3) ?????? ???????? ȸ????ȣ ?????? ?մϴ?.

--???? select ?????? view?? ?????մϴ?.
CREATE VIEW v_by_custno
AS
SELECT mt.custno "ȸ????ȣ" ,custname "ȸ??????",
DECODE(grade,'A','VIP','B','?Ϲ?','C','????') AS "????????" , p."????" 
FROM MEMBER_TBL_02 mt ,
(SELECT CUSTNO ,SUM(price) "????" FROM MONEY_TBL_02 mt GROUP BY CUSTNO) P
WHERE mt.CUSTNO =p.custno ORDER BY "????" DESC ;

SELECT * FROM V_BY_CUSTNO vbc ;


