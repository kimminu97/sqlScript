-- DML : SELECT, INSERT, UPDATE, DELETE 형식 알아보기

--SELECT(데이터 조회) : select 컬럼명1,컬럼명2,...from 테이블명
SELECT STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC
FROM STUDENTS;

--선택되는 컬럼은 필요한 것들로 합니다. 명령어 한개실행은 ctrl+enter
SELECT stuno,stu_name FROM STUDENTS;

--모든 컬럼을 선택할 때는 wildcard 문자 *로 대체
SELECT * FROM STUDENTS;

--데이터 조회에 사용되는 조건 추가는 where 뒤에 조건식 작성
SELECT * FROM STUDENTS WHERE STUNO=1;
SELECT * FROM STUDENTS WHERE STU_NAME='최나나';
SELECT * FROM STUDENTS WHERE ENTER_DATE > '2020-06-01';

--null 값 데이터를 조회하는 조건식
SELECT stuno,stu_name,enter_date, etc FROM STUDENTS WHERE ETC IS NULL;
SELECT stuno,stu_name,enter_date, etc FROM STUDENTS WHERE ETC IS NOT NULL;

--데이터 조회 할때 컬럼명 대신에 함수(count,sum,avg,max,min)를 사용
SELECT COUNT(*) FROM STUDENTS;
SELECT max(stuno) FROM STUDENTS s;	--s는 별칭(alias)
SELECT MIN(stuno) FROM STUDENTS s;

SELECT MAX(stu_name) FROM STUDENTS;	--문자열타입의 칼럼은 사전식 비교하여 결과값 구함
SELECT MIN(stu_name) FROM STUDENTS;

--데이터 조회 조건식이 IN, 또는 not in : or 조건식으로 여러개 값을 사용할때
SELECT * FROM STUDENTS s WHERE STUNO = 1 OR STUNO =3;
SELECT * FROM STUDENTS s WHERE STUNO IN(1,3);	-- 동일한 컬럼에 대해 여러개 값을 OR조건검사

--INSERT(데이터 추가) : insert into 테이블명 (컬럼명1,컬럼명2,...)values(값1,값2,...)
INSERT INTO STUDENTS
(STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC)
VALUES(0, '', '', '', '', '');

--update(데이터 수정) : update 테이블명 set 컬럼명1=값1,컬럼명2=값2,...
UPDATE STUDENTS
SET STUNO=0, STU_NAME='', EMAIL='', ADDRESS='', ENTER_DATE='', ETC='';


--delete (데이터 행단위 삭제) : delete from 테이블명 where 컬럼명1=값1 and 컬럼명2=값2,...
--						where 삭제할 행에 대한 조건
DELETE FROM STUDENTS
WHERE STUNO=0 AND STU_NAME='' AND EMAIL='' AND ADDRESS='' AND ENTER_DATE='' AND ETC='';

