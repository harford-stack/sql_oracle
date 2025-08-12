-- 1. SELECT (테이블에서 데이터를 검색하는 명령어)

SELECT * 
FROM STUDENT; -- * 은 모든 컬럼을 조회하는 것을 의미

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT; -- 필요한 컬럼만 선택해서 조회 가능

SELECT *
FROM STUDENT
WHERE STU_DEPT = '기계'; -- 조건에 만족하는 레코드 조회하려면 WHERE를 사용

SELECT *
FROM STUDENT
WHERE STU_GRADE >= 2; -- 학년이 2학년 이상인 학생들 조회

SELECT *
FROM STUDENT
WHERE STU_GRADE >= 2 AND STU_GENDER = 'M'; -- AND를 이용해서 2개의 조건 만족하는 학생 출력

SELECT *
FROM STUDENT
WHERE STU_GRADE >= 2 OR STU_GENDER = 'M'; -- OR을 이용해서 둘 중 하나라도 만족하면 출력

SELECT *
FROM STUDENT
WHERE STU_DEPT IN ('기계', '전기전자'); -- 동일한 컬럼에서 OR 조건을 IN 이라는 간결한 명령문으로 입력 가능
-- WHERE STU_DEPT = '기계' OR STU_DEPT = '전기전자';

SELECT * 
FROM STUDENT
WHERE STU_HEIGHT BETWEEN 170 AND 180; -- 숫자의 경우 사이값 레코드 출력하고자 할 때
-- WHERE STU_HEIGHT >= 170 AND STU_HEIGHT <= 180;

SELECT * 
FROM STUDENT
WHERE STU_NAME LIKE '%옥%'; -- 양 옆 %를 붙이면 앞이든 뒤든 상관없이 '옥' 글자가 들어간 레코드 출력

SELECT * 
FROM STUDENT
WHERE STU_NO LIKE '%3%'; -- STU_NO에 3이 포함된 레코드 출력

SELECT * 
FROM STUDENT
WHERE STU_WEIGHT >= 50
ORDER BY STU_WEIGHT; -- 몸무게 기준을 오름차순
-- ORDER BY STU_WEIGHT ASC; -- 오름차순, ASC는 생략 가능
-- ORDER BY STU_WEIGHT DESC; -- 내림차순, 생략 불가



