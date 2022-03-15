--프로시저를 오라클 객체로 생성하면 호출해서 다시 실행할 수 있습니다.
/* 기본 형식
 * CREATE OR REPLACE procedure dept_max_salary(
 * 
 * )
 * is
 * 
 * begin
 * 
 * end
 */


--프로시저를 생성할 때 create : 없으면 만들기. replace : 있으면 대체하기
CREATE OR REPLACE PROCEDURE dept_max_salary(
	--매개변수를 선언하는 위치 : in은 입력 매개변수로 실행할 때 전달되는 값을 저장하는 변수
	dept_name IN departments.DEPARTMENT_NAME%TYPE :=''	--대입문 :=으로 초기화
)
IS 
	--필요한 변수를 선언하는 위치
	dept_id departments.department_id %TYPE;
	max_sal NUMBER;		--데이터타입 크기 생략
	emp employees%rowtype;
BEGIN 
	--sales 부서의 부서ID구하기
	SELECT DEPARTMENT_ID INTO dept_id --변수에 저장
	FROM DEPARTMENTS d WHERE DEPARTMENT_NAME =dept_name;	--입력매개변수 대입해서 실행
	-- 구해진 부서 ID로 직원테이블에서 최고 연봉금액 구하기
	SELECT max(salary) INTO max_sal	--변수에 저장
	FROM EMPLOYEES e WHERE DEPARTMENT_ID =dept_id;	--변수를 조건식에 활용
	dbms_output.put_line(dept_name||'최고 연봉금액 : ' || max_sal);
	--추가 : sales 부서에서 최고연봉금액을 받는 직원의 정보구하기(행전체를 변수에 저장)
	SELECT * INTO emp --ROWtype 변수에 조회결과 모든 컬럼을 저장
	FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID =dept_id AND e.SALARY =max_sal;
	dbms_output.put_line (dept_name||'최고연봉 직원 : ' || emp.last_name ||','||emp.hire_date);
END;

EXEC dept_max_salary('Sales');
BEGIN
	dept_max_salary('Sales');
END;

SELECT * FROM EMPLOYEES e ;

--일반 join sql
select d.department_id id, d.department_name dept , max_sal from departments d,
        (select DEPARTMENT_ID id, max(salary) max_sal
        from employees 
        GROUP by DEPARTMENT_ID) max_sal# 
    where d.DEPARTMENT_ID = max_sal#.id AND d.DEPARTMENT_NAME ='Sales';

   --부서별 최고연봉
   select DEPARTMENT_ID, max(salary) max_sal
        from employees 
        GROUP by DEPARTMENT_ID 
        HAVING DEPARTMENT_ID=80;

CREATE OR REPLACE PROCEDURE dept_max_salary2(
	dept_name IN hr.departments.DEPARTMENT_NAME%TYPE,
	--출력 매개변수
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
 INTO dept_id,max_sal 	 --조회 결과를 출력 매개변수에 저장
        from employees 
        GROUP by DEPARTMENT_ID 
        HAVING DEPARTMENT_ID=vdept_id;
END;

--실행할 때 출력 매개 변수를 선언해야 합니다
DECLARE
	dept_id departments.department_id%TYPE;
	max_sal NUMBER;
begin 
	dept_max_salary2 ('Sales',dept_id,max_sal);
dbms_output.put_line ('부서코드'||' : ' || dept_id  ||',연봉금액'||max_sal);
END;

 




