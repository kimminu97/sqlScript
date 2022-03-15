--hr ��Ű���� ���̺��� �̿��ؼ� ���ν��� �����մϴ�.

SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d ;

--Sales �μ��� �ְ� �����ݾ���?
SELECT max(SALARY) 
FROM  EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID =d.DEPARTMENT_ID AND d.DEPARTMENT_ID =80;

--���� join���� ��ȸ�� ���� ���ν����� �ҿ��ؼ� ���ϱ�
DECLARE
	dept_id departments.department_id %TYPE;
	max_sal NUMBER;		--������Ÿ�� ũ�� ����
	emp employees%rowtype;
BEGIN
	--sales �μ��� �μ�ID���ϱ�
	SELECT DEPARTMENT_ID INTO dept_id --������ ����
	FROM DEPARTMENTS d WHERE DEPARTMENT_NAME ='Sales';
	-- ������ �μ� ID�� �������̺��� �ְ� �����ݾ� ���ϱ�
	SELECT max(salary) INTO max_sal	--������ ����
	FROM EMPLOYEES e WHERE DEPARTMENT_ID =dept_id;	--������ ���ǽĿ� Ȱ��
	dbms_output.put_line('�ְ� �����ݾ�(sales�μ�) : ' || max_sal);
	--�߰� : sales �μ����� �ְ����ݾ��� �޴� ������ �������ϱ�(����ü�� ������ ����)
	SELECT * INTO emp --ROWtype ������ ��ȸ��� ��� �÷��� ����
	FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID =dept_id AND e.SALARY =max_sal;
	dbms_output.put_line ('Sales �ְ��� ���� : ' || emp.last_name ||','||emp.hire_date);
END;
