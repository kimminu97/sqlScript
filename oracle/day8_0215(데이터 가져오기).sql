--�����߿��� ������ȸ�� 


--��ü ������ ������?
SELECT count(*) FROM TBL_CAMPAREA tc ;

--������ ������ ������?
SELECT count(*) FROM TBL_CAMPAREA tca WHERE address LIKE '������%';

SELECT DISTINCT SUBSTR(ADRESS,1,INSTR(ADDRESS,' '))	--SUBSTR(���ڿ�, ������ġ,����) 
FROM TBL_CAMPAREA tc ; --�ּҿ��� ù��° ���� �պκ� ����(�ߺ�����)

--�������� �ڵ����߿��� �̸�, �δ�ü� ��ȸ�ϱ�
SELECT Camp_name,etc1,etc2 FROM TBL_CAMPAREA tca
WHERE address LIKE '������%' AND CAMP_TYPE LIKE  '%�ڵ����߿���%';

--�ڵ��� �߿��� ������ 50�� �̻��� �� �߿����̸�, �ּ� Ȯ���ϱ�
SELECT camp_name, address FROM TBL_CAMPAREA tca WHERE CAR_CNT >=50;

--ī��� �ִ� �߿��� �̸�,�ּ�,ī��� ���� ��ȸ�ϱ�
SELECT camp_name ,address ,cara_cnt FROM TBL_CAMPAREA tca
WHERE  CARA_CNT  >0 ORDER BY ADDRESS ;