--1)

CREATE SEQUENCE tblbuy_seq START WITH 2001;

-- CREATE SEQUENCE tblbuy_seq MINVALUE 2001;


--2)
CREATE TABLE tbl_postcode (
postcode char(5) PRIMARY KEY,
area1 varchar2(200) NOT NULL 
);

--3)
ALTER TABLE "TBL_CUSTOM#" ADD (postcode char(5) );

 

--4)
ALTER TABLE "TBL_CUSTOM#" ADD CONSTRAINTS fk_postcode
FOREIGN KEY (postcode) REFERENCES tbl_postcode(postcode);


--1)
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('137964','����Ư���� ���ʱ� ����2��');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('138761','����Ư���� ���ı� ������ 409880');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('412510','��⵵ ���� ���籸 ������');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('409880','��õ������ ������ �ڿ���');

--2)
UPDATE "TBL_CUSTOM#" SET POSTCODE ='137964' WHERE CUSTOM_ID ='mina012';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='412510' WHERE CUSTOM_ID ='hongGD';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='409880' WHERE CUSTOM_ID ='wonder';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='138761' WHERE CUSTOM_ID ='sana';

--3�� 14�� �� ������ ����� ���� : ����/������ ���� �м�
--1. ER���̾�׷��� ���� ������ ����� ���踦 �����մϴ�.
--	1)������ Ÿ��:number(n,m) : n�� �ǹ�,m�� �ǹ� ����) number(5,0)�� ���� n:����� ������ �ִ� ��ü �ڸ���,
--																m:�Ҽ��� ���� �ڸ���
--char(n):�������� ���ڿ� ����n<=2000byte,varchar2(n):�������� ���ڿ� ����, ���ڿ��� ���̰� n byte ���� ������ ���Ѿ���
--�ѱ۰� ������ ���� : , date Ÿ��
--	2)�⺻Ű �÷� : �⺻Ű �÷��� �ǹ̸� �ۼ��ϰ� ���÷� ����. tbl_custom#���̺��� �⺻Ű custom_id�� ������
--				�⺻Ű �÷��� ������ ���� ������ �� �ִ�. �׷��� custom_id�÷��� ���� �ߺ��� ���̸� �ȵ˴ϴ�.
--				�������� �⺻Ű�� ����� ���� �� ������ ����. �⺻Ű�� unique �÷��̾���ϴµ� �����ϴ� �÷��� �����Ƿ�
--				������ �Ϸù�ȣ�� �ο��մϴ�. �⺻Ű�� ������ �÷��� ���(custom_id,pcode)�� ���� �����Ҽ� ����
--				�׷��� ���⼭�� (custom_id,pcode)�� unique������ �������� �ʾ� �������� �⺻Ű ����
--	3)unique �������� : unique �� ������ ��. �� �ߺ��� ���� ������� �ʴ� �÷�
--	4) �������� �ܷ�Ű ��������: ��� ���迡 ���� ���� 
--						�� Ű���� : ����,�����÷�
--						�� on delete ����

--2. ���ν��� ����(����) �ϰ� �����ϱ� (��� �ڵ带 ����)
--1) insert,update,delete Ʈ����� ���� : return_book
--2) ?? select �� �ϴ� ������ �����뿩 ���̺��� ������� �ʿ��� ��ȸ�� �����ϴ� ���ν���
--		�Է¸Ű����� 1���̻�, ��¸Ű����� 1���̻�(��, ȸ�� 1���� �Ϸ翡 1���� å�� �뿩�Ѵٴ� ����)
--		select ����� 1������ ��ȸ�Ǵ� ��츸�� ������ �ؾ��մϴ�.

--3. 2���� 1) �Ǵ� 2)�� java jdbc�� ���α׷����մϴ�.(�ݳ��ϴ� å�� ��¥�� Ű���� �Է����� ó���ϱ�)
--	��> ����� ���� 8�ñ��� ���۵���̺꿡 �ۼ��ؼ� ����
--		��> ���������� ���������� �÷��ְڽ��ϴ�.