SELECT LPROD_ID, LPROD_GU, LPROD_NM
FROM   LPROD;

SELECT NVL(MAX(TO_NUMBER(LPROD_ID)),0)+1 FROM LPROD;

--LPROD_GU의 마지막 데이터 + 1을 해보자
--P501 -> P502
SELECT SUBSTR(MAX(LPROD_GU),1,1)
     || (SUBSTR(MAX(LPROD_GU),2) + 1)
FROM LPROD;

--lprodVO : LprodVO[lprodId:10,lprodGu:P404,lprodNm:간식류]
INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM)
VALUES((SELECT NVL(MAX(LPROD_ID),0)+1 FROM LPROD),'P404','간식류');

--LPROD_ID의 마지막번호 + 1
SELECT NVL(MAX(LPROD_ID),0)+1 FROM LPROD;

--서브쿼리? 메인SQL 안에 사용된 또 다른 QUERY
--SELECT절? SCALAR
--FROM절? INLINE VIEW
--WHERE절? NESTED SUBQUERY

--VIEW : 가상테이블. 논리적.

SELECT TRUNC(DBMS_RANDOM.VALUE(0,26)) FROM DUAL;

ROLLBACK;

--lprodGu의 값이 P404인 상품분류 정보 1 행을 가져오자
SELECT LPROD_ID, LPROD_GU, LPROD_NM
FROM   LPROD
WHERE  LPROD_GU = 'P404';

--업데이트는 쎄대여
--[lprodId=10, lprodGu=P404, lprodNm=간식류변경]
UPDATE LPROD
SET    LPROD_NM = '간식류변경'
WHERE  LPROD_GU = 'P404';

ROLLBACK;

--등푸른생선 주세여
DELETE FROM LPROD
WHERE  LPROD_GU = 'P409';
/
SELECT COLUMN_NAME
, DATA_TYPE
, CASE WHEN DATA_TYPE='NUMBER' THEN 'private int ' || FN_GETCAMEL(COLUMN_NAME) || ';'
WHEN DATA_TYPE IN('VARCHAR2','CHAR') THEN 'private String ' || FN_GETCAMEL(COLUMN_NAME) || ';'
WHEN DATA_TYPE='DATE' THEN 'private Date ' || FN_GETCAMEL(COLUMN_NAME) || ';'
ELSE 'private String ' || FN_GETCAMEL(COLUMN_NAME) || ';'
END AS CAMEL_CASE
, '' RESULTMAP
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'ATTACH';
/

INSERT INTO ATTACH(SEQ, FILENAME, FILESIZE, THUMBNAIL, REGDATE)
VALUES(
    (SELECT NVL(MAX(SEQ),0)+1 FROM ATTACH),
    '/upload/2023/01/27/323251417b09_nullPointer.jpg',12345,
    '/upload/2023/01/27/s_323251417b09_nullPointer.jpg',
    SYSDATE
);
/
ROLLBACK;
--널봐라
SELECT NVL(MAX(SEQ),0)+1 FROM ATTACH;
/
--기본키, 외래키 제외하고 
--스키마구조(컬럼,자료형,크기,제약사항,N.N,CHECK) 및 데이터 복제
CREATE TABLE ATTACH_BAK
AS
SELECT * FROM ATTACH;
/
SELECT * FROM ATTACH_BAK;
/
SELECT 









