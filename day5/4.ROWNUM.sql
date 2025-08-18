SELECT ROWNUM, S.*
FROM STUDENT S
WHERE ROWNUM <= 5;
-- ROWNUM은 순차적인 번호를 부여하는 컬럼 생성

SELECT ROWNUM, S.*
FROM STUDENT S
WHERE ROWNUM = 1; -- 가능

SELECT ROWNUM, S.*
FROM STUDENT S
WHERE ROWNUM = 2; -- 불가능

SELECT ROWNUM, S.*
FROM STUDENT S
WHERE ROWNUM >= 1; -- 가능

SELECT ROWNUM, S.*
FROM STUDENT S
WHERE ROWNUM >= 2; -- 불가능

SELECT ROWNUM, S.*
FROM STUDENT S
WHERE ROWNUM BETWEEN 3 AND 6; -- 불가능

SELECT *
FROM (
    SELECT ROWNUM, S.*
    FROM STUDENT S
); -- 이때에는 ROWNUM이 넘버링된 것이 아니라 속성 값으로 변하게 된다

SELECT *
FROM (
    SELECT ROWNUM RN, S.* -- -- 다만 별칭을 꼭 지정해야 함
    FROM STUDENT S
)
WHERE RN BETWEEN 3 AND 6;


SELECT ROWNUM, S.*
FROM STUDENT S
ORDER BY STU_HEIGHT DESC; -- 정렬은 결과가 나온 후 정렬 시키기 때문에 ROWNUM 숫자가 섞임


-- 학생테이블에서 키가 큰 상위 5명만 출력
SELECT ROWNUM, S.*
FROM (
    SELECT *
    FROM STUDENT
    ORDER BY STU_HEIGHT DESC
) S
WHERE ROWNUM <= 5;


-- 평균급여가 2번째로 큰 부서의 부서명, 평균급여 출력
SELECT 부서명, 평균급여
FROM (
    SELECT ROWNUM RN , E.*
    FROM (
        SELECT DNAME 부서명, ROUND(AVG(SAL)) 평균급여
        FROM EMP E
        INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
        GROUP BY DNAME
    ) E
) E
WHERE RN = 2;
