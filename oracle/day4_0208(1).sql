--UPDATE ����
--UPDATE ���̺��
--SET ������ �÷�=�� �� ,�� �����ؼ� ����
--WHERE ������ �࿡���� ���ǽ�

SELECT * FROM "TBL_CUSTOM#" tc ;

--UPDATE �� delete�� where ���ǽ��� ���Ǵ� ���� �����մϴ�.
UPDATE "TBL_CUSTOM#" SET age=39
WHERE CUSTOM_ID ='twice';	--�⺻Ű �÷��� ����Ͽ� Ư�� 1���� �����մϴ�.

UPDATE "TBL_CUSTOM#" SET age =23, EMAIL ='nana@korea.kr'
WHERE CUSTOM_ID ='wonder';

--custom_id : wonder �� twice �� ���� reg_date�� 22��2��5�Ϸ� ����
UPDATE "TBL_CUSTOM#" SET REG_DATE ='2022-02-05'
WHERE CUSTOM_ID IN ('wonder','twice');	--IN������ OR��ü

--DELETE ����
--delete from ���̺�� where ���ǽ�;
SELECT * FROM "TBL_BUY#" tb;
SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM "TBL_CUSTOM#" tc ;

--������ ���� ���õ����� �߰� 
INSERT INTO "TBL_PRODUCT#" (pcode,CATEGORY,PNAME,PRICE)
VALUES ('GAL0112','A1','������',912300);

DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE ='GAL0112'; --���� : BUY#���� �������� �ʴ°�
DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE ='IPAD011'; --���� :���Ἲ ����

UPDATE "TBL_PRODUCT#" SET PNAME = '�����е�����'
WHERE PCODE = 'IPAD011'; --���� ����

UPDATE "TBL_PRODUCT#" SET PCODE = 'IPAD0111'
WHERE PCODE = 'IPAD011'; --���� : BUY#���� �����ϴ� ��(���Ἲ ����)

--ON DELETE , ON UPDATE(oracle�� �ȵ�) �Ӽ� �����Ͽ� �ܷ�Ű �ٽ� ����
ALTER TABLE IDEV."TBL_BUY#" DROP CONSTRAINT FK_TBL_PRODUCT#;
ALTER TABLE IDEV."TBL_BUY#" ADD CONSTRAINT "FK_TBL_PRODUCT#" 
		FOREIGN KEY (PCODE) 
		REFERENCES IDEV."TBL_PRODUCT#"(PCODE) 
		ON DELETE CASCADE; --���Ἲ�� ���ؼ� �����ϴ°� ������ �����Ѵ� �൵ ���������� ����
--ALTER TABLE ���� : DROP,ADD,MODIFY(���������� ���մϴ�)

-- SELECT �� JOIN : �� �̻��� ���̺�(�ַ� ���������� ���̺�)�� �����Ͽ� �����͸� ��ȸ�ϴ� ���
--					�� �̻��� ���̺��� ����� �÷��� ���� �� �÷��� �̿��Ͽ� JOIN�մϴ�.
--���� : SELECT ~~~FROM ���̺�1 a,���̺�2 b 
--		where a.�����÷�1=b.�����÷�1;
		
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
		WHERE tp.PCODE =tb.PCODE ;		--� ����
	
--join�� ���� ��ɹ� ����(ǥ��)
SELECT * FROM "TBL_PRODUCT#" tp 
		JOIN "TBL_BUY#" tb 
		ON tp.PCODE =tb.PCODE ;
	
--mina012�� ������ ��ǰ���� �����ΰ�?
SELECT PNAME  FROM "TBL_PRODUCT#" tp 
		JOIN "TBL_BUY#" tb 
		ON tp.PCODE =tb.PCODE AND custom_id ='mina012';
--mina012�� ������ ��ǰ��� ���� ��ȸ�ϱ�
SELECT PNAME, PRICE  FROM "TBL_PRODUCT#" tp 
		JOIN "TBL_BUY#" tb 
		ON tp.PCODE =tb.PCODE AND custom_id ='mina012';

--�����Ҷ�, ����� �÷��� ���̺���� �� �����ؾ��մϴ�.
SELECT PNAME, tp.PCODE  FROM "TBL_PRODUCT#" tp 
		JOIN "TBL_BUY#" tb 
		ON tp.PCODE =tb.PCODE AND custom_id ='mina012';
	
--�ܺ����� ���� 2����
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
		WHERE tp.PCODE =tb.PCODE(+) ;		--�ܺ� ����
	
SELECT * FROM "TBL_PRODUCT#" tp 
		LEFT OUTER JOIN "TBL_BUY#" tb --������ �Ǵ� ���̺��� ���� product#
		ON tp.PCODE =tb.PCODE ;
	
SELECT * FROM "TBL_BUY#" tp 
		RIGHT OUTER JOIN "TBL_PRODUCT#" tb --������ �Ǵ� ���̺��� ������ product#
		ON tp.PCODE =tb.PCODE ;
	

	
--������ �׽�Ʈ �Ǵ� ������ ������ ���� ���̺��� ��� ������ �����ϱ�
--DELETE : rollback���� ���� ��� ����. truncate : ���� ��� �Ұ���
--truncate : ���������� ��, fk�� ��Ȱ��ȭ�ϰ� �����͸� �����ؾ��մϴ�.
TRUNCATE TABLE "TBL_BUY#" ;		--�������̺� ������ ���� ����
DELETE FROM "TBL_PRODUCT#" ;	--��ü ������
TRUNCATE TABLE "TBL_CUSTOM#" ;	--����

