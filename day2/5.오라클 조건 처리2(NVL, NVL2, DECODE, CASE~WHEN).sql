-- 오라클에서 조건 처리

SELECT
    PAY,
    BONUS,
    PAY + BONUS
FROM PROFESSOR;
-- 기존에 PAY 값이 NULL인 사람은 PAY + BONUS도 NULL 값으로 출력됨


-- NVL 함수
SELECT 
    NAME,
    BONUS,
    NVL (BONUS, 0)
FROM PROFESSOR;
-- 첫번째가 인자 값이 NULL이 아니라면 그대로 출력
-- NULL이라면 두번째 인자 값으로 치환하여 출력

-- 페이 + 보너스의 합이 300 이상인 사람을 출력하시오
SELECT
    NAME,
    PAY,
    BONUS,
    PAY + NVL(BONUS, 0)
FROM PROFESSOR
WHERE PAY + NVL(BONUS, 0) >= 300;


-- NVL2
SELECT
    BONUS,
    NVL2(BONUS, 1000,0)
FROM PROFESSOR;
-- 첫번째 인자 값이 NULL이 아닐 때 두번째 인자 값으로 치환
-- 첫번째 인자 값이 NULL이면 세번째 인자 값으로 치환


-- DECODE - 자바의 조건문 (IF)
-- DECODE(COLUMN명, '조건값', '조건값이 COLUMN값이랑 동일할 때 출력할 값', '조건 만족안했을 때 출력할 값')

SELECT
    NAME,
    SUBSTR(JUMIN, 7, 1) AS 성별
FROM STU;
-- 주민번호이기 때문에 성별 COLUMN이 1 또는 2로 출력되기에
-- 남자 또는 여자로 출력되길 원한다

SELECT
    NAME,
    DECODE(SUBSTR(JUMIN, 7, 1), 1, '남자', '여자') AS 성별
FROM STU;


-- IF ~ ELSE IF ~ ELSE
SELECT
    ENAME, 
    JOB,
    DECODE(JOB, 'MANAGER', '매니저', '그외')
FROM EMP;

SELECT
    ENAME, 
    JOB,
    DECODE(JOB, 'MANAGER', '매니저', 'SALESMAN', '세일즈맨', '그외')
FROM EMP;


-- 주민번호 7번째가 1,3이면 '남자', 2,4면 '여자'
SELECT
    NAME,
    DECODE(SUBSTR(JUMIN, 7, 1), 1, '남자', 3, '남자', '여자') AS 성별
FROM STU;


