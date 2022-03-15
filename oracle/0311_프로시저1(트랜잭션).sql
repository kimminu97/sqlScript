-- ���ν����� begin ~end ; ������ SQL ��ɵ��� �������� ��찡 ��κ� . �� �������� ��ɾ �ϳ��� ������ ó���մϴ�.
--	Ʈ����� : �ϳ��� ������ ó���ϴ� SQL ��ɵ� -> ��� �������Ǿ�� �մϴ�.(commit) 
--		�׷��� ������ (�ϳ��� ������ �����) �̹� ����� SQL����� ��Ұ� �Ǿ�� �մϴ�.(rollback)


SELECT * FROM "TBL_BUY#" tb ;
-- ������ ���� : ���ν����� Ʈ����� ó��
-- tbl_buy# ���̺� ���ұݾ� money �÷��� �߰��ϰ� ��ǰ����*���� ����ؼ� ����
ALTER TABLE "TBL_BUY#" ADD money number(8);

--'�����ݾ�' ���ϱ��� Ʈ������̶� �ϰ� ���÷� �ϳ��� ����

--ó������1 : wonder ���� CHR-J59�� 2���� �����մϴ�.
INSERT INTO "TBL_BUY#"(BUY_SEQ,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
values(TBL_BUY_SEQ.nextval,'wonder','CHR-J59',2,sysdate);
--ó������2 : dual �ӽ����̺� �̿��ؼ� ���� seq�� ���ϱ�
SELECT tbl_buy_seq.currval FROM dual;	--nextval �����Ŀ��� Ȯ�� ����
--ó������3 : ������ ��ǰ�� ���� ���ϱ�
SELECT price FROM "TBL_PRODUCT#" tp WHERE pcode='CHR-J59';
--ó������4 : ó������1���� �߰��� �࿡ money �÷� ����ϰ� ����
UPDATE "TBL_BUY#" SET MONEY = 98700*QUANTITY WHERE BUY_SEQ =21;

--���� Ʈ������� ���ν����� ����(����)
CREATE OR REPLACE PROCEDURE proc_set_money(
	acustom_id IN varchar2,
	apcode IN varchar2,
	acnt IN NUMBER, 
	issuccess OUT varchar2 --��� �Ű�����
)
IS 
	vseq NUMBER;	--��������
	vprice NUMBER;
BEGIN 
	INSERT INTO tbl_test values(2,acustom_id);	--Ʈ������� �ϳ��� �����ϰ� �ӽ����̺� ������ �߰�
	INSERT INTO "TBL_BUY#" (buy_seq,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
	VALUES (tbl_buy_seq.nextval,acustom_id,apcode,acnt,sysdate);	--�Ű����������� �߰�
	SELECT tbl_buy_seq .currval INTO vseq FROM dual;
	SELECT price INTO vprice FROM "TBL_PRODUCT#" tp WHERE pcode=apcode;
	UPDATE "TBL_BUY#" SET money = vprice *QUANTITY WHERE BUY_SEQ =vseq;
	dbms_output.put_line('���� ����');
	isSuccess := 'success';
	COMMIT;
	EXCEPTION 	-- EXCEPTION �߰��Ͽ� ó�� -> �޽��� ���, rollback 
		WHEN OTHERS THEN 
		dbms_output.put_line('���� ����');
		ROLLBACK;		--������ �߻��� sql ���� insert,UPDATE,delete�� ���
		isSuccess := 'fail';
END;

--���ν��� ����
begin 
	proc_set_money ('twice','CJ-BABQ1',2);
--	proc_set_money ('twice','C-BABQ1',4);	--�����߻�(�������� �÷��� �߸��� ��), ������� ���
	
END;
SELECT * FROM "TBL_BUY#" tb ;

CREATE TABLE tbl_test(	--Ʈ������� �׽�Ʈ�� ���̺�
	buy_seq number(8),
	custom_id varchar2(20)
);

SELECT * FROM TBL_TEST tt;
