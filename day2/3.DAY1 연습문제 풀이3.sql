-- EMP 테이블 참고 정보
-- EMPNO(사번), ENAME(직원이름), JOB(직급), MGR(팀장OR사수의 사번), 
-- HIREDATE(입사일), SAL(급여), COMM(커미션, 보너스), DEPTNO(부서번호)

-- 날짜 함수 관련 연습문제

-- 1. HIREDATE에서 직원이 입사한 년도를 추출하여 출력해 보시오.
SELECT
    ENAME,
    TO_CHAR(HIREDATE, 'YYYY')
FROM EMP;


-- 2. HIREDATE가 1981년 1월 1일 이후인 직원들의 이름을 출력해 보시오.
SELECT
    ENAME
FROM EMP
WHERE HIREDATE >= TO_DATE('1981/01/01', 'YYYY/MM/DD');


-- 3. 입사일이 1981년 5월 1일 이전인 직원들의 이름과 입사일을 출력해 보시오.
SELECT
    ENAME
FROM EMP
WHERE HIREDATE < TO_DATE('1981/05/01', 'YYYY/MM/DD');


-- 그룹 함수 관련 연습문제
-- 1. 각 부서별 평균 급여를 출력.
SELECT
    DEPTNO,
    ROUND(AVG(SAL), 1)
FROM EMP
GROUP BY DEPTNO;


-- 2. 각 부서별 인원 출력.
SELECT
    DEPTNO,
    COUNT(*)
FROM EMP
GROUP BY DEPTNO;


-- 3. 각 부서에서 급여가 1500이상인 사람의 부서별 사람 수 출력(부서명, 사람수 출력)
-- + 위 조건에 맞는 사람 수가 3명 이상인 부서만 출력
SELECT
    DEPTNO,
    COUNT(*)
FROM EMP
WHERE SAL >= 1500
GROUP BY DEPTNO
HAVING COUNT(*) >= 3;

