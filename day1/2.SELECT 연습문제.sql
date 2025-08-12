-- * STUDENT  테이블 기준 *
-- 1. 모든 레코드 출력
-- 2. STUDENT 테이블에서 이름, 학과, 학년 출력
-- 3. 컴퓨터 정보과 학생들만 출력
-- 4. 기계과이면서 남자인 학생들만 출력
-- 5. 몸무게가 50~70 사이의 학생들 출력

SELECT *
FROM STUDENT;

SELECT STU_NAME, STU_DEPT, STU_GRADE
FROM STUDENT;

SELECT * 
FROM STUDENT
WHERE STU_DEPT = '컴퓨터정보';

SELECT *
FROM STUDENT
WHERE STU_DEPT = '기계' AND STU_GENDER = 'M';

SELECT * 
FROM STUDENT
WHERE STU_WEIGHT BETWEEN 50 AND 70;

