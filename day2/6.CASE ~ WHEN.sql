-- CASE ~ WHEN (DECODE 보다 좀 더 복잡한 처리 가능한 IF 문)

SELECT * FROM PROFESSOR;

SELECT
    PAY,
    CASE
        WHEN PAY >= 500 THEN '고소득'
        WHEN PAY BETWEEN 300 AND 500 THEN '적당히 받음'
        ELSE '화이팅'
    END 급여정보
FROM PROFESSOR;