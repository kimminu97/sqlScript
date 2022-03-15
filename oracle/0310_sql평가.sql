--1)

CREATE SEQUENCE tblbuy_seq START WITH 2001;

-- CREATE SEQUENCE tblbuy_seq MINVALUE 2001;


--2)
CREATE TABLE tbl_postcode (
postcode char(5) PRIMARY KEY,
area1 varchar2(200) NOT NULL 
);

--3)
ALTER TABLE "TBL_CUSTOM#" ADD (postcode char(5) );

 

--4)
ALTER TABLE "TBL_CUSTOM#" ADD CONSTRAINTS fk_postcode
FOREIGN KEY (postcode) REFERENCES tbl_postcode(postcode);


--1)
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('137964','서울특별시 서초구 서초2동');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('138761','서울특별시 송파구 장지동 409880');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('412510','경기도 고양시 덕양구 벽제동');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('409880','인천광역시 옹진군 자월면');

--2)
UPDATE "TBL_CUSTOM#" SET POSTCODE ='137964' WHERE CUSTOM_ID ='mina012';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='412510' WHERE CUSTOM_ID ='hongGD';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='409880' WHERE CUSTOM_ID ='wonder';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='138761' WHERE CUSTOM_ID ='sana';

--3월 14일 평가 데이터 입출력 구현 : 논리적/물리적 설계 분석
--1. ER다이어그램을 보고 데이터 저장소 설계를 설명합니다.
--	1)데이터 타입:number(n,m) : n의 의미,m의 의미 예시) number(5,0)을 설명 n:저장될 숫자의 최대 전체 자리수,
--																m:소수점 이하 자리수
--char(n):고정길이 문자열 저장n<=2000byte,varchar2(n):가변길이 문자열 저장, 문자열의 길이가 n byte 범위 내에서 제한없음
--한글과 영문의 차이 : , date 타입
--	2)기본키 컬럽 : 기본키 컬럼의 의미를 작성하고 예시로 설명. tbl_custom#테이블에서 기본키 custom_id로 했을때
--				기본키 컬럼을 값으로 행을 구별할 수 있다. 그래서 custom_id컬럼의 값은 중복된 값이면 안됩니다.
--				시퀀스를 기본키로 사용한 경우는 그 이유도 설명. 기본키는 unique 컬럼이어야하는데 만족하는 컬럼이 없으므로
--				별도로 일련번호를 부여합니다. 기본키는 여러개 컬럼을 묶어서(custom_id,pcode)과 같이 설정할수 있음
--				그러나 여기서는 (custom_id,pcode)도 unique조건을 만족하지 않아 시퀀스로 기본키 설정
--	3)unique 제약조건 : unique 는 유일한 값. 즉 중복된 값은 허용하지 않는 컬럼
--	4) 참조관계 외래키 제약조건: 모든 관계에 대해 설명 
--						ㄴ 키워드 : 참조,참조컬럼
--						ㄴ on delete 조건

--2. 프로시저 생성(정의) 하고 실행하기 (명령 코드를 제출)
--1) insert,update,delete 트랜잭션 제어 : return_book
--2) ?? select 로 하는 예제를 도서대여 테이블을 대상으로 필요한 조회를 실행하는 프로시저
--		입력매개변수 1개이상, 출력매개변수 1개이상(단, 회원 1명이 하루에 1권의 책만 대여한다는 조건)
--		select 결과가 1개행이 조회되는 경우만을 예제로 해야합니다.

--3. 2번의 1) 또는 2)을 java jdbc로 프로그래밍합니다.(반납하는 책과 날짜를 키보드 입력으로 처리하기)
--	ㄴ> 토요일 저녁 8시까지 구글드라이브에 작성해서 제출
--		ㄴ> 제출폴더에 정답파일을 올려주겠습니다.