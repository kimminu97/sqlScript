--������ Ÿ�� number ���� ���̺�
--number : �ڹ� byte,short,int,long,float,double �ش�
--			number(��ü�ڸ���, �Ҽ����ڸ���)
--table_number ���̺� �̸�
CREATE TABLE table_number(
	col1 NUMBER,		-- �ڸ����� �������� ������ �ִ� 38�ڸ� �Դϴ�.
	col2 number(5),
	col3 number(7,2),
	col4 number(2,5)
	);
	
-- ���� ����
INSERT INTO TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.00012);

--col2 Į���� �ڸ����� 6�� : ����
INSERT INTO TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 123456, 12345.67, 0.00012);
--col3 Į���� �Ҽ��� ���� �ڸ����� 2�� : �ݿø�
INSERT INTO TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.678, 0.00012);
--col3 �÷� ��ü �ڸ��� 7�� : �Ҽ������� �׻� 2��, �׸��� ������ 5�������ϹǷ� ����
INSERT INTO TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.00012);
--col4 �÷��� number(2,5) : ��ȿ�ڸ��� 2��(0���԰���), ������ 3���� ��ȿ�ڸ���0
INSERT INTO TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.000126);
--col4 �÷��� number(2,5) :������ 3���� ��ȿ�ڸ��� 0 -> �̰��� �ƴϸ� ����
INSERT INTO TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.0012);

--0.00012300 �� ��, ��ȿ�� ���� 0.000123 123�ڿ� 00�� ��ȿ�� ���� �ƴմϴ�.
