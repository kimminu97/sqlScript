--�߿�1 :���� ��ǰ ���̺��� ��(row)�����͸� ������ CUSTOM_ID,PCODE�� �ߺ��Ǹ� �ȵ˴ϴ�.
--		�� �⺻Ű �÷��� ���մϴ�.(�ߺ��� ���� NULL�� ����� �ȵ˴ϴ�.)
--�߿�2: ������� PRICE,QUANTITY ���� �÷��� null�� �Ǹ� �ȵȴ�.
--		�� NOT NULL �÷����� �����մϴ�.(NULL ���� �ȵ˴ϴ�.)
--�߿�3: ���� ��ǰ���̺� ���� CUSTOM_ID , pcode �÷� ���� ����ϸ� �ȵȴ�.
--		�� �ܷ�Ű �÷��� ���մϴ�.(�ٸ� ���̺��� ���� �����մϴ�.NULL ��뵵 ���մϴ�.)

--���� not null, �⺻Ű, �ܷ�Ű�� ��ǥ���� ��������(CONSTRAINT) �����Դϴ�.
-- ���������� ������ ���̺�� ������ ���ϴ�.
--�� ���̺�
CREATE TABLE tbl_custom# (
	custom_id varchar2(20) PRIMARY KEY,	
	name nvarchar2 (20) NOT NULL ,	
	email varchar2 (20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);
--��ǰ ���̺� : ��ǰ�ڵ�(�������� 20�ڸ�),ī���(�������� 2�ڸ�)
--								A1 :������ǰ, B1:��ǰ
CREATE  TABLE tbl_product#(
	pcode varchar2 (20) CONSTRAINT pk_product PRIMARY KEY,
	category char(2),
	pname nvarchar2 (20) NOT NULL,
	price number (9) NOT NULL 
);

--���� ���̺� : ��� ���� ���� ��ǰ�� �����ϴ°�?
--���� ���̺��� �⺻Ű�� ������ �÷��� �߰��մϴ�.
CREATE TABLE tbl_buy#(
	buy_seq number(8),	--�������� �Ϸù�ȣ
	custom_id varchar2(20),
	pcode varchar2 (20),
	quantity number (5) NOT NULL,	
	buy_date timestamp,
	CONSTRAINT pk_buy_seq PRIMARY key(buy_seq),
	CONSTRAINT fk_custom_id FOREIGN KEY (custom_id)	--�� ���̺��� �÷���
		REFERENCES tbl_custom# (custom_id),	--�������̺�� �� �÷���
	CONSTRAINT fk_pcode FOREIGN KEY (pcode)
		REFERENCES tbl_product# (pcode)
	--�ܷ�Ű�� ������ �� �ִ� �÷��� �⺻Ű �Ǵ� unique(������)�� ���ؼ��� �����մϴ�.
	--�ܷ�Ű �÷��� ���� ���̺��� �÷��� �� �ϳ��� ������ �� �ֽ��ϴ�.
);
SELECT * FROM TBL_CUSTOM# tc; 
--�������� �߰� : INSERT 
INSERT INTO TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '��̳�', 'kimm@gmail.com', 20, sysdate);
INSERT INTO TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', 'ȫ�浿', 'gil@korea.com', 32, sysdate);
INSERT INTO TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '�ڸ��', 'momo@daum.net', 29, sysdate);
INSERT INTO TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�̳���', 'lee@naver.com', 40, sysdate);
--�߿�1 :custom ���̺��� ��(row)�����͸� ������ CUSTOM_ID,PCODE�� �ߺ��Ǹ� �ȵ˴ϴ�.
INSERT INTO TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�ָ��', 'choi@naver.com', 33, sysdate);

SELECT * FROM "TBL_PRODUCT#" tp ;
INSERT INTO TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '�����е�', 880000);
INSERT INTO TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123A', 'B1', '������ġ������Ʈ', 54000);
INSERT INTO TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '��ǵ���ũ', 234500);
--�߿�2: ������� PRICE,QUANTITY ���� �÷��� null�� �Ǹ� �ȵȴ�.
INSERT INTO TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_1433', 'A2', '�ڵ���ǵ���ũ');

