-- 2. 문자 함수

-- 1) CONCAT - 문자열 결합 (||)
SELECT CONCAT(STU_NAME, STU_DEPT)
FROM STUDENT;

SELECT STU_NAME || ' ' || STU_DEPT
FROM STUDENT;

-- 2) LENGTH - 문자열 길이
SELECT LENGTH(STU_DEPT)
FROM STUDENT;

SELECT STU_DEPT, LENGTH(STU_DEPT)
FROM STUDENT;

-- 3) SUBSTR - 문자열 자르기 (특정 부분 추출)
SELECT SUBSTR('Hello Oracle', 1, 5)
FROM DUAL;

SELECT * FROM STU;

SELECT NAME, SUBSTR(JUMIN, 1, 6) AS 생년월일
FROM STU;

SELECT NAME, SUBSTR(JUMIN, 7, 1)
FROM STU;

-- SUBSTR 사용 예시
-- DECODE는 자바의 IF문과 비슷한 문법으로, 참고만 해둘 것
SELECT
    NAME,
    SUBSTR(JUMIN, 7, 1),
    DECODE(SUBSTR(JUMIN, 7, 1), '1', '남', '여')
FROM STU;


-- UPPER, LOWER - 대문자 , 소문자로 변경
SELECT
    UPPER('Hello Oracle'),
    LOWER('Hello Oracle')
FROM DUAL;


-- INSTR - 특정 문자열이 처음으로 몇번째에 나오는지
SELECT *
FROM PROFESSOR;

SELECT EMAIL, INSTR(EMAIL, '@')
FROM PROFESSOR;


-- REPLACE - 문자열을 다른 문자열로 대체
SELECT EMAIL, REPLACE(EMAIL, 'net', 'com')
FROM PROFESSOR;


-- TRIM - 공백제거
SELECT
    TRIM(' Hello Oracle '),
    LTRIM(' Hello Oracle '),
    RTRIM(' Hello Oracle ')
FROM DUAL;
-- 사용자가 여백을 실수로 넣은 것을 방지할 때 사용 가능


-- LPAD, RPAD - 왼쪽이나 오른쪽에 지정한 길이만큼 특정 문자 채우기
SELECT * FROM STU;
SELECT
    LPAD(ID, 10, '*'),
    RPAD(ID, 10, '*')
FROM STU;
-- 값의 길이가 10이 넘는다면 * 표시 채워지지 않는다

-- STU테이블의 ID 끝에 3글자만 *로 표시
SELECT * FROM STU;

SELECT
    ID,
    SUBSTR(ID, 1, LENGTH(ID)-3) || '***', -- 이후 수정에서 귀찮을 가능성 높음
    RPAD(SUBSTR(ID, 1, LENGTH(ID)-3), LENGTH(ID), '*')
FROM STU;



