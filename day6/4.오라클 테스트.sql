-- 답변란에는 쿼리문을, 첨부파일에는 실행결과 캡처 이미지를 첨부하세요.
-- 3번문제는 마지막 삭제 결과만 캡처해서 첨부하시면 됩니다.

-- 1. 학생들중 키가 175이상인 학생의 정보를 출력하시오. ( 15점 )
-- 사용테이블 : STUDENT
-- 출력 컬럼 : 학생번호, 이름, 키

SELECT * FROM STUDENT;

SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT
WHERE STU_HEIGHT >= 175;

-- 2. 시험 점수가 80점 이상이면 'A', 70점 이상이면 'B', 60점 이상이면 'C', 그외는 '노력요망' 으로 출력하시오. ( 15점 )
-- 사용테이블 : ENROL
-- 출력 컬럼 : 학생번호, 평가정보

SELECT
    STU_NO,
    CASE
        WHEN ENR_GRADE >= 80 THEN 'A'
        WHEN ENR_GRADE >= 70 THEN 'B'
        WHEN ENR_GRADE >= 60 THEN 'C'
        ELSE '노력요망'
    END 평가정보
FROM ENROL;

-- 3. TBL_EMP 테이블에 데이터를 삽입, 수정, 삭제하시오. ( 15점 )
-- 조건 1. 데이터 삽입 시 들어갈 내용은 자유롭게 정의하되, manager_id 컬럼은 테이블의 연관성을 고려하여 삽입한다. (NULL 금지)
-- 조건 2. 조건 1에서 삽입한 직원의 급여 정보를 10%로 증가한다. 
-- 조건 3. 조건 1에서 삽입한 직원을 PK를 조건으로 삭제 한다.

SELECT * FROM TBL_EMP;

INSERT INTO TBL_EMP
VALUES ('E1008', '김철수', '대리', 'E1004', SYSDATE, 5000000, 'D04');

UPDATE TBL_EMP
SET
    SALARY = SALARY * 1.1
WHERE EMP_ID = 'E1008';

DELETE FROM TBL_EMP WHERE EMP_ID = 'E1008';

COMMIT;

-- 4. 아래 이미지와 같이 이메일의 특정 부분을 '*'로 처리하시오. ( 20점 )
-- 사용테이블 : PROFESSOR
-- 출력 컬럼 : 원본 메일 컬럼, 수정된 메일 컬럼
SELECT * FROM PROFESSOR;

SELECT
    EMAIL,
    INSTR(EMAIL, '@'),
    INSTR(EMAIL, '.'),
    SUBSTR(EMAIL, INSTR(EMAIL, '@'), 1),
    SUBSTR(EMAIL, INSTR(EMAIL, '.'), LENGTH(EMAIL)),
    LPAD(SUBSTR(EMAIL, INSTR(EMAIL, '@'), 1), INSTR(EMAIL, '@'), '*') || LPAD(SUBSTR(EMAIL, INSTR(EMAIL, '.'), LENGTH(EMAIL)), INSTR(EMAIL, '.')-INSTR(EMAIL, '@'), '*')
FROM PROFESSOR;

-- 5. 각 부서별 평균 급여를 구한 후 평균 급여를 기준으로 내림차순 하시오. ( 10점 )
-- 사용테이블 : TBL_EMP, TBL_DEPT
-- 출력 컬럼 : 부서 이름, 평균 급여



SELECT DEPT_NAME, AVG(SALARY) 평균급여
FROM TBL_EMP E
INNER JOIN TBL_DEPT D ON E.DEPT_ID = D.DEPT_ID
GROUP BY DEPT_NAME
ORDER BY 평균급여 DESC;

-- 6. 모든 부서장들의 급여 평균보다 높은 급여를 받는 직원들을 출력하시오. ( 10점 )
-- 사용 테이블 : TBL_EMP, TBL_DEPT
-- 출력 컬럼 : 직원 이름, 급여, 부서장들의 평균 급여
SELECT * FROM TBL_DEPT;

SELECT EMP_NAME, SALARY
FROM TBL_EMP
WHERE SALARY > (
    SELECT ROUND(AVG(SALARY))
    FROM TBL_EMP E
    INNER JOIN TBL_DEPT D ON E.EMP_ID = D.HEAD_ID
);

SELECT EMP_NAME, ROUND(AVG(SALARY))
FROM TBL_EMP E
INNER JOIN TBL_DEPT D ON E.EMP_ID = D.HEAD_ID
GROUP BY EMP_NAME;

-- 7. '모바일 앱 개발' 프로젝트에 배정된 직원들중 가장 높은 급여를 받는 직원을 출력하시오. ( 5점 )
-- 사용 테이블 : TBL_EMP, TBL_PROJECT, TBL_ASSIGNMENT
-- 출력 컬럼 : 직원 이름, 직급, 급여

SELECT * FROM TBL_EMP;
SELECT * FROM TBL_PROJECT;
SELECT * FROM TBL_ASSIGNMENT;


SELECT EMP_NAME, JOB_TITLE, SALARY
FROM TBL_EMP E
INNER JOIN TBL_ASSIGNMENT A ON E.EMP_ID = A.EMP_ID
INNER JOIN TBL_PROJECT P ON A.PROJ_ID = P.PROJ_ID
WHERE PROJ_NAME = '모바일 앱 개발';



-- 8. 각 직원의 부하직원의 수(자신의 emp_id를 manager_id로 가지고 있는 사람 수)를 구하시오. 단, 없으면 0으로 출력하시오. ( 5점 )
-- 사용 테이블 : TBL_EMP
-- 출력 컬럼 : 직원 이름, 직급, 부하직원 수
SELECT * FROM TBL_EMP;

SELECT E1.EMP_NAME, E1.JOB_TITLE, COUNT(*)
FROM TBL_EMP E1
INNER JOIN TBL_EMP E2 ON E1.EMP_ID = E2.MANAGER_ID
GROUP BY E1.EMP_NAME, E1.JOB_TITLE;

-- 9. 자신의 학년에서 자신보다 키가 큰 학생의 수를 출력하시오. 없으면 0을 출력하시오. ( 5점 )
-- 사용 테이블 : STU
-- 출력 컬럼 : 이름, 학년, 키, 자신보다 키가 큰 학생의 수

SELECT * FROM STU;

SELECT NAME, GRADE, HEIGHT
FROM STU;

SELECT COUNT(*)
FROM STU S
INNER JOIN (
    SELECT NAME, GRADE, HEIGHT
    FROM STU
) T ON S.NAME = T.NAME
;
