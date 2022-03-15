--commit, rollback 테스트
-- ㄴ 디비버 auto commit 설정을 변경해야합니다.
-- ㄴ 방법1) 현재 편집기에 대해서만 변경(데이터베이스 메뉴-트랜잭션 모드 - manual commit)
-- ㄴ 방법2) 윈도우 메뉴 - 설정 - db연결 유형을 auto commit 을 해제

--실행 순서 1번
SELECT * FROM tbl#;	--현재 상태 확인

DELETE FROM tbl# WHERE acol='momo';
SELECT * FROM tbl#;	--확인

rollback ;	-- DELETE 명령을 원래로 되돌리기
SELECT * FROM tbl#;	--확인

--실행 순서 2번
DELETE FROM tbl# WHERE acol='momo';
SELECT * FROM tbl#;	--확인
commit ;
SELECT * FROM "TBL#" t ;
rollback ;		--위에서 COMMIT을 했으므로 DELETE 를 취소할 수 없음
SELECT * FROM tbl#;

--실행 순서 3번
INSERT INTO "TBL#" (acol,AGE) VALUES ('nana',33);
SELECT * FROM "TBL#" t ;
rollback ;
SELECT * FROM tbl#;

--실행 순서 4번
INSERT INTO "TBL#" (acol,AGE) VALUES ('nana22',33);
INSERT INTO "TBL#" (acol,AGE) VALUES ('쯔위',29);
commit ;	--최종 commit 또는 rollback 한 그 이후의 명령을 commit 
UPDATE "TBL#" SET bcol='test ' WHERE acol='nana22';
DELETE FROM tbl# WHERE acol ='main';
rollback ;	--최종 commit 또는 rollback 한 그 이후의 명령을 rollback 
SELECT * FROM tbl#;
