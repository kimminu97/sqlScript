--JOBS테이블에 INSERT해주는 함수 만들기
SELECT * FROM JOBS;

CREATE OR REPLACE PROCEDURE MY_NEW_JOB_PROC
(
	P_JOB_ID IN JOBS.JOB_ID%TYPE,
	P_JOB_TITLE IN JOBS.JOB_TITLE%TYPE,
	P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE,
	P_MAX_SALARY IN JOBS.MAX_SALARY%TYPE
)
IS
BEGIN
		INSERT INTO JOBS(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
		VALUES(P_JOB_ID, P_JOB_TITLE, P_MIN_SALARY, P_MAX_SALARY);
		DBMS_OUTPUT.ENABLE;
		DBMS_OUTPUT.PUT_LINE('ALL DONE ABOUT'||' '||P_JOB_ID);
END;

CALL MY_NEW_JOB_PROC('IT', 'Developer', 14000, 20000);

--PL/SQL문
--점수에 맞는 학점 출력하기
DECLARE
	SCORE NUMBER := 80;
	GRADE VARCHAR2(5);
BEGIN
	IF SCORE >= 90 THEN GRADE := 'A';
	ELSIF SCORE >=80 THEN GRADE :='B';
	ELSIF SCORE >=70 THEN GRADE := 'C';
	ELSIF SCORE >=60 THEN GRADE := 'D';
	ELSE GRADE := 'F';
	END IF;
	DBMS_OUTPUT.ENABLE;
		DBMS_OUTPUT.PUT_LINE('당신의 점수: '||SCORE||'점'||CHR(10)||'학점: '||GRADE);
END;



