-- 시퀀스(SEQ)

INSERT INTO BOARD -- 게시판 성격을 가지는 테이블
VALUES (1, ' 첫번째게시글', '내용111', 'test');
-- 첫번째 인자값이 게시글번호인데 매번 입력시마다 최근 글번호 확인하고 입력할 수 없음


CREATE SEQUENCE BOARD_SEQ
    INCREMENT BY 1 -- 증가시키려는 수
    START WITH 1; -- 시작하려는 숫자
    
-- 옵션
--    MINVALUE 1 -- 시퀀스의 최소값
--    MAXVALUE 99999 -- 시퀀스의 최대값
--    NOCYCLE;
-- DROP SEQUENCE BOARD_SEQ; 시퀀스 생성 취소

CREATE SEQUENCE TEST_SEQ
    INCREMENT BY 1 -- 증가시키려는 수
    START WITH 1;

SELECT TEST_SEQ.NEXTVAL
FROM DUAL;
-- 한번 실행할때마다 1씩 증가

INSERT INTO BOARD
VALUES (BOARD_SEQ.NEXTVAL, '첫번째게시글', '내용111', 'test');
INSERT INTO BOARD
VALUES (BOARD_SEQ.NEXTVAL, '두번째게시글', '내용222', 'test');
INSERT INTO BOARD
VALUES (BOARD_SEQ.NEXTVAL, 'qqqq', 'ddddd', 'test');
SELECT * FROM BOARD;
-- BOARD_SEQ.NEXTVAL을 첫번째 인자값으로 넣어 실행해주면 실행할때마다 게시글 번호는 1씩 증가하며 테이블에 레코드 입력한다
COMMIT;


