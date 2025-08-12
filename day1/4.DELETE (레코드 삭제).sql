-- 4. DELETE (레코드 삭제)

SELECT * FROM STUDENT;

DELETE FROM STUDENT; -- 전체 삭제
ROLLBACK;

DELETE FROM STUDENT WHERE STU_NAME = '홍길동';
-- 테이블명(STUDENT)을 나중에 입력하면 전체 삭제 실수 방지

DELETE FROM STUDENT WHERE STU_NAME IN ('김철수', '홍길동');
COMMIT;