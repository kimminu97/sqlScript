--view : ���� ���̺�(���������� �������� �ʰ� �������� ������� ���̺�)
--		���������� ���̺��� �̿��ؼ� �����մϴ�.
--		�� �����(������)�� ���̺�ó�� select�� ��ȸ�� �Ҽ� �ִ� ���̺�
--		�� grant resource,connect to idev; -> resource�� view ������ ����

CREATE VIEW v_buy
AS 
SELECT PCODE, CUSTOM_ID FROM tbl_buy#;	-- insufficient privileges

/* idev �������� create view ���� �ο�(sql*plus���� �����ϱ�)
 * SQL> connect system
Enter password:
Connected.
SQL> grant create view to idev;

Grant succeeded.
 */

--view�� �̿��� select ��ȸ
SELECT * FROM V_BUY vb WHERE PCODE ='dk_143';

--buy#, custom# �� �����ϰ� coustom_id,pcode,name,�̸���,���ż���,���ų�¥
-- �� v_sale �̸��� view ���弼��
CREATE VIEW v_sale 
AS
select tb.custom_id, pcode,name,email,quantity,buy_date FROM tbl_buy# tb
LEFT OUTER JOIN tbl_custom# tc ON tb.CUSTOM_ID =tc.CUSTOM_ID ;

DROP VIEW v_sale;

SELECT * FROM v_sale ;