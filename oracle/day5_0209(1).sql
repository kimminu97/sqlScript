--등가 조인 형식1
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
		WHERE tp.PCODE =tb.PCODE ;		
	
--동등 조인 형식2(표준)
SELECT * FROM "TBL_PRODUCT#" tp 
		JOIN "TBL_BUY#" tb 
		ON tp.PCODE =tb.PCODE ;
		
--복습 : 아이패드('IPAD011')를 구매한 사용자 이름과 구매날짜 조회
SELECT name, buy_date FROM "TBL_BUY#" tb 
JOIN "TBL_CUSTOM#" tc ON tb.CUSTOM_ID =tc.CUSTOM_ID AND PCODE ='IPAD011';

--day5 : ALTER table 형식

CREATE TABLE tbl#(
	acol varchar2(30) NOT NULL,
	bcol varchar2(10),
	ccol NUMBER(3)
);

INSERT INTO tbl#(ccol) VALUES (12);		--오류 : NOT NULL 컬럼 값이 저장안됨
INSERT INTO tbl#(bcol,ccol) VALUES ('xytz',12);	--오류 : NOT NULL 컬럼 값이 저장안됨
INSERT INTO tbl#(acol,ccol) VALUES ('main',12); --정상실행

--컬럼 추가
ALTER TABLE "TBL#" ADD (dcol timestamp DEFAULT sysdate);
SELECT * FROM "TBL#" t ;

--컬럼 변경
ALTER TABLE tbl# MODIFY (ccol NUMBER(3) DEFAULT '0');
INSERT INTO tbl#(acol) VALUES ('main');

--컬럼 제거(drop)
ALTER TABLE tbl# DROP COLUMN dcol;

--제약조건 추가(제약조건 이름 지정 필요)
ALTER TABLE "TBL#" ADD CONSTRAINT pk_tbl# PRIMARY KEY (acol);
--중복값이 있는 경우 (무결성 위반) 중복되는 행을 삭제하고 기본키 추가 합니다.

--기존 제약조건은 변경 명령 없습니다.(drop하고 다시 생성)
ALTER TABLE "TBL#" DROP CONSTRAINT pk_tbl #;

--tbl# 테이블에 age 컬럼을 생성합니다. check 제약조건 : 16이상 90이하의 값(조건식)
ALTER TABLE "TBL#" ADD age number(3) CHECK (age BETWEEN 16 AND 90);
INSERT into tbl#(acol,age) values('app',23);	--실행
INSERT into tbl#(acol,age) values('apps',26);	--실행
INSERT into tbl#(acol,age) values('app',99);	--오류

--tbl# 테이블에 gender 컬럼을 생성합니다. check 제약조건 : 'M','F' 값만 허용합니다.
ALTER TABLE tbl# ADD gender char(1) CHECK (gender IN('M','F'));
INSERT INTO tbl# (acol,gender) VALUES ('momo','F');
INSERT INTO tbl# (acol,gender) VALUES ('momo2','X');	--제약 조건 위반 오류

--SELECT 에 사용하는 오라클 함수
--조회결과를 조작하는 함수 : 예시 age 컬럼 값이 null일때 0, gender 'M'이면 여성,'F'이면 남성
SELECT * FROM tbl#;
SELECT acol,nvl(age,0) AS age2, decode (gender,'M','남성','F','여성')  gender2
FROM tbl#;
--nvl은 null value, 컬럼명의 별칭은 as키워드를 씁니다. 생략도 가능

--drop table 
DROP TABLE tbl222#;