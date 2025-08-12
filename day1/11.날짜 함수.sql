-- 날짜 함수

-- 1) SYSDATE - 현재 시간 가져오기
-- 2) TO_CHAR - 날짜를 문자 포맷으로 , TO_DATE - 문자를 날짜 포맷으로
SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    TO_DATE('2025-10-15', 'YYYY-MM-DD')
FROM DUAL;
-- TO_CHAR : 첫번째 인자 값을 두번째 인자값 형식으로 출력하게 하는 함수
-- 분은 월과 겹치기에 MI로 표기, 시간 뒤에 24를 붙이면 24시간 형식


