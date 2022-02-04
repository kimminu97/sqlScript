/*
	OWNER
	ID VC2(200)
	---------
	NAME VC2(200)
	AGE N(5)
	ADDRESS VC2(300)
	
	
*/
DROP TABLE OWNER;

CREATE TABLE OWNER(
	ID VARCHAR2(200) PRIMARY KEY,
	NAME VARCHAR2(200) NOT NULL,
	AGE NUMBER(5) DEFAULT 20,
	ADDRESS VARCHAR2(300)
);
SELECT * FROM OWNER;

/*
 * 
    PET
	PIN VC2(300)
	----------
	NAME VC2(200)
	AGE N(5)
	OWNER_ID VC2(200)
*/

CREATE TABLE PET(
	PIN VARCHAR2(300) PRIMARY KEY,
	NAME VARCHAR2(200) NOT NULL,
	AGE NUMBER(5),
	OWNERID VARCHAR2(200),
	GENDER CHAR(1) DEFAULT 'M' NOT NULL CONSTRAINT CHECK_CHAR CHECK (GENDER IN('M','W')),
	CONSTRAINT PET_FK FOREIGN KEY(OWNERID) REFERENCES OWNER(ID)
);
SELECT * FROM PET;




