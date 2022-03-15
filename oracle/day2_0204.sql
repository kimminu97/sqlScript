-- DML : SELECT, INSERT, UPDATE, DELETE ���� �˾ƺ���

--SELECT(������ ��ȸ) : select �÷���1,�÷���2,...from ���̺��
SELECT STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC
FROM STUDENTS;

--���õǴ� �÷��� �ʿ��� �͵�� �մϴ�. ��ɾ� �Ѱ������� ctrl+enter
SELECT stuno,stu_name FROM STUDENTS;

--��� �÷��� ������ ���� wildcard ���� *�� ��ü
SELECT * FROM STUDENTS;

--������ ��ȸ�� ���Ǵ� ���� �߰��� where �ڿ� ���ǽ� �ۼ�
SELECT * FROM STUDENTS WHERE STUNO=1;
SELECT * FROM STUDENTS WHERE STU_NAME='�ֳ���';
SELECT * FROM STUDENTS WHERE ENTER_DATE > '2020-06-01';

--null �� �����͸� ��ȸ�ϴ� ���ǽ�
SELECT stuno,stu_name,enter_date, etc FROM STUDENTS WHERE ETC IS NULL;
SELECT stuno,stu_name,enter_date, etc FROM STUDENTS WHERE ETC IS NOT NULL;

--������ ��ȸ �Ҷ� �÷��� ��ſ� �Լ�(count,sum,avg,max,min)�� ���
SELECT COUNT(*) FROM STUDENTS;
SELECT max(stuno) FROM STUDENTS s;	--s�� ��Ī(alias)
SELECT MIN(stuno) FROM STUDENTS s;

SELECT MAX(stu_name) FROM STUDENTS;	--���ڿ�Ÿ���� Į���� ������ ���Ͽ� ����� ����
SELECT MIN(stu_name) FROM STUDENTS;

--������ ��ȸ ���ǽ��� IN, �Ǵ� not in : or ���ǽ����� ������ ���� ����Ҷ�
SELECT * FROM STUDENTS s WHERE STUNO = 1 OR STUNO =3;
SELECT * FROM STUDENTS s WHERE STUNO IN(1,3);	-- ������ �÷��� ���� ������ ���� OR���ǰ˻�

--INSERT(������ �߰�) : insert into ���̺�� (�÷���1,�÷���2,...)values(��1,��2,...)
INSERT INTO STUDENTS
(STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC)
VALUES(0, '', '', '', '', '');

--update(������ ����) : update ���̺�� set �÷���1=��1,�÷���2=��2,...
UPDATE STUDENTS
SET STUNO=0, STU_NAME='', EMAIL='', ADDRESS='', ENTER_DATE='', ETC='';


--delete (������ ����� ����) : delete from ���̺�� where �÷���1=��1 and �÷���2=��2,...
--						where ������ �࿡ ���� ����
DELETE FROM STUDENTS
WHERE STUNO=0 AND STU_NAME='' AND EMAIL='' AND ADDRESS='' AND ENTER_DATE='' AND ETC='';

