--ROLE : ������ �����ִ� (�� �ִ�) ����
--CONNECT, RESOUCE, DBA
--GRANT ���Ѹ�(ROLE �̸�), ���Ѹ�2... TO ������
--REVOKE ���Ѹ�(ROLE �̸�) FROM ������

--A��� ������ ���̺� DML�� ����ϱ� ���ؼ��� A�������� ������ �ο��޾ƾ� �Ѵ�.
CREATE TABLE COPY_PLAYER AS SELECT * FROM HR.PLAYER;
SELECT * FROM COPY_PLAYER CP JOIN HR.TEAM T
ON CP.TEAM_ID = T.TEAM_ID;

--SCOTT ���̺��� SALGRADE�� ������ �� GRADE �÷����� LEVEL�� ����, ���� �ݴ�� �ٲٱ�
-- 5 -> 1
-- 4 -> 2
-- ...
-- 1 -> 5
CREATE TABLE SALGRADE AS SELECT * FROM SCOTT.SALGRADE;
SELECT * FROM SALGRADE;
ALTER TABLE SALGRADE RENAME COLUMN GRADE TO "LEVEL";

--5 4 3 2 1
--1 2 3 4 5
UPDATE SALGRADE
SET "LEVEL" = 6 - "LEVEL";