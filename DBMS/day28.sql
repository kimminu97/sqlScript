--SCOTT ������ EMP���̺��� �����ؼ� �� �������� ��޺� ENAME, SAL �˻��ϱ�
CREATE TABLE EMP AS SELECT * FROM SCOTT.EMP;

SELECT * FROM EMP;
SELECT * FROM HR.EMP;
SELECT * FROM SALGRADE;

SELECT S."LEVEL", E.ENAME, E.SAL FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--HR ������ DEPT ���̺��� ����, ������ ���̺��� LOC�� ��� �޿� �˻�(��, LOC�� ��ΰ˻�)
CREATE TABLE COPY_DEPT AS SELECT * FROM HR.DEPT;
CREATE TABLE COPY_EMP AS SELECT * FROM HR.EMP;

SELECT LOC ����, NVL(AVG(E.SAL), 0) ��ձ޿� FROM COPY_DEPT D LEFT OUTER JOIN COPY_EMP E 
ON D.DEPTNO = E.DEPTNO 
GROUP BY LOC;

--VIEW
/*
* ������ ���̺��� �״�� ���� ä
* �ʿ��� �÷��� �� ���ο� �÷��� ���� ���� ���̺�.
* ���� �����Ͱ� ����Ǵ� ���� �ƴ�����
* VIEW�� ���ؼ� �����͸� ������ �� �ִ�.
* 
* ������ : �ٸ� ������ �������� ���ϵ���
* ���� : �� �������� ª��
* ���ȼ� : ª�� ����� ������ ������ ������ ������ �ʴ´�.
* 
*/
SELECT * FROM COPY_PLAYER;
CREATE VIEW PLAYER_AGE 
AS (SELECT ROUND((SYSDATE - BIRTH_DATE) / 365) AGE, P.* FROM COPY_PLAYER P)

SELECT * FROM PLAYER_AGE;

DROP VIEW PLAYER_AGE;

--30���� ���� ������ �˻�
SELECT * FROM PLAYER_AGE WHERE AGE > 30;

