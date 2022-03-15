--view : 가상 테이블(물리적으로 존재하지 않고 논리적으로 만들어진 테이블)
--		ㄴ물리적인 테이블을 이용해서 생성합니다.
--		ㄴ 사용자(개발자)가 테이블처럼 select를 조회를 할수 있는 테이블
--		ㄴ grant resource,connect to idev; -> resource에 view 생성은 제외

CREATE VIEW v_buy
AS 
SELECT PCODE, CUSTOM_ID FROM tbl_buy#;	-- insufficient privileges

/* idev 유저에게 create view 권한 부여(sql*plus에서 실행하기)
 * SQL> connect system
Enter password:
Connected.
SQL> grant create view to idev;

Grant succeeded.
 */

--view를 이용한 select 조회
SELECT * FROM V_BUY vb WHERE PCODE ='dk_143';

--buy#, custom# 을 조인하고 coustom_id,pcode,name,이메일,구매수량,구매날짜
-- ㄴ v_sale 이름의 view 만드세요
CREATE VIEW v_sale 
AS
select tb.custom_id, pcode,name,email,quantity,buy_date FROM tbl_buy# tb
LEFT OUTER JOIN tbl_custom# tc ON tb.CUSTOM_ID =tc.CUSTOM_ID ;

DROP VIEW v_sale;

SELECT * FROM v_sale ;