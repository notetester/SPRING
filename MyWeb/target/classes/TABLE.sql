CREATE SEQUENCE FREEBOARD_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE TABLE FREEBOARD(
    BNO NUMBER(10,0) DEFAULT FREEBOARD_SEQ.NEXTVAL NOT NULL,
    TITLE VARCHAR2(300) DEFAULT '제목' NOT NULL,
    WRITER VARCHAR2(50) DEFAULT '글쓴이' NOT NULL,
    CONTENT VARCHAR2(2000) DEFAULT '내용' NOT NULL,
    REGDATE DATE DEFAULT SYSDATE NOT NULL,
    UPDATEDATE DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE FREEBOARD ADD CONSTRAINT FREEBOARD_PK PRIMARY KEY (BNO);
CREATE SEQUENCE FREEREPLY_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE TABLE FREEREPLY(
    RNO NUMBER(10,0) DEFAULT FREEREPLY_SEQ.NEXTVAL NOT NULL,
    BNO NUMBER(10,0) DEFAULT 1 NOT NULL,
    REPLY VARCHAR2(1000) DEFAULT '댓글' NOT NULL,
    REPLYID VARCHAR2(50) DEFAULT '아이디' NOT NULL,
    REPLYPW VARCHAR2(50) DEFAULT '비밀번호' NOT NULL,
    REPLYDATE DATE DEFAULT SYSDATE NOT NULL,
    UPDATEDATE DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE FREEREPLY ADD CONSTRAINT FREEREPLY_PK PRIMARY KEY (RNO);