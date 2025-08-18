-- OUTER JOIN
-- LEFT, RIGHT | LEFT 사용

SELECT *
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;
-- INNER JOIN은 위에서 ENROL에는 없는 STUDENT 학생은 출력 안됨

SELECT *
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO;
-- STUDENT 모든 학생들의 정보 출력 가능

-- 각 학생들의 시험을 본 개수 출력
-- 이름, 개수 출력. 단 시험을 하나도 보지 않았으면 개수는 0으로 출력
SELECT S.STU_NO, STU_NAME, COUNT(ENR_GRADE)
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, STU_NAME;
-- COUNT 사용 시 무조건 *을 사용하는 것은 좋지 않음
-- *은 단순 레코드를 카운팅하기 때문에
-- 위 명령문에서 ENR_GRADE를 *로 바꿔서 출력해보면 알 수 있다
-- 단순 LEFT JOIN 에서 ENR_GRADE는 NULL 값이기 때문에 카운팅 안됨


SELECT * FROM EMP;
-- 각 직원의 부하직원 수를 구하기. 단, 없으면 0으로 출력
-- 출력 컬럼 : 사번, 이름, 부하직원 수

SELECT E1.EMPNO, E1.ENAME, COUNT(E2.MGR) "부하직원 수"
FROM EMP E1
LEFT JOIN EMP E2 ON E1.EMPNO = E2.MGR
GROUP BY E1.EMPNO, E1.ENAME
ORDER BY COUNT(E2.MGR) DESC;

SELECT EMPNO, ENAME, NVL(CNT, 0)
FROM EMP E
LEFT JOIN (
    SELECT MGR, COUNT(*) CNT
    FROM EMP
    GROUP BY MGR
) T ON E.EMPNO = T.MGR
ORDER BY CNT DESC;

-- 학번, 학생 이름, 담당교수 이름 출력
-- 단, 담당교수가 없으면 '담당교수없음'으로 출력
SELECT * FROM STU;
SELECT * FROM PROFESSOR;

SELECT STUNO, S.NAME, NVL(P.NAME, '담당교수없음')
FROM STU S
LEFT JOIN PROFESSOR P ON S.PROFNO = P.PROFNO;


-- STUDENT
-- 학생들의 시험 평균 점수 출력
-- 단, 시험을 보지 않은 학생은 '성적없음' 출력
SELECT * FROM STUDENT;
SELECT * FROM ENROL;

SELECT S.STU_NO, STU_NAME, NVL(TO_CHAR(AVG(ENR_GRADE)), '성적없음')
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, STU_NAME;
-- NVL 사용 시에는 데이터 타입이 같아야한다.
-- TO_CHAR - 날짜 뿐만아니라 숫자도 문자 포맷으로 변경 가능

