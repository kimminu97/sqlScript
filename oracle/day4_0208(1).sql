--UPDATE 형식
--UPDATE 테이블명
--SET 수정할 컬럼=값 을 ,로 구분해서 나열
--WHERE 수정할 행에대한 조건식

SELECT * FROM "TBL_CUSTOM#" tc ;

--UPDATE 와 delete는 where 조건식이 사용되는 것이 안전합니다.
UPDATE "TBL_CUSTOM#" SET age=39
WHERE CUSTOM_ID ='twice';	--기본키 컬럼을 사용하여 특정 1개만 수정합니다.

UPDATE "TBL_CUSTOM#" SET age =23, EMAIL ='nana@korea.kr'
WHERE CUSTOM_ID ='wonder';

--custom_id : wonder 와 twice 에 대해 reg_date를 22년2월5일로 변경
UPDATE "TBL_CUSTOM#" SET REG_DATE ='2022-02-05'
WHERE CUSTOM_ID IN ('wonder','twice');	--IN연산은 OR대체

--DELETE 형식
--delete from 테이블명 where 조건식;
SELECT * FROM "TBL_BUY#" tb;
SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM "TBL_CUSTOM#" tc ;

--삭제를 위한 샘플데이터 추가 
INSERT INTO "TBL_PRODUCT#" (pcode,CATEGORY,PNAME,PRICE)
VALUES ('GAL0112','A1','갤럭시',912300);

DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE ='GAL0112'; --실행 : BUY#에서 참조하지 않는값
DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE ='IPAD011'; --오류 :무결성 위배

UPDATE "TBL_PRODUCT#" SET PNAME = '아이패드프로'
WHERE PCODE = 'IPAD011'; --정상 실행

UPDATE "TBL_PRODUCT#" SET PCODE = 'IPAD0111'
WHERE PCODE = 'IPAD011'; --오류 : BUY#에서 참조하는 값(무결성 위배)

--ON DELETE , ON UPDATE(oracle은 안됨) 속성 변경하여 외래키 다시 생성
ALTER TABLE IDEV."TBL_BUY#" DROP CONSTRAINT FK_TBL_PRODUCT#;
ALTER TABLE IDEV."TBL_BUY#" ADD CONSTRAINT "FK_TBL_PRODUCT#" 
		FOREIGN KEY (PCODE) 
		REFERENCES IDEV."TBL_PRODUCT#"(PCODE) 
		ON DELETE CASCADE; --무결성을 위해서 참조하는값 삭제시 참조한는 행도 연쇄적으로 삭제
--ALTER TABLE 형식 : DROP,ADD,MODIFY(제약조건은 못합니다)

-- SELECT 의 JOIN : 둘 이상의 테이블(주로 참조관계의 테이블)을 연결하여 데이터를 조회하는 명령
--					둘 이상의 테이블은 공통된 컬럼을 갖고 이 컬럼을 이용하여 JOIN합니다.
--형식 : SELECT ~~~FROM 테이블1 a,테이블2 b 
--		where a.공통컬럼1=b.공통컬럼1;
		
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
		WHERE tp.PCODE =tb.PCODE ;		--등가 조인
	
--join을 쓰는 명령문 형식(표준)
SELECT * FROM "TBL_PRODUCT#" tp 
		JOIN "TBL_BUY#" tb 
		ON tp.PCODE =tb.PCODE ;
	
--mina012가 구매한 상품명은 무엇인가?
SELECT PNAME  FROM "TBL_PRODUCT#" tp 
		JOIN "TBL_BUY#" tb 
		ON tp.PCODE =tb.PCODE AND custom_id ='mina012';
--mina012가 구매한 상품명과 가격 조회하기
SELECT PNAME, PRICE  FROM "TBL_PRODUCT#" tp 
		JOIN "TBL_BUY#" tb 
		ON tp.PCODE =tb.PCODE AND custom_id ='mina012';

--조인할때, 공통된 컬럼은 테이블명을 꼭 지정해야합니다.
SELECT PNAME, tp.PCODE  FROM "TBL_PRODUCT#" tp 
		JOIN "TBL_BUY#" tb 
		ON tp.PCODE =tb.PCODE AND custom_id ='mina012';
	
--외부조인 형식 2가지
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
		WHERE tp.PCODE =tb.PCODE(+) ;		--외부 조인
	
SELECT * FROM "TBL_PRODUCT#" tp 
		LEFT OUTER JOIN "TBL_BUY#" tb --기준이 되는 테이블은 왼쪽 product#
		ON tp.PCODE =tb.PCODE ;
	
SELECT * FROM "TBL_BUY#" tp 
		RIGHT OUTER JOIN "TBL_PRODUCT#" tb --기준이 되는 테이블은 오른쪽 product#
		ON tp.PCODE =tb.PCODE ;
	

	
--데이터 테스트 또는 데이터 관리를 위해 테이블의 모든 데이터 삭제하기
--DELETE : rollback으로 삭제 취소 가능. truncate : 삭제 취소 불가능
--truncate : 참조관계일 때, fk를 비활성화하고 데이터를 삭제해야합니다.
TRUNCATE TABLE "TBL_BUY#" ;		--참조테이블 데이터 먼저 삭제
DELETE FROM "TBL_PRODUCT#" ;	--전체 데이터
TRUNCATE TABLE "TBL_CUSTOM#" ;	--오류

