CREATE TABLE WORLDCUP(
        WORLDCUPSEQ NUMBER(8) PRIMARY KEY,
        TOPIC VARCHAR2(50) NOT NULL, 
        WORLDCUPNAME VARCHAR2(50) NOT NULL,
        CHOICECOUNT NUMBER(8) NOT NULL
    );
    
CREATE SEQUENCE SEQ_WORLDCUP
START WITH 1 INCREMENT BY 1;

INSERT INTO WORLDCUP(WORLDCUPSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 'food', 'porkBelly', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 'food', 'steak', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 'food', 'tteokbokki', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 'food', 'chicken', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 'food', 'gookbab', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 'food', 'pasta', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 'food', 'pizza', 0);

INSERT INTO WORLDCUP(WORLDCUPSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT)
VALUES(SEQ_WORLDCUP.NEXTVAL, 'food', 'sushi', 0);
    
commit;

SELECT WORLDCUPSEQ, TOPIC, WORLDCUPNAME, CHOICECOUNT
FROM WORLDCUP
WHERE TOPIC='food';