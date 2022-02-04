--제약 조건 DEFAULT 와 CHECK
--학생 테이블 생성
CREATE TABLE TBL_STUDENT(
	ID NUMBER,
	NAME VARCHAR2(100),
	MAJOR VARCHAR2(100),
	GENDER CHAR(1) DEFAULT 'W' NOT NULL CONSTRAINT BAN_CHAR CHECK(GENDER IN('M','W')),
	BIRTH DATE CONSTRAINT BAN_DATE CHECK(BIRTH >=TO_DATE('1980-01-01', 'YYYY-MM-DD')),
	CONSTRAINT STD_PK PRIMARY KEY (ID)
);

INSERT INTO TBL_STUDENT
(ID, NAME, MAJOR, GENDER, BIRTH)
VALUES(1, '김민우', '컴퓨터공학과', 'M' , TO_DATE('1997-07-22', 'YYYY-MM-DD'));


SELECT * FROM TBL_STUDENT;

INSERT INTO TBL_STUDENT
(ID, NAME, MAJOR, BIRTH)
VALUES(2,'홍길동','전자공학과',TO_DATE('2000-09-04','YYYY-MM-DD'));

TRUNCATE TABLE TBL_STUDENT;

