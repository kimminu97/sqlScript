-- 프로시저의 begin ~end ; 사이의 SQL 명령들이 여러개인 경우가 대부분 . 그 여러개의 명령어가 하나의 업무를 처리합니다.
--	트랜잭션 : 하나의 업무를 처리하는 SQL 명령들 -> 모두 정상실행되어야 합니다.(commit) 
--		그렇지 않으면 (하나라도 오류가 생기면) 이미 실행된 SQL명령은 취소가 되어야 합니다.(rollback)


SELECT * FROM "TBL_BUY#" tb ;
-- 오늘의 주제 : 프로시저로 트랜잭션 처리
-- tbl_buy# 테이블에 지불금액 money 컬럼을 추가하고 상품가격*수량 계산해서 저장
ALTER TABLE "TBL_BUY#" ADD money number(8);

--'결제금액' 구하기라는 트랜잭션이라 하고 예시로 하나씩 실행

--처리순서1 : wonder 고객이 CHR-J59를 2개를 구입합니다.
INSERT INTO "TBL_BUY#"(BUY_SEQ,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
values(TBL_BUY_SEQ.nextval,'wonder','CHR-J59',2,sysdate);
--처리순서2 : dual 임시테이블 이용해서 현재 seq값 구하기
SELECT tbl_buy_seq.currval FROM dual;	--nextval 실행후에만 확인 가능
--처리순서3 : 구매한 상품의 가격 구하기
SELECT price FROM "TBL_PRODUCT#" tp WHERE pcode='CHR-J59';
--처리순서4 : 처리순서1에서 추가된 행에 money 컬럼 계산하고 저장
UPDATE "TBL_BUY#" SET MONEY = 98700*QUANTITY WHERE BUY_SEQ =21;

--위의 트랜잭션을 프로시저로 생성(정의)
CREATE OR REPLACE PROCEDURE proc_set_money(
	acustom_id IN varchar2,
	apcode IN varchar2,
	acnt IN NUMBER, 
	issuccess OUT varchar2 --출력 매개변수
)
IS 
	vseq NUMBER;	--변수선언
	vprice NUMBER;
BEGIN 
	INSERT INTO tbl_test values(2,acustom_id);	--트랜잭션의 하나로 가정하고 임시테이블에 데이터 추가
	INSERT INTO "TBL_BUY#" (buy_seq,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
	VALUES (tbl_buy_seq.nextval,acustom_id,apcode,acnt,sysdate);	--매개변수값으로 추가
	SELECT tbl_buy_seq .currval INTO vseq FROM dual;
	SELECT price INTO vprice FROM "TBL_PRODUCT#" tp WHERE pcode=apcode;
	UPDATE "TBL_BUY#" SET money = vprice *QUANTITY WHERE BUY_SEQ =vseq;
	dbms_output.put_line('실행 성공');
	isSuccess := 'success';
	COMMIT;
	EXCEPTION 	-- EXCEPTION 추가하여 처리 -> 메시지 출력, rollback 
		WHEN OTHERS THEN 
		dbms_output.put_line('실행 실패');
		ROLLBACK;		--오류가 발생한 sql 앞의 insert,UPDATE,delete를 취소
		isSuccess := 'fail';
END;

--프로시저 실행
begin 
	proc_set_money ('twice','CJ-BABQ1',2);
--	proc_set_money ('twice','C-BABQ1',4);	--오류발생(참조관계 컬럼에 잘못된 값), 실행실패 출력
	
END;
SELECT * FROM "TBL_BUY#" tb ;

CREATE TABLE tbl_test(	--트랜잭션을 테스트할 테이블
	buy_seq number(8),
	custom_id varchar2(20)
);

SELECT * FROM TBL_TEST tt;
