SELECT * FROM PROFESSOR;
SELECT * FROM DEPARTMENT;
SELECT * FROM STU;

-- 숫자 함수, 문자 함수, 날짜 함수

-- 1. 숫자 함수
-- 1) ROUND (반올림)
SELECT 'TEST' FROM DUAL; -- 실습 및 테스트용 가상 테이블 생성
SELECT ROUND (123.4567, 2) FROM DUAL;
-- 소수점 두번째 자리까지 반올림
-- 123.4567 자리에 컬럼명
-- DUAL 자리에 테이블명
-- SELECT ROUND (컬럼명, 반올림 할 소수점 자리) FROM 테이블명;

SELECT AVG(STU_HEIGHT)
FROM STUDENT
WHERE STU_DEPT = '기계';

SELECT ROUND(AVG(STU_HEIGHT),2 ) AS "평균 키"
FROM STUDENT
WHERE STU_DEPT = '기계';


-- 2) TRUNC (절삭)
SELECT TRUNC(123.4567, 3)
FROM DUAL;
-- 반올림 없이 두번째 인자 값의 소수점 위치만큼 출력(올림X 내림X)

SELECT TRUNC(AVG(STU_HEIGHT),5 ) AS "평균 키"
FROM STUDENT
WHERE STU_DEPT = '기계';


-- 3) CEIL (강제 올림)
SELECT CEIL(123.000001)
FROM DUAL;
-- 숫자를 올림해서 가장 가까운 정수로 변환


-- 4) FLOOR (강제 내림)
SELECT FLOOR(123.999)
FROM DUAL;
-- 숫자를 내림해서 가장 가까운 정수로 변환


-- 5) MOD (나머지 반환)
SELECT MOD(10,3)
FROM DUAL;


-- 6) SIGN (숫자의 부호를 반환)
SELECT SIGN(-195)
FROM DUAL;
-- 양수면 1, 음수면 -1, 0이면 0 반환


-- 7) ABS (절대값)
SELECT ABS(-10)
FROM DUAL;


-- POWER (거듭제곱)
SELECT POWER(2,3)
FROM DUAL;
-- 2의 3제곱


