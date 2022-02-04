--TBL MEMBER ����
DROP TABLE TBL_MEMBER;

--�ش� ���� ��üȭ�� : Ŭ�� �� CTRL + M
--�ּ� : �ؼ����� ���ϰ� �ϴ� ����
--1. �������� ������� �� ��
--2. ���� ���� ������� �ʴ� �ҽ��ڵ带 �ؼ��ϰ� ���� ���� ��

--�ڵ��� ���̺� ����
--���� ����: ���̺��� ������ �� Ư�� �÷��� ������ �ο��Ͽ� ������ �����͸� �˻��Ѵ�.
CREATE TABLE TBL_CAR(
	ID NUMBER,
	BRAND VARCHAR2(100),
	COLOR VARCHAR2(100),
	PRICE NUMBER,
	CONSTRAINT CAR_PK PRIMARY KEY(ID)
);

DROP TABLE TBL_CAR;

--���� ���� ����
ALTER TABLE TBL_CAR DROP CONSTRAINT CAR_PK;

--���� ���� �߰�
ALTER TABLE TBL_CAR ADD CONSTRAINT CAR_PK PRIMARY KEY(ID);

SELECT * FROM TBL_CAR;
------------------------------------------------------
--���� ���̺� ����
CREATE TABLE TBL_ANIMAL(
	ID NUMBER PRIMARY KEY,
	"TYPE" VARCHAR2(100),
	AGE NUMBER(3),
	FEED VARCHAR2(100)
);
--���� �������� ����(PK)
ALTER TABLE TBL_ANIMAL DROP CONSTRAINT SYS_C007003;
--�������� �߰�(PK)
ALTER TABLE TBL_ANIMAL ADD CONSTRAINT ANIMAL_PK PRIMARY KEY(ID);

SELECT * FROM TBL_ANIMAL;
