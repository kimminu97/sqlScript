--hr 스키마의 테이블을 이용해서 프로시저 연습합니다.

SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d ;

--Sales 부서의 최고 연봉금액은?
SELECT max(SALARY) 
FROM  EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID =d.DEPARTMENT_ID AND d.DEPARTMENT_ID =80;

--위의 join으로 조회한 것을 프로시저로 할용해서 구하기
DECLARE
	dept_id departments.department_id %TYPE;
	max_sal NUMBER;		--데이터타입 크기 생략
	emp employees%rowtype;
BEGIN
	--sales 부서의 부서ID구하기
	SELECT DEPARTMENT_ID INTO dept_id --변수에 저장
	FROM DEPARTMENTS d WHERE DEPARTMENT_NAME ='Sales';
	-- 구해진 부서 ID로 직원테이블에서 최고 연봉금액 구하기
	SELECT max(salary) INTO max_sal	--변수에 저장
	FROM EMPLOYEES e WHERE DEPARTMENT_ID =dept_id;	--변수를 조건식에 활용
	dbms_output.put_line('최고 연봉금액(sales부서) : ' || max_sal);
	--추가 : sales 부서에서 최고연봉금액을 받는 직원의 정보구하기(행전체를 변수에 저장)
	SELECT * INTO emp --ROWtype 변수에 조회결과 모든 컬럼을 저장
	FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID =dept_id AND e.SALARY =max_sal;
	dbms_output.put_line ('Sales 최고연봉 직원 : ' || emp.last_name ||','||emp.hire_date);
END;
