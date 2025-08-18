-- UNION, UNION ALL
-- SELECT 쿼리 실행 결과를 합쳐주는 명령어

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_HEIGHT >= 170
UNION -- 중복은 1개로 출력
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_WEIGHT >= 50;

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_HEIGHT >= 170
UNION ALL -- 중복된 값을 그대로 출력(2개 이상으로)
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_WEIGHT >= 50;

-- 주의사항
-- 1. 컬럼의 개수, 타입이 같아야한다.
-- 2. 컬럼의 이름(별칭)은 먼저 나오는 쿼리의 이름을 따른다.
-- 3. 정렬(ORDER BY)는 맨 마지막 줄에서만 첫번째 쿼리 컬럼을 기준으로 가능

SELECT STU_NAME FROM STUDENT
UNION
SELECT COUNT(*) FROM STUDENT;
-- 위 명령문 실행 불가 -- 오류메시지 : 대응하는 식과 같은 데이터 유형이어야 합니다

SELECT STU_NAME AS 별칭 FROM STUDENT -- 컬럼의 이름은 첫번째를 따른다
UNION
SELECT STU_DEPT FROM STUDENT; -- 컬럼의 타입이 같기 때문에 가능

SELECT STU_NAME FROM STUDENT
UNION
SELECT STU_DEPT, STU_DEPT FROM STUDENT;
-- 컬럼의 개수가 다르므로 불가능 -- 오류메시지 : 질의 블록은 부정확한 수의 결과 열을 가지고 있습니다.

-- 네이버카페 20250818 UNION 문제1.
SELECT * FROM STUDENT;
SELECT * FROM ENROL;

SELECT STU_NAME, 평균점수
FROM(
    SELECT S.STU_NAME, AVG(ENR_GRADE) 평균점수, 1 AS ORDERKEY
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    GROUP BY S.STU_NAME
    UNION
    SELECT '전체평균', ROUND(AVG(ENR_GRADE), 1), 2 AS ORDERKEY -- 컬럼 추가 가능
    FROM ENROL
    ORDER BY ORDERKEY, 평균점수 DESC
);

-- 네이버카페 20250818 UNION 문제2.
SELECT * FROM DEPT;
SELECT * FROM EMP;

SELECT 부서명, 평균급여
FROM (
    SELECT DNAME 부서명, ROUND(AVG(SAL)) 평균급여, 1 AS ORDERKEY
    FROM EMP E
    INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
    GROUP BY DNAME
    UNION
    SELECT '전체 평균', ROUND(AVG(SAL)), 2 AS ORDERKEY
    FROM EMP
    ORDER BY ORDERKEY, 평균급여 DESC
);



