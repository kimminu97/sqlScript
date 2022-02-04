-- 연습문제 : 작성자 김민우

--1. jobs 테이블 문제
--1) min_salary 컬럼이 10000이상인 job_title 조회
SELECT JOB_TITLE FROM JOBS WHERE MIN_SALARY >= 10000;
--2)job_title 컬럼이 programmer인 행의 모든 컬럼 조회
SELECT * FROM JOBS WHERE JOB_TITLE='Programmer';
--3)max_salary 컬럼의 최대값 조회
SELECT MAX(max_salary) FROM JOBS;
--2. locations 테이블 문제
--1)city 필드값이 London인 postal_code 조회
SELECT postal_code FROM LOCATIONS WHERE CITY='London';
--2) location_id 컬럼이 1700이고 manager_id가 null이 아닌 department_name 컬럼 조회
SELECT department_name FROM LOCATIONS,DEPARTMENTS
WHERE Locations.LOCATION_ID=1700 AND departments.manager_id IS NOT NULL;
--3)location_id 컬럼이 1700, 2700, 2500이 아니고 city 컬럼이 Tokyo인 행의 모든 컬럼 조회
SELECT * FROM LOCATIONS WHERE LOCATION_ID NOT in(1700,2700,2500) AND CITY='Tokyo';

--통계함수는 그룹함수입니다. 해당함수 결과값을 구하기위해 여러 데이터들을 그룹화하고 실행합니다.
--그룹함수 결과와 다른 컬럼을 같이 조회할 수 없습니다. 아래 sql은 오류입니다.
SELECT job_id, MAX(salary) FROM EMPLOYEES e;
--max,min 구한 sql명령을 하나씩 여기에 넣어보세요. 그 의미를 파악해 봅시다.
SELECT * FROM EMPLOYEES e2 WHERE SALARY =(
--SELECT MIN(SALARY)FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'
SELECT COUNT(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'
--SELECT MAX(SALARY)FROM EMPLOYEES e
);--select 안에 쓰인 또 다른 select 는 서브쿼리입니다. 서브쿼리 결과값이 1개이므로 = 조건식에 사용할 수 있습니다.
--IT_PROG 중에서 최소급여를 받는 사람의 first_name,last_name 컬럼 조회하기
SELECT first_name,last_name FROM EMPLOYEES 
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG')
AND JOB_ID = 'IT_PROG'; 

--min_salary 의 평균값보다 작은 행의 job_id,job_title 컬럼 조회
-- 아래 명령은 오류 -> 그룹함수는 반드시 select 문으로 사용합니다.
--SELECT job_id,job_title FROM JOBS j WHERE MIN_SALARY < AVG(MIN_SALARY);
SELECT job_id, job_title FROM JOBS 
WHERE MIN_SALARY < (SELECT AVG(MIN_SALARY) FROM JOBS);