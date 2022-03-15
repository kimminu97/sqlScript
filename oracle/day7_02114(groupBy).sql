--�����Լ�(����Լ�,�׷��Լ�) : count,max,min,sum,avg�ܿ� �л�,ǥ������,�߾Ӱ� ���� �Լ��� ����

--group by : Ư�� Į������ �׷�ȭ�ϰ� �׿� ���ؼ� �����Լ��� �����մϴ�.
--����) �μ��� �������, ������ ������, �μ��� ������

--�׷��Լ� ����
SELECT COUNT(*), avg(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';
--���� : �׷��Լ� ����� �Ϥ����÷��� �Բ� ��ȸ ���մϴ�.
SELECT JOB_ID ,COUNT(*), avg(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';

--group by�� �����Ͽ� �������� count, avg ���մϴ�.
SELECT JOB_ID ,COUNT(*), avg(salary) FROM EMPLOYEES e group by JOB_ID ; 

--�μ��� count,avg (�׷��Լ� ����� �Բ� ��ȸ�Ҽ� �ִ� �÷��� �׷�ȭ �÷��� �����մϴ�.)
SELECT DEPARTMENT_ID ,COUNT(*) AS "�ο���",avg(salary) AS "���"
FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ; 

--departments ���̺�� ���� �μ��� ���踦 join -> �μ��� ��ȸ
SELECT DEPARTMENT_NAME  FROM DEPARTMENTS d join 
(SELECT DEPARTMENT_ID ,COUNT(*) AS "�ο���",avg(salary) AS "���"
FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) AS s
ON d.DEPARTMENT_ID = s.DEPARTMENT_ID  ;

SELECT d.DEPARTMENT_ID ,d.DEPARTMENT_NAME ,d2."�ο���",d2."���" FROM DEPARTMENTS d ,
(SELECT DEPARTMENT_ID ,COUNT(*) AS "�ο���",avg(salary) AS "���"
FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) d2
WHERE d.DEPARTMENT_ID = d2.department_id
ORDER BY d2."���";

--�ڸ��� ���� �Լ� : ���� trunc, �ø� ceil, �ݿø� round -> �Ҽ������� �ڸ��� ����

--���� group by ������� ��ձݾ��� 8000�̻��� �μ��� ��ȸ�Ѵٸ�
SELECT DEPARTMENT_ID ,COUNT(*) AS "�ο���",avg(salary) AS "���"
FROM EMPLOYEES e 
--WHERE e."���" > 8000		--���� : �����Լ� ��������� WHERE ��� x
GROUP BY DEPARTMENT_ID
HAVING avg(SALARY) > 8000 --HAVING : �����Լ� ��������� ���ǽ��� ���� ��밡���մϴ�.
ORDER BY "���";

--���� : from -> where -> GROUP by -> HAVING ->ORDER BY 

--ALL Ű���� : job_id �� ST_CLERK �� ��� �������� �޿����� ���� �޴� ������ ��ȸ
-- 			���� ����� max ������ ū���� ã�� �� -> ALL Ű����� �ٲ㺸��

--employees ���̺� ���� ������ ���� max������ ū�͸� ����� �����մϴ�.
SELECT last_name,salary,job_id FROM EMPLOYEES e 
WHERE SALARY >(SELECT max(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID='ST_CLERK');

--���� salary �÷����� �����ϰ� ���ǿ� �´� �͸� �����մϴ�.
SELECT last_name,salary,job_id FROM EMPLOYEES e 
WHERE SALARY >all(SELECT SALARY FROM EMPLOYEES e2 WHERE JOB_ID='ST_CLERK');


