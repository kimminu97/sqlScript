CREATE TABLE gallery( 
pno number(5) NOT NULL, 
title varchar2(40), 
wdate DATE,
filenames varchar2(70), --���ε� �� ���ϸ� ���� �÷� 
PRIMARY KEY(pno) );

CREATE SEQUENCE pno_seq;