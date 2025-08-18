-- 프로시저

CREATE OR REPLACE PROCEDURE UPDATE_EMP_SAL
    (P_EMPNO IN EMP.EMPNO%TYPE) -- EMP 테이블의 EMPNO와 같은 타입으로 선언
IS
BEGIN
    UPDATE EMP
    SET
        SAL = SAL * 1.1
        WHERE EMPNO = P_EMPNO;
END;
/

SELECT * FROM EMP;

-- 프로시저 실행 => EXECUTE 프로시저명();
EXECUTE UPDATE_EMP_SAL(7369);
ROLLBACK;

-- UPDATE_EMP_SAL 프로시저에서 파라미터 값을 하나 더 받아서 해당 배율만큼 급여 증가

CREATE OR REPLACE PROCEDURE UPDATE_EMP_SAL
    (
        P_EMPNO IN EMP.EMPNO%TYPE,
        P_RATE IN NUMBER
    )
IS
BEGIN
    UPDATE EMP
    SET
        SAL = SAL * P_RATE
        WHERE EMPNO = P_EMPNO;
        COMMIT;
END;
/

EXECUTE UPDATE_EMP_SAL(7369, 1.5);
ROLLBACK;

---------------------

CREATE OR REPLACE PROCEDURE UPDATE_EMP_SAL
    (
        P_EMPNO IN EMP.EMPNO%TYPE,
        P_RATE IN NUMBER
    )
IS
    P_COUNT NUMBER; -- IN 생략 가능
BEGIN
    UPDATE EMP
    SET
        SAL = SAL * P_RATE
        WHERE EMPNO = P_EMPNO;
        P_COUNT := SQL%ROWCOUNT; -- '=' 하나는 양쪽 값이 같이 지에 대한 비교(TRUE OR FALSE 결과)
                      -- ':=' 는 오른쪽 값을 왼쪽에 넣는 것 (자바와 다름)
                      -- SQL%ROWCOUNT는 쿼리 실행결과가 몇개의 행(ROW)에 영향을 줬는가
        IF P_COUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('사번 확인해주세요');
        ELSIF P_COUNT = 1 THEN
            DBMS_OUTPUT.PUT_LINE('정상적으로 저장되었습니다');
        ELSE
            DBMS_OUTPUT.PUT_LINE('2개 이상이 저장되었습니다'); -- PK가 조건이므로 실행될 일은 없긴 함
        END IF;
        
        COMMIT;
END;
/

SET SERVEROUTPUT ON;
EXECUTE UPDATE_EMP_SAL(7369, 1.5);
ROLLBACK;
SELECT * FROM EMP;
