--� ���� ����1
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
		WHERE tp.PCODE =tb.PCODE ;		
	
--���� ���� ����2(ǥ��)
SELECT * FROM "TBL_PRODUCT#" tp 
		JOIN "TBL_BUY#" tb 
		ON tp.PCODE =tb.PCODE ;
		
--���� : �����е�('IPAD011')�� ������ ����� �̸��� ���ų�¥ ��ȸ
SELECT name, buy_date FROM "TBL_BUY#" tb 
JOIN "TBL_CUSTOM#" tc ON tb.CUSTOM_ID =tc.CUSTOM_ID AND PCODE ='IPAD011';

--day5 : ALTER table ����

CREATE TABLE tbl#(
	acol varchar2(30) NOT NULL,
	bcol varchar2(10),
	ccol NUMBER(3)
);

INSERT INTO tbl#(ccol) VALUES (12);		--���� : NOT NULL �÷� ���� ����ȵ�
INSERT INTO tbl#(bcol,ccol) VALUES ('xytz',12);	--���� : NOT NULL �÷� ���� ����ȵ�
INSERT INTO tbl#(acol,ccol) VALUES ('main',12); --�������

--�÷� �߰�
ALTER TABLE "TBL#" ADD (dcol timestamp DEFAULT sysdate);
SELECT * FROM "TBL#" t ;

--�÷� ����
ALTER TABLE tbl# MODIFY (ccol NUMBER(3) DEFAULT '0');
INSERT INTO tbl#(acol) VALUES ('main');

--�÷� ����(drop)
ALTER TABLE tbl# DROP COLUMN dcol;

--�������� �߰�(�������� �̸� ���� �ʿ�)
ALTER TABLE "TBL#" ADD CONSTRAINT pk_tbl# PRIMARY KEY (acol);
--�ߺ����� �ִ� ��� (���Ἲ ����) �ߺ��Ǵ� ���� �����ϰ� �⺻Ű �߰� �մϴ�.

--���� ���������� ���� ��� �����ϴ�.(drop�ϰ� �ٽ� ����)
ALTER TABLE "TBL#" DROP CONSTRAINT pk_tbl #;

--tbl# ���̺� age �÷��� �����մϴ�. check �������� : 16�̻� 90������ ��(���ǽ�)
ALTER TABLE "TBL#" ADD age number(3) CHECK (age BETWEEN 16 AND 90);
INSERT into tbl#(acol,age) values('app',23);	--����
INSERT into tbl#(acol,age) values('apps',26);	--����
INSERT into tbl#(acol,age) values('app',99);	--����

--tbl# ���̺� gender �÷��� �����մϴ�. check �������� : 'M','F' ���� ����մϴ�.
ALTER TABLE tbl# ADD gender char(1) CHECK (gender IN('M','F'));
INSERT INTO tbl# (acol,gender) VALUES ('momo','F');
INSERT INTO tbl# (acol,gender) VALUES ('momo2','X');	--���� ���� ���� ����

--SELECT �� ����ϴ� ����Ŭ �Լ�
--��ȸ����� �����ϴ� �Լ� : ���� age �÷� ���� null�϶� 0, gender 'M'�̸� ����,'F'�̸� ����
SELECT * FROM tbl#;
SELECT acol,nvl(age,0) AS age2, decode (gender,'M','����','F','����')  gender2
FROM tbl#;
--nvl�� null value, �÷����� ��Ī�� asŰ���带 ���ϴ�. ������ ����

--drop table 
DROP TABLE tbl222#;