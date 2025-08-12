SELECT *
FROM PROFESSOR
WHERE BONUS IS NULL;

SELECT *
FROM PROFESSOR
WHERE BONUS IS NOT NULL;


-- 서브쿼리 (쿼리 안에 또다른 쿼리)
SELECT
    STU_NAME,
    MAX(STU_HEIGHT)
FROM STUDENT;
-- 논리적 모순, 명령문 실행 시 오류 발생 (단일 그룹의 그룹 함수가 아닙니다)

SELECT *
FROM STUDENT
WHERE STU_HEIGHT = (
    SELECT MAX(STU_HEIGHT)
    FROM STUDENT
);

-- 학생들의 전체 평균 키보다 큰 키를 가진 학생 출력
SELECT *
FROM STUDENT
WHERE STU_HEIGHT > (
    SELECT AVG(STU_HEIGHT)
    FROM STUDENT
);
    
    