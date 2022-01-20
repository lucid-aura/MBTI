-- 테이블 생성
CREATE TABLE WORLDCUP(
        WORLDCUPSEQ NUMBER(8) PRIMARY KEY,
        BOARDSEQ NUMBER(8) NOT NULL,
        TOPIC VARCHAR2(50) NOT NULL, 
        WORLDCUPNAME VARCHAR2(50) NOT NULL,
        CHOICECOUNT NUMBER(8) NOT NULL
    );

-- 시퀸스 생성
CREATE SEQUENCE SEQ_WORLDCUP
START WITH 1 INCREMENT BY 1;

-- 제약조건 추가 (Boardseq)
ALTER TABLE WORLDCUP ADD CONSTRAINT FK_WORLDCUP
      FOREIGN KEY (BOARDSEQ)
      REFERENCES BOARDALL(BOARDSEQ)
      ON DELETE CASCADE;

-- 행 추가        
INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 1, 'food', 'porkBelly', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 2, 'food', 'steak', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 3, 'food', 'tteokbokki', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 4, 'food', 'chicken', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 5, 'food', 'gookbab', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 6, 'food', 'pasta', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 7, 'food', 'pizza', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 8, 'food', 'sushi', 0);

-- celebrity
INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 21, 'celebrity', '강호동', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 22, 'celebrity', '김연아', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 23, 'celebrity', '민경훈', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 24, 'celebrity', '웨렌버핏', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 25, 'celebrity', '유재석', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 26, 'celebrity', '', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 27, 'celebrity', 'pizza', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 28, 'celebrity', 'sushi', 0);


-- color
INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 41, 'color', '빨간색', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 42, 'color', '주황색', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 43, 'color', '노란색', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 44, 'color', '초록색', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 45, 'color', '파란색', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 46, 'color', '남색', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 47, 'color', '보라색', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 48, 'color', '검은색', 0);
-- 커밋   
commit;

-- 해당 토픽의 월드컵 게시판들 가져오기
SELECT WORLDCUPSEQ, BOARDSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT
FROM WORLDCUP
WHERE TOPIC='food';

SELECT BOARDSEQ
FROM WORLDCUP
WHERE WORLDCUPNAME='pizza';