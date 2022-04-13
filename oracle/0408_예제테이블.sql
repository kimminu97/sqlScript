CREATE TABLE MEMBER( 
    mno NUMBER NOT NULL,
    name varchar2(20) NOT NULL,
    password varchar2(15) NOT NULL,
    email varchar2(30) NOT null,
    gender varchar2(10),
    age number null,
    hobby varchar2(30),
    addr  varchar2(20),
    PRIMARY KEY(mno));
/* ���̺� ���� ���� : ����Ű Ctrl + ���� */    
   
create sequence member_idx_seq;     

insert into member(mno,name,password,email,gender,age, hobby,addr)
values (MEMBER_IDX_SEQ.NEXTVAL,'ȫ�浿','1111','a@a.a','male',23,'[��,��Ű]','����');


CREATE TABLE schedule (
	idx NUMBER NOT NULL,    /*�ڵ�����(������), PK*/
	mno NUMBER NOT NULL,	/*member���̺� mno*/
	title varchar2(50) NOT NULL,
	sdate DATE NOT NULL,   /*��¥�� �ð�*/
	PRIMARY key(idx),
	FOREIGN key(mno) REFERENCES "MEMBER"(mno)
);

CREATE SEQUENCE sch_idx_seq;

INSERT INTO SCHEDULE(idx,mno,title,sdate)
VALUES(sch_idx_seq.nextval,1,'�',TO_DATE('2021-05-05','YYYY-MM-DD HH24:MI'));
/*���ڿ��� ��¥�������� �����Ű�� �Լ� �ʿ�*/

SELECT * FROM SCHEDULE WHERE mno=1;
