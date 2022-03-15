-- ��¥ Ÿ�� : date, timestamp(timezone ����)
CREATE TABLE table_date(
	acol DATE,
	bcol timestamp ,
	ccol timestamp DEFAULT sysdate -- ���� ���������� �� �⺻��: sysdate �� ���� ��¥/�ð�
);
--��¥ ������ ���ڿ� Ÿ�԰� �ڵ�ĳ������ �˴ϴ�.''�ȿ� yyyy-MM-dd hh:mm:ss ���ڿ� �������� �ۼ�.
INSERT INTO TABLE_DATE(ACOL, BCOL)
VALUES('2022-02-07', '2022-02-07');

SELECT  * FROM TABLE_DATE td ;

-- ���ڿ� Ÿ��
-- CHAR(����) : ��������, ������ ����Ʈ
-- VARCHAR(����) : ����Ŭ���� ������� �ʴ� �����ڷ���
-- VARCHAR2(����) : ����������, ���̴� �ִ�����̰� ������ �޸𸮴� ������ũ�⸸ŭ ����
--		�ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ

CREATE  TABLE table_string(
	acol char(10),
	bcol varchar2(10),
	ccol nchar(10),
	dcol nvarchar2(10)
);
--char Ÿ�� Ȯ��
INSERT INTO table_string (acol) VALUES ('abcdefghij');
INSERT INTO table_string (acol) VALUES ('abcde');
INSERT INTO table_string (acol) VALUES ('�����ٶ�');	--4���� *3����Ʈ
INSERT INTO table_string (acol) VALUES ('������');

--VARCHAR2  Ÿ�� Ȯ�� : CHAR �������� �߰��Ǵ� ���� �����ϴ�.
INSERT INTO table_string (bcol) VALUES ('abcdefghij');
INSERT INTO table_string (bcol) VALUES ('abcde');
INSERT INTO table_string (bcol) VALUES ('�����ٶ�');	--4���� *3����Ʈ
INSERT INTO table_string (bcol) VALUES ('������');

--nchar Ÿ�� Ȯ�� : ��������, ������ ���ڰ���
INSERT INTO table_string (ccol) VALUES ('abcdefghij');
INSERT INTO table_string (ccol) VALUES ('abcde');
INSERT INTO table_string (ccol) VALUES ('�����ٶ�');	--4���� *3����Ʈ
INSERT INTO table_string (ccol) VALUES ('�����ٶ󸶹ٻ������');	--10���ڴ� OK
INSERT INTO table_string (ccol) VALUES ('�����ٶ󸶹ٻ������ī');	--11���ڴ� ����

--NVARCHAR2 Ÿ�� Ȯ�� : ��������, ������ ���ڰ���. NCHAR�� �������� �߰��Ǵ� ���� �����ϴ�.
INSERT INTO table_string (dcol) VALUES ('abcdefghij');
INSERT INTO table_string (dcol) VALUES ('abcde');
INSERT INTO table_string (dcol) VALUES ('�����ٶ�');	--4���� *3����Ʈ
INSERT INTO table_string (dcol) VALUES ('�����ٶ󸶹ٻ������');	--10���ڴ� OK
INSERT INTO table_string (dcol) VALUES ('�����ٶ󸶹ٻ������ī');	--11���ڴ� ����
