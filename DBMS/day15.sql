--PLAYER ���̺��� TEAM_ID�� 'K01'�� ���� �̸��� �� �̸����� �ٲٱ�
UPDATE PLAYER
SET PLAYER_NAME = '��ο�'
WHERE TEAM_ID = 'K01';

SELECT * FROM PLAYER
WHERE TEAM_ID = 'K01';

--PLAYER ���̺��� POSITION�� 'MF'�� ���� �����ϱ�
DELETE FROM PLAYER
WHERE "POSITION" = 'MF';

SELECT * FROM PLAYER
WHERE "POSITION" = 'MF';

--PLAYER ���̺��� HEIGHT�� 180�̻��� ���� �����ϱ�
DELETE FROM PLAYER
WHERE HEIGHT >= 180;

SELECT * FROM PLAYER
WHERE HEIGHT >= 180;

--AS(ALIAS) : ��Ī
--SELECT�� : AS �ڿ� ��Ī �ۼ� Ȥ�� �� ĭ ���� �ۼ� 
--FROM�� : �� ĭ ���� �ۼ�

SELECT PLAYER_ID AS ������ȣ FROM PLAYER;
SELECT PLAYER_ID "���� ��ȣ" FROM PLAYER;
SELECT PLAYER_ID "���� ��ȣ", PLAYER_NAME "���� �̸�" FROM PLAYER;

--PLAYER ���̺��� BACK_NUM�� "�� ��ȣ", NICKNAME�� "���� ����"���� �ٲ㼭 �˻�
SELECT BACK_NO AS "�� ��ȣ", NICKNAME "���� ����" FROM PLAYER;


SELECT PLAYER.TEAM_ID, TEAM.TEAM_ID FROM PLAYER, TEAM;
SELECT P.TEAM_ID "���� ���̺�", T.TEAM_ID "�� ���̺�" FROM PLAYER P, TEAM T;