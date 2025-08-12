1. NVL (Null Value Logic)
NVL 함수는 첫 번째 인자가 NULL일 경우 두 번째 인자를 반환,
첫 번째 인자가 NULL이 아니라면 첫 번째 인자를 그대로 반환

SELECT NVL(COMM, 0) 
FROM EMP;

2. NVL2 (Null Value Logic 2)
NVL2 함수는 첫 번째 인자가 NULL이 아닌 경우 두 번째 인자를 반환하고, 
첫 번째 인자가 NULL인 경우 세 번째 인자를 반환

SELECT NVL2(COMM, 100, 200) 
FROM EMP;

3. DECODE (Conditional Expression)
DECODE 함수는 주어진 표현식의 값을 비교하여 특정 값을 반환하는 조건문과 유사한 역할

SELECT DECODE(JOB, 'MANAGER', '매니저', 'SALESMAN', '세일즈', '그외') 
FROM EMP;

4. CASE WHEN (Conditional Logic)
CASE 문은 조건에 맞는 값을 반환하는 조건문으로, DECODE보다 더 복잡한 조건을 처리할 수 있음

SELECT 
    CASE 
        WHEN SAL >= 4000 THEN '많이받음'
        WHEN SAL BETWEEN 2000 AND 4000 THEN '적당히받음'
        ELSE '적게받음'
    END 
FROM EMP;