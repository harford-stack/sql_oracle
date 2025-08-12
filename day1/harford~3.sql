-- 2. UPDATE (테이블의 특정 컬럼에 있는 데이터를 수정)

SELECT * 
FROM STUDENT;

UPDATE STUDENT
SET
    STU_HEIGHT = 175; -- 모든 학생들의 키가 175로 바뀜
-- 데이터 수정 시 조건을 정확하게 설정하는 것이 중요
    
-- 위 명령어로 아직 수정이 확실한게 아님
-- 수정을 확정하고 싶다면 커밋을 하면 된다
-- 데이터 변경 (수정 및 삭제, 삽입) 확정은 COMMIT을 해줘야 적용된다
-- 그 전에는 ROLLBACK 명령어로 되돌리기 가능
    
ROLLBACK; -- 조건부 발동 ( 커밋 후에는 사용 불가 )
-- 데이터 변경 (수정 및 삭제, 삽입)

UPDATE STUDENT
SET
    STU_HEIGHT = 175
WHERE STU_NAME = '박희철';
COMMIT;
ROLLBACK;


UPDATE STUDENT
SET
    STU_HEIGHT = STU_HEIGHT + 1,
    STU_WEIGHT = STU_WEIGHT - 1
WHERE STU_DEPT = '기계';
COMMIT;
