-- ������ �������� : 1)�ٸ� ��ǻ�ͷ� �����ͺ��̽� ���̺�(������ ����)�� ������ �� -> SQL ��ũ��Ʈ ����
--				2)���� ��ǻ���� �ٸ� ��Ű���� �����ͺ��̽� ���̺�(������ ����) ������ ��



--��ũ��Ʈ ����(.sql)�� ���̺� ������ ������ �߰��ϱ�
--		1) DDL(CREATE) �� DML(INSERT)�� ��� �ʿ��մϴ�. 
--		2)DDL�� ���̺� PROPERTIES���� �����ϰ�
--		3)INSERT �����ʹ� ������ ��������� �մϴ�.
--		4) 2)��3)�� �Ѱ��� ��ũ��Ʈ����(.sql)�� �����ؼ� ������ ���ϴ�.
--		5)���̺� �������� ���� ���� ������ �� ����ϼ���.
--���� : SQL > @���ϸ�.sql �� ���� �����մϴ�.
--		üũ���� 1) ���� ���丮 ��� - ������ �ִ� ��ġ���� cmd���� ->sqlplus�Է�
--			  2) @��ȣ �� ���ּ���. ���ϸ� ��Ȯ�� �Է��ϼ���
CREATE TABLE "EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20), 
	"LAST_NAME" VARCHAR2(25) CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL , 
	"EMAIL" VARCHAR2(25) CONSTRAINT "EMP_EMAIL_NN" NOT NULL , 
	"PHONE_NUMBER" VARCHAR2(20), 
	"HIRE_DATE" DATE CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL , 
	"JOB_ID" VARCHAR2(10) CONSTRAINT "EMP_JOB_NN" NOT NULL , 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0), 
	CONSTRAINT EMP_EMP_ID_PK PRIMARY KEY("EMPLOYEE_ID")
   );
   
   CREATE TABLE "DEPARTMENTS" 
   ("DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30) CONSTRAINT "DEPT_NAME_NN" NOT NULL ENABLE, 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0), 
	 CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID")
	 );