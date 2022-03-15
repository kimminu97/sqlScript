--distinct : 별개의

SELECT pcode FROM "TBL_PRODUCT#" tp ;
SELECT pcode FROM "TBL_BUY#" tb ;	--모든행에 pcode 컬럼을 조회

SELECT DISTINCT pcode FROM "TBL_BUY#" tb ;	--pcode 값 중에 동일한 것은 한번만 조회됩니다.
