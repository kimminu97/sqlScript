-- �������� : �ۼ��� ��ο�

--1. jobs ���̺� ����
--1) min_salary �÷��� 10000�̻��� job_title ��ȸ
SELECT JOB_TITLE FROM JOBS WHERE MIN_SALARY >= 10000;
--2)job_title �÷��� programmer�� ���� ��� �÷� ��ȸ
SELECT * FROM JOBS WHERE JOB_TITLE='Programmer';
--3)max_salary �÷��� �ִ밪 ��ȸ
SELECT MAX(max_salary) FROM JOBS;
--2. locations ���̺� ����
--1)city �ʵ尪�� London�� postal_code ��ȸ
SELECT postal_code FROM LOCATIONS WHERE CITY='London';
--2) location_id �÷��� 1700�̰� manager_id�� null�� �ƴ� department_name �÷� ��ȸ
SELECT department_name FROM LOCATIONS,DEPARTMENTS
WHERE Locations.LOCATION_ID=1700 AND departments.manager_id IS NOT NULL;
--3)location_id �÷��� 1700, 2700, 2500�� �ƴϰ� city �÷��� Tokyo�� ���� ��� �÷� ��ȸ
SELECT * FROM LOCATIONS WHERE LOCATION_ID NOT in(1700,2700,2500) AND CITY='Tokyo';

--����Լ��� �׷��Լ��Դϴ�. �ش��Լ� ������� ���ϱ����� ���� �����͵��� �׷�ȭ�ϰ� �����մϴ�.
--�׷��Լ� ����� �ٸ� �÷��� ���� ��ȸ�� �� �����ϴ�. �Ʒ� sql�� �����Դϴ�.
SELECT job_id, MAX(salary) FROM EMPLOYEES e;
--max,min ���� sql����� �ϳ��� ���⿡ �־����. �� �ǹ̸� �ľ��� ���ô�.
SELECT * FROM EMPLOYEES e2 WHERE SALARY =(
--SELECT MIN(SALARY)FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'
SELECT COUNT(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'
--SELECT MAX(SALARY)FROM EMPLOYEES e
);--select �ȿ� ���� �� �ٸ� select �� ���������Դϴ�. �������� ������� 1���̹Ƿ� = ���ǽĿ� ����� �� �ֽ��ϴ�.
--IT_PROG �߿��� �ּұ޿��� �޴� ����� first_name,last_name �÷� ��ȸ�ϱ�
SELECT first_name,last_name FROM EMPLOYEES 
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG')
AND JOB_ID = 'IT_PROG'; 

--min_salary �� ��հ����� ���� ���� job_id,job_title �÷� ��ȸ
-- �Ʒ� ����� ���� -> �׷��Լ��� �ݵ�� select ������ ����մϴ�.
--SELECT job_id,job_title FROM JOBS j WHERE MIN_SALARY < AVG(MIN_SALARY);
SELECT job_id, job_title FROM JOBS 
WHERE MIN_SALARY < (SELECT AVG(MIN_SALARY) FROM JOBS);