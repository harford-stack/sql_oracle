--서브 쿼리 - 쿼리 안에 또다른 쿼리
SELECT * FROM PROFESSOR;

SELECT
    MAX(PAY)
FROM PROFESSOR; -- 결과 570

SELECT *
FROM PROFESSOR
WHERE PAY = 570;

SELECT *
FROM PROFESSOR
WHERE PAY = (
    SELECT 
        MAX(PAY)
    FROM PROFESSOR
); -- 급여 가장 많이 받는 사람


-- 급여 가장 많이 받는 사람 + 가장 적게 받는 사람
SELECT *
FROM PROFESSOR
WHERE PAY = (
    SELECT 
        MAX(PAY)
    FROM PROFESSOR
) OR PAY = (
    SELECT 
        MIN(PAY)
    FROM PROFESSOR); -- IN을 쓰지 못함
    

SELECT * FROM PROFESSOR;
SELECT * FROM DEPARTMENT;

SELECT DEPTNO
FROM DEPARTMENT
WHERE DNAME = '컴퓨터공학과';

SELECT *
FROM PROFESSOR
WHERE DEPTNO = (
    SELECT DEPTNO
    FROM DEPARTMENT
    WHERE DNAME = '컴퓨터공학과'
);

SELECT *
FROM PROFESSOR
WHERE DEPTNO = (
    SELECT DEPTNO
    FROM DEPARTMENT
    WHERE DNAME IN ('컴퓨터공학과', '멀티미디어공학과')
);
-- 오류 발생 (단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.)

SELECT *
FROM PROFESSOR
WHERE DEPTNO IN (
    SELECT DEPTNO
    FROM DEPARTMENT
    WHERE DNAME IN ('컴퓨터공학과', '멀티미디어공학과')
);

    