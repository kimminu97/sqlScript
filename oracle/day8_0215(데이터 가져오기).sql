--전국야영장 정보조회와 


--전체 데이터 갯수는?
SELECT count(*) FROM TBL_CAMPAREA tc ;

--강원도 데이터 갯수는?
SELECT count(*) FROM TBL_CAMPAREA tca WHERE address LIKE '강원도%';

SELECT DISTINCT SUBSTR(ADRESS,1,INSTR(ADDRESS,' '))	--SUBSTR(문자열, 시작위치,길이) 
FROM TBL_CAMPAREA tc ; --주소에서 첫번째 공백 앞부분 추출(중복없이)

--강원도의 자동차야영장 이름, 부대시설 조회하기
SELECT Camp_name,etc1,etc2 FROM TBL_CAMPAREA tca
WHERE address LIKE '강원도%' AND CAMP_TYPE LIKE  '%자동차야영장%';

--자동차 야영장 갯수가 50개 이상인 곳 야영지이름, 주소 확인하기
SELECT camp_name, address FROM TBL_CAMPAREA tca WHERE CAR_CNT >=50;

--카라반 있는 야영장 이름,주소,카라반 갯수 조회하기
SELECT camp_name ,address ,cara_cnt FROM TBL_CAMPAREA tca
WHERE  CARA_CNT  >0 ORDER BY ADDRESS ;