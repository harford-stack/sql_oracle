-- EMP 테이블 참고 정보
-- EMPNO(사번), ENAME(직원이름), JOB(직급), MGR(팀장OR사수의 사번), 
-- HIREDATE(입사일), SAL(급여), COMM(커미션, 보너스), DEPTNO(부서번호)

-- 숫자 함수 관련 연습문제
-- 1. 모든 직원의 SAL 값에 10%를 추가한 값을 출력해 보시오.
-- 2. SAL 값이 1500 이상인 직원들의 평균 급여를 구해 보시오.
-- 3. 각 부서(DEPTNO)별로 급여의 총합을 구해 보시오.
-- 4. SAL 값이 1300 이상이면서 부서번호가 20인 직원들의 평균 급여를 구해 보시오.
-- 5. 각 부서별로 급여가 가장 높은 직원의 이름을 구해 보시오.
-- 6. 직원들의 급여를 오름차순으로 정렬하시오.
SELECT * FROM EMP;
--
-- 1.
SELECT
    SAL,
    SAL + (SAL / 10)
FROM EMP;

-- 2. 
SELECT
    AVG(SAL)
FROM EMP
WHERE SAL >= 1500;

-- 3.
SELECT
    DEPTNO,
    SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

-- 4.
SELECT
    AVG(SAL)
FROM EMP
WHERE SAL >= 1300 AND DEPTNO = 20;

-- 5. 이름을 못 구하겠음 -- 서브쿼리 배운 후 수정, + 조인
SELECT
    DEPTNO,
    MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

-- 6.
SELECT *
FROM EMP
ORDER BY SAL;


