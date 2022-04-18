-- ���α� ���̺� : freeboard
CREATE TABLE freeboard (
	idx number(5) NOT NULL,
	name varchar2(30) NOT NULL,	--�ۼ���
	password varchar2 (10) NOT NULL,	--�ۺ�й�ȣ
	subject varchar2 (40) NOT NULL,		--������
	content varchar2 (2000) NOT NULL,	--�� ����
	readCount number(5) DEFAULT '0',	--��ȸ��
	wdate DATE DEFAULT sysdate,			--�ۼ���¥�� �ð� �⺻��
	ip varchar2 (15) DEFAULT '127.0.0.1',	--����
	commentCount number(3) DEFAULT '0',	--��� ����
	PRIMARY key(idx)
);
--freeboard ���̺��� �⺻Ű idx ������(����Ŭ������ ����մϴ�)
--*mysql �����ͺ��̽��� �������� ���� �÷��� autoincrement(�ڵ�����) ����
CREATE SEQUENCE board_idx_seq;

--������ ���� �߰�
INSERT INTO FREEBOARD(IDX, NAME, PASSWORD, SUBJECT, CONTENT)
VALUES(board_idx_seq.nextval, '���ϴ�', '1111', '�˸��ϴ�.', '���� ���� ����ȳ��Դϴ�.');
INSERT INTO FREEBOARD(IDX, NAME, PASSWORD, SUBJECT, CONTENT)
VALUES(board_idx_seq.nextval, '�ֻ糪', '1234', '����', '��������.');
INSERT INTO FREEBOARD(IDX, NAME, PASSWORD, SUBJECT, CONTENT)
VALUES(board_idx_seq.nextval, '�ڸ��', '4321', '����.', '�ڸ���� ����');
INSERT INTO FREEBOARD(IDX, NAME, PASSWORD, SUBJECT, CONTENT)
VALUES(board_idx_seq.nextval, '�趯��', '1212', '����������', '�����۳���');
INSERT INTO FREEBOARD(IDX, NAME, PASSWORD, SUBJECT, CONTENT)
VALUES(board_idx_seq.nextval, '�ڼ���', '1414', '�̺�Ʈ.', '�̺�Ʈ �ȳ��Դϴ�.');
INSERT INTO FREEBOARD(IDX, NAME, PASSWORD, SUBJECT, CONTENT)
VALUES(board_idx_seq.nextval, '�ѾƸ�', '1111', '��ȸ��.', '��ȸ�� �����Դϴ�.');

SELECT * FROM FREEBOARD f ORDER BY idx DESC ;
SELECT count(*) FROM FREEBOARD f ;

-- *****�Խ��� �������� �۸���� ������������ ó���ؾ��մϴ�.(����¡)
-- ���� : �� ȭ�鿡 ���̴� �۸�Ͽ��� ���� ������ 10���� �Ѵ�. ������ �̵� ��ư�� 10���� �����ش�
-- 		���� ������ �������� ����/��������, �Ǥ��� 1������, �ǵ��������� �̵��ϴ� ��ư�� �ִ�.

--rownum �� ����Ŭ���� SELECT  ����� ���� ��ġ�� ��Ÿ���� �÷��̸��Դϴ�.
SELECT * from(
SELECT rownum AS R, T.* from
(SELECT rownum, idx,name,subject FROM FREEBOARD f ORDER BY idx desc ) T )
WHERE R BETWEEN 1 AND 10; 	--������ 1�� ���� sql
--WHERE R BETWEEN 11 AND 20; 	--������ 2�� ���� sql
--where R between 111 and 120;	--������ 12�� ���� sql : startNo = (pageNo-1)*10+1

-- ���� sql�� SELECT 2���� �ذ��ϱ�

SELECT * FROM FREEBOARD f ORDER BY idx DESC;
SELECT  rownum AS R, T.* from
(SELECT rownum, idx,name,subject FROM FREEBOARD f ORDER BY idx desc ) T;

--����ִ� �Խ����� ��� ���̺�
CREATE TABLE comments(
	idx number(3) NOT NULL,	--��� ���̺��� �⺻Ű
	mref number(5) NOT NULL,	--FREEBOARD ���̺��� idx 
	name varchar2 (30) NOT NULL,	
	content varchar2 (2000) NOT NULL,
	wdate DATE DEFAULT sysdate ,
	ip varchar2 (15) DEFAULT '127.0.0.1', 
	heart number (3) DEFAULT '0',
	PRIMARY key(idx)
);
DROP TABLE comments ;

CREATE SEQUENCE cmt_idx_seq;

INSERT INTO comments(idx,mref,name,content)
values(cmt_idx_seq.nextval,2,'���ϴ�','Ȯ���߽��ϴ�.!!');

--freeboard ���̺��� ��� ����
--1) ��� �ۼ��� ������ +1 2)��� ������ ���ϴ� SELECT 
SELECT count(*) FROM comments WHERE "ref"=3;	--freeboard 3������ ��۰���
SELECT count(*) FROM comments WHERE "ref"=2;

--1)�� ������ ���� : 
--insert into comments -> update FREEBOARD set commentCount=commentCount +1
