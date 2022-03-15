--���ν����� ����Ŭ ��ü�� �����ϸ� ȣ���ؼ� �ٽ� ������ �� �ֽ��ϴ�.
/* �⺻ ����
 * CREATE OR REPLACE procedure dept_max_salary(
 * 
 * )
 * is
 * 
 * begin
 * 
 * end
 */


--���ν����� ������ �� create : ������ �����. replace : ������ ��ü�ϱ�
CREATE OR REPLACE PROCEDURE dept_max_salary(
	--�Ű������� �����ϴ� ��ġ : in�� �Է� �Ű������� ������ �� ���޵Ǵ� ���� �����ϴ� ����
	dept_name IN departments.DEPARTMENT_NAME%TYPE :=''	--���Թ� :=���� �ʱ�ȭ
)
IS 
	--�ʿ��� ������ �����ϴ� ��ġ
	dept_id departments.department_id %TYPE;
	max_sal NUMBER;		--������Ÿ�� ũ�� ����
	emp employees%rowtype;
BEGIN 
	--sales �μ��� �μ�ID���ϱ�
	SELECT DEPARTMENT_ID INTO dept_id --������ ����
	FROM DEPARTMENTS d WHERE DEPARTMENT_NAME =dept_name;	--�Է¸Ű����� �����ؼ� ����
	-- ������ �μ� ID�� �������̺��� �ְ� �����ݾ� ���ϱ�
	SELECT max(salary) INTO max_sal	--������ ����
	FROM EMPLOYEES e WHERE DEPARTMENT_ID =dept_id;	--������ ���ǽĿ� Ȱ��
	dbms_output.put_line(dept_name||'�ְ� �����ݾ� : ' || max_sal);
	--�߰� : sales �μ����� �ְ����ݾ��� �޴� ������ �������ϱ�(����ü�� ������ ����)
	SELECT * INTO emp --ROWtype ������ ��ȸ��� ��� �÷��� ����
	FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID =dept_id AND e.SALARY =max_sal;
	dbms_output.put_line (dept_name||'�ְ��� ���� : ' || emp.last_name ||','||emp.hire_date);
END;

EXEC dept_max_salary('Sales');
BEGIN
	dept_max_salary('Sales');
END;

SELECT * FROM EMPLOYEES e ;

--�Ϲ� join sql
select d.department_id id, d.department_name dept , max_sal from departments d,
        (select DEPARTMENT_ID id, max(salary) max_sal
        from employees 
        GROUP by DEPARTMENT_ID) max_sal# 
    where d.DEPARTMENT_ID = max_sal#.id AND d.DEPARTMENT_NAME ='Sales';

   --�μ��� �ְ���
   select DEPARTMENT_ID, max(salary) max_sal
        from employees 
        GROUP by DEPARTMENT_ID 
        HAVING DEPARTMENT_ID=80;

CREATE OR REPLACE PROCEDURE dept_max_salary2(
	dept_name IN hr.departments.DEPARTMENT_NAME%TYPE,
	--��� �Ű�����
	dept_id OUT hr.departments .department_id%TYPE ,
	max_sal OUT NUMBER 
)
IS 
	vdept_id NUMBER ;
BEGIN 
	select d.department_id id 
	INTO vdept_id 
	from departments d
	WHERE d.DEPARTMENT_NAME ='Sales';
 select DEPARTMENT_ID, max(salary)
 INTO dept_id,max_sal 	 --��ȸ ����� ��� �Ű������� ����
        from employees 
        GROUP by DEPARTMENT_ID 
        HAVING DEPARTMENT_ID=vdept_id;
END;

--������ �� ��� �Ű� ������ �����ؾ� �մϴ�
DECLARE
	dept_id departments.department_id%TYPE;
	max_sal NUMBER;
begin 
	dept_max_salary2 ('Sales',dept_id,max_sal);
dbms_output.put_line ('�μ��ڵ�'||' : ' || dept_id  ||',�����ݾ�'||max_sal);
END;

 




