--commit, rollback �׽�Ʈ
-- �� ���� auto commit ������ �����ؾ��մϴ�.
-- �� ���1) ���� �����⿡ ���ؼ��� ����(�����ͺ��̽� �޴�-Ʈ����� ��� - manual commit)
-- �� ���2) ������ �޴� - ���� - db���� ������ auto commit �� ����

--���� ���� 1��
SELECT * FROM tbl#;	--���� ���� Ȯ��

DELETE FROM tbl# WHERE acol='momo';
SELECT * FROM tbl#;	--Ȯ��

rollback ;	-- DELETE ����� ������ �ǵ�����
SELECT * FROM tbl#;	--Ȯ��

--���� ���� 2��
DELETE FROM tbl# WHERE acol='momo';
SELECT * FROM tbl#;	--Ȯ��
commit ;
SELECT * FROM "TBL#" t ;
rollback ;		--������ COMMIT�� �����Ƿ� DELETE �� ����� �� ����
SELECT * FROM tbl#;

--���� ���� 3��
INSERT INTO "TBL#" (acol,AGE) VALUES ('nana',33);
SELECT * FROM "TBL#" t ;
rollback ;
SELECT * FROM tbl#;

--���� ���� 4��
INSERT INTO "TBL#" (acol,AGE) VALUES ('nana22',33);
INSERT INTO "TBL#" (acol,AGE) VALUES ('����',29);
commit ;	--���� commit �Ǵ� rollback �� �� ������ ����� commit 
UPDATE "TBL#" SET bcol='test ' WHERE acol='nana22';
DELETE FROM tbl# WHERE acol ='main';
rollback ;	--���� commit �Ǵ� rollback �� �� ������ ����� rollback 
SELECT * FROM tbl#;