--����Ŭ������ �Ϸù�ȣ�� �ڵ����� �����ؼ� ����ϰ� �Ҽ� �ִ� ������ ����� �ֽ��ϴ�.
CREATE SEQUENCE tbl_buy_seq; 
--�ѹ� ������� �������� ���� �ǵ��� �� �����ϴ�.

--�������� ���� ����� �ʹٸ� �����ϰ� �ٽ� ���弼��.
DROP SEQUENCE tbl_buy_seq ;
--���̺��� �����͵� �����ϼ���. �׸��� �ٽ� ������ ����/������ �߰�

SELECT * FROM "TBL_BUY#" tb ;
--��̳��� �����е� 1���� ���� ����
INSERT INTO TBL_BUY#(buy_seq ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'IPAD011',1, '2022-02-06');
--ȫ�浿�� �����е� 2���� ���� ����
INSERT INTO TBL_BUY#(buy_seq ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'hongGD', 'IPAD011', 2, '2022-02-07');
--�̳����� ��ġ������Ʈ 3���� ���� ����
INSERT INTO TBL_BUY#(buy_seq ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'wonder', 'DOWON123A', 3, '2022-02-06');
--��̳��� ��ǵ���ũ 1���� ���� ����
INSERT INTO TBL_BUY#(buy_seq ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'dk_143', 1, '2022-02-07');
--�ڸ�� ��ġ������Ʈ 2���� ���� ����
INSERT INTO TBL_BUY#(buy_seq ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'twice', 'DOWON123A', 2, '2022-02-07');

--�߿�3: ���� ��ǰ���̺� ���� CUSTOM_ID , pcode �÷� ���� ����ϸ� �ȵȴ�.
--�ܷ�Ű�� ������ custom_id�� tbl_custom#���̺��� �����մϴ�. 
--�������̺��� custom_id �÷����� ���°��� ������ �� �����ϴ�.(�ܷ�Ű ����, ���Ἲ �������� ����)
INSERT INTO TBL_BUY#(buy_seq ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'min012', 'PAD011',1, '2022-02-06');

--1. custom# ���̺��� age �� 30�� �̻� ��� ���� ��ȸ
SELECT * FROM "TBL_CUSTOM#" tc WHERE AGE >= 30;
--2. custom# ���̺��� custom_id 'twice' �� email ��ȸ
SELECT email FROM "TBL_CUSTOM#" tc WHERE CUSTOM_ID ='twice';
--3. product# ���̺��� category 'A2' �� pname ��ȸ
SELECT pname FROM "TBL_PRODUCT#" tp WHERE CATEGORY ='A2';
--4. product# ���̺��� price �� �ְ� ��ȸ
SELECT MAX(price) FROM "TBL_PRODUCT#" tp;  
--5. buy# ���̺��� 'IPAD011' �ѱ��� ���� ��ȸ
SELECT SUM(QUANTITY)  FROM "TBL_BUY#" tb WHERE PCODE = 'IPAD011';
--6. buy# ���̺��� custom_id 'mina012' �� ��� ���� ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE CUSTOM_ID ='mina012';
--7. buy# ���̺��� pcode �� '1'�� ���Ե� �� ��ȸ
SELECT  * FROM "TBL_BUY#" tb WHERE PCODE ='1'; --������ġ ��ȸ
SELECT  * FROM "TBL_BUY#" tb WHERE PCODE like'%1%'; --�κ���ġ ��ȸ 1�� ����
SELECT  * FROM "TBL_BUY#" tb WHERE PCODE like'1%'; --�κ���ġ ��ȸ 1�� ����
SELECT  * FROM "TBL_BUY#" tb WHERE PCODE like'%1'; --�κ���ġ ��ȸ 1�� ����
--8. buy#���̺��� pcode �� 'on'�� �����ϴ� �� ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE '%ON%';
