--PL/SQL : Proceduer(����,����),������ �ܼ��� SQL�� Ȯ��� ���
--			����,���(if,�ݺ���)�� ����Ͽ� ���α׷��� ���� ���� sql������ �帧�� ����

--���ν��� �⺻����
DECLARE 	--��������
--	vcustomid varchar2(20);
--	vage number(3,0);
	vcustomid tbl_custom#.custom_id  %TYPE;	--���̺��.�÷������� ������ Ÿ�԰� �����մϴ�.
	vage tbl_custom#.age %TYPE ;
BEGIN 		--���ν��� ����
	--���ν��� ���ο��� �ַ� DML ��ɹ��� �ۼ�(�Բ� �����ؾ��� ���� sql: Ʈ�����)
	SELECT custom_id,age
	INTO vcustomid, vage 	--���ν��� ���� : �˻������ ������ ����
	FROM "TBL_CUSTOM#" tc 
	WHERE CUSTOM_ID ='mina012';	--1�� �ุ ��� ��ȸ�Ǵ� ����
	--	�������� �ֿܼ� ���
	DBMS_OUTPUT.PUT_LINE('������ : ' || vcustomid);
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION
	WHEN no_data_found THEN	--���� �̸��� �پ��մϴ�.OTHERS ���ܴ� ��� ���
		dbms_output.put_line('ã�� �����Ͱ� �����ϴ�.');
END	;		--��