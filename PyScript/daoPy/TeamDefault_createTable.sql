-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- D_USER Table Create SQL
CREATE TABLE D_USER
(
    user_id          VARCHAR2(30)    NOT NULL, 
    user_pw          VARCHAR2(30)    NOT NULL, 
    user_nick        VARCHAR2(20)    NOT NULL, 
    user_joindate    DATE            DEFAULT SYSDATE NOT NULL, 
    user_type        VARCHAR2(10)    DEFAULT 'user' NOT NULL, 
    user_status      VARCHAR2(20)    DEFAULT 'D' NULL, 
     PRIMARY KEY (user_id)
)
;

COMMENT ON TABLE D_USER IS '유저 정보'
;

COMMENT ON COLUMN D_USER.user_id IS '유저 아이디'
;

COMMENT ON COLUMN D_USER.user_pw IS '유저 비밀번호'
;

COMMENT ON COLUMN D_USER.user_nick IS '유저 닉네임'
;

COMMENT ON COLUMN D_USER.user_joindate IS '유저 가입일자'
;

COMMENT ON COLUMN D_USER.user_type IS '유저 유형. 유저 ''user'', 관리자 ''admin'''
;

COMMENT ON COLUMN D_USER.user_status IS '유저 등급'
;


-- D_BOARD Table Create SQL
CREATE TABLE D_BOARD
(
    d_seq         NUMBER(12, 0)     NOT NULL, 
    d_title       VARCHAR2(300)     NOT NULL, 
    d_content     VARCHAR2(4000)    NOT NULL, 
    d_file        VARCHAR2(300)     DEFAULT 'c:;' NULL, 
    d_date        DATE              DEFAULT SYSDATE NOT NULL, 
    user_id       VARCHAR2(30)      NOT NULL, 
    d_cnt         NUMBER(12, 0)     DEFAULT 0 NOT NULL, 
    d_category    VARCHAR2(20)      NULL, 
    d_like        NUMBER(12, 0)     DEFAULT 0 NULL, 
     PRIMARY KEY (d_seq)
)
;

CREATE SEQUENCE D_BOARD_SEQ
START WITH 1
INCREMENT BY 1;
;

CREATE OR REPLACE TRIGGER D_BOARD_AI_TRG
BEFORE INSERT ON D_BOARD 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT D_BOARD_SEQ.NEXTVAL
    INTO :NEW.d_seq
    FROM DUAL;
END;
;

--DROP TRIGGER D_BOARD_AI_TRG; ;

--DROP SEQUENCE D_BOARD_SEQ; ;

COMMENT ON TABLE D_BOARD IS '게시판'
;

COMMENT ON COLUMN D_BOARD.d_seq IS '글 순번'
;

COMMENT ON COLUMN D_BOARD.d_title IS '글 제목'
;

COMMENT ON COLUMN D_BOARD.d_content IS '글 내용'
;

COMMENT ON COLUMN D_BOARD.d_file IS '글 첨부파일'
;

COMMENT ON COLUMN D_BOARD.d_date IS '글 작성일자'
;

COMMENT ON COLUMN D_BOARD.user_id IS '글 작성자'
;

COMMENT ON COLUMN D_BOARD.d_cnt IS '글 조회수'
;

COMMENT ON COLUMN D_BOARD.d_category IS '글 카테고리'
;

COMMENT ON COLUMN D_BOARD.d_like IS '글 좋아요 수'
;

ALTER TABLE D_BOARD
    ADD CONSTRAINT FK_D_BOARD_user_id_D_USER_user FOREIGN KEY (user_id)
        REFERENCES D_USER (user_id)  
;


-- D_THEME Table Create SQL
CREATE TABLE D_THEME
(
    theme_seq           NUMBER(12, 0)    NOT NULL, 
    theme_name          VARCHAR2(60)     NOT NULL, 
    theme_lang          VARCHAR2(20)     NOT NULL, 
    theme_font          VARCHAR2(30)     NOT NULL, 
    theme_likes         NUMBER(12, 0)    DEFAULT 0 NOT NULL, 
    theme_col1          VARCHAR2(20)     NOT NULL, 
    theme_col2          VARCHAR2(20)     NOT NULL, 
    theme_col3          VARCHAR2(20)     NOT NULL, 
    theme_col4          VARCHAR2(20)     NOT NULL, 
    theme_col5          VARCHAR2(20)     NOT NULL, 
    theme_producer      VARCHAR2(50)     NOT NULL, 
    theme_filepath      VARCHAR2(400)    NOT NULL, 
    theme_url           VARCHAR2(400)    NOT NULL, 
    theme_icon          VARCHAR2(400)    NOT NULL, 
    theme_installcnt    NUMBER(12, 0)    NOT NULL, 
     PRIMARY KEY (theme_seq)
)
;

CREATE SEQUENCE D_THEME_SEQ
START WITH 1
INCREMENT BY 1;
;

CREATE OR REPLACE TRIGGER D_THEME_AI_TRG
BEFORE INSERT ON D_THEME 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT D_THEME_SEQ.NEXTVAL
    INTO :NEW.theme_seq
    FROM DUAL;
END;
;

--DROP TRIGGER D_THEME_AI_TRG; ;

--DROP SEQUENCE D_THEME_SEQ; ;

COMMENT ON TABLE D_THEME IS '테마'
;

COMMENT ON COLUMN D_THEME.theme_seq IS '테마 순번'
;

COMMENT ON COLUMN D_THEME.theme_name IS '테마 명'
;

COMMENT ON COLUMN D_THEME.theme_lang IS '테마 언어'
;

COMMENT ON COLUMN D_THEME.theme_font IS '테마 폰트'
;

COMMENT ON COLUMN D_THEME.theme_likes IS '테마 좋아요수'
;

COMMENT ON COLUMN D_THEME.theme_col1 IS '테마 컬러1'
;

COMMENT ON COLUMN D_THEME.theme_col2 IS '테마 컬러2'
;

COMMENT ON COLUMN D_THEME.theme_col3 IS '테마 컬러3'
;

COMMENT ON COLUMN D_THEME.theme_col4 IS '테마 컬러4'
;

COMMENT ON COLUMN D_THEME.theme_col5 IS '테마 컬러5'
;

COMMENT ON COLUMN D_THEME.theme_producer IS '테마 제작자'
;

COMMENT ON COLUMN D_THEME.theme_filepath IS '테마 파일경로'
;

COMMENT ON COLUMN D_THEME.theme_url IS '테마 설치 url'
;

COMMENT ON COLUMN D_THEME.theme_icon IS '테마 아이콘 url'
;

COMMENT ON COLUMN D_THEME.theme_installcnt IS '테마 설치 횟수'
;


-- D_COMMENT Table Create SQL
CREATE TABLE D_COMMENT
(
    cmt_seq        NUMBER(12, 0)     NOT NULL, 
    p_seq          NUMBER(12, 0)     NOT NULL, 
    cmt_content    VARCHAR2(4000)    NOT NULL, 
    cmt_date       DATE              DEFAULT SYSDATE NOT NULL, 
    user_id        VARCHAR2(30)      NOT NULL, 
     PRIMARY KEY (cmt_seq)
)
;

CREATE SEQUENCE D_COMMENT_SEQ
START WITH 1
INCREMENT BY 1;
;

CREATE OR REPLACE TRIGGER D_COMMENT_AI_TRG
BEFORE INSERT ON D_COMMENT 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT D_COMMENT_SEQ.NEXTVAL
    INTO :NEW.cmt_seq
    FROM DUAL;
END;
;

--DROP TRIGGER D_COMMENT_AI_TRG; ;

--DROP SEQUENCE D_COMMENT_SEQ; ;

COMMENT ON TABLE D_COMMENT IS '댓글'
;

COMMENT ON COLUMN D_COMMENT.cmt_seq IS '댓글 순번'
;

COMMENT ON COLUMN D_COMMENT.p_seq IS '게시글 순번'
;

COMMENT ON COLUMN D_COMMENT.cmt_content IS '댓글 내용'
;

COMMENT ON COLUMN D_COMMENT.cmt_date IS '댓글 작성일자'
;

COMMENT ON COLUMN D_COMMENT.user_id IS '댓글 작성자'
;

ALTER TABLE D_COMMENT
    ADD CONSTRAINT FK_D_COMMENT_p_seq_D_BOARD_d_s FOREIGN KEY (p_seq)
        REFERENCES D_BOARD (d_seq)  
;

ALTER TABLE D_COMMENT
    ADD CONSTRAINT FK_D_COMMENT_user_id_D_USER_us FOREIGN KEY (user_id)
        REFERENCES D_USER (user_id)  
;


-- D_COLOR Table Create SQL
CREATE TABLE D_COLOR
(
    color_seq    NUMBER(12, 0)    NOT NULL, 
    rgb_value    VARCHAR2(20)     NOT NULL, 
    html_code    VARCHAR2(30)     NOT NULL, 
    admin_id     VARCHAR2(30)     NOT NULL, 
     PRIMARY KEY (color_seq)
)
;

CREATE SEQUENCE D_COLOR_SEQ
START WITH 1
INCREMENT BY 1;
;

CREATE OR REPLACE TRIGGER D_COLOR_AI_TRG
BEFORE INSERT ON D_COLOR 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT D_COLOR_SEQ.NEXTVAL
    INTO :NEW.color_seq
    FROM DUAL;
END;
;

--DROP TRIGGER D_COLOR_AI_TRG; ;

--DROP SEQUENCE D_COLOR_SEQ; ;

COMMENT ON TABLE D_COLOR IS '컬러'
;

COMMENT ON COLUMN D_COLOR.color_seq IS '컬러 순번'
;

COMMENT ON COLUMN D_COLOR.rgb_value IS 'RGB 값'
;

COMMENT ON COLUMN D_COLOR.html_code IS 'HTML 코드'
;

COMMENT ON COLUMN D_COLOR.admin_id IS '관리자 아이디'
;

ALTER TABLE D_COLOR
    ADD CONSTRAINT FK_D_COLOR_admin_id_D_USER_use FOREIGN KEY (admin_id)
        REFERENCES D_USER (user_id)  
;


-- D_USER_FAVS Table Create SQL
CREATE TABLE D_USER_FAVS
(
    uf_seq       NUMBER(12, 0)    NOT NULL, 
    theme_seq    NUMBER(12, 0)    NOT NULL, 
    user_id      VARCHAR2(30)     NOT NULL, 
    reg_date     DATE             DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (uf_seq)
)
;

CREATE SEQUENCE D_USER_FAVS_SEQ
START WITH 1
INCREMENT BY 1;
;

CREATE OR REPLACE TRIGGER D_USER_FAVS_AI_TRG
BEFORE INSERT ON D_USER_FAVS 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT D_USER_FAVS_SEQ.NEXTVAL
    INTO :NEW.uf_seq
    FROM DUAL;
END;
;

--DROP TRIGGER D_USER_FAVS_AI_TRG; ;

--DROP SEQUENCE D_USER_FAVS_SEQ; ;

COMMENT ON TABLE D_USER_FAVS IS '유저 선호 테마'
;

COMMENT ON COLUMN D_USER_FAVS.uf_seq IS '유저선호 테마'
;

COMMENT ON COLUMN D_USER_FAVS.theme_seq IS '테마 순번'
;

COMMENT ON COLUMN D_USER_FAVS.user_id IS '유저 아이디'
;

COMMENT ON COLUMN D_USER_FAVS.reg_date IS '등록 일자'
;

ALTER TABLE D_USER_FAVS
    ADD CONSTRAINT FK_D_USER_FAVS_user_id_D_USER_ FOREIGN KEY (user_id)
        REFERENCES D_USER (user_id)  
;

ALTER TABLE D_USER_FAVS
    ADD CONSTRAINT FK_D_USER_FAVS_theme_seq_D_THE FOREIGN KEY (theme_seq)
        REFERENCES D_THEME (theme_seq)  
;


-- d_board_favs Table Create SQL
CREATE TABLE d_board_favs
(
    db_seq      NUMBER(12, 0)    NOT NULL, 
    user_id     VARCHAR2(30)     NOT NULL, 
    d_seq       NUMBER(12, 0)    NOT NULL, 
    reg_date    DATE             DEFAULT sysdate NOT NULL, 
     PRIMARY KEY (db_seq)
)
;

CREATE SEQUENCE d_board_favs_SEQ
START WITH 1
INCREMENT BY 1;
;

CREATE OR REPLACE TRIGGER d_board_favs_AI_TRG
BEFORE INSERT ON d_board_favs 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT d_board_favs_SEQ.NEXTVAL
    INTO :NEW.db_seq
    FROM DUAL;
END;
;

--DROP TRIGGER d_board_favs_AI_TRG; ;

--DROP SEQUENCE d_board_favs_SEQ; ;

COMMENT ON TABLE d_board_favs IS '유저 선호 게시글'
;

COMMENT ON COLUMN d_board_favs.db_seq IS '유저선호 게시글'
;

COMMENT ON COLUMN d_board_favs.user_id IS '유저 아이디'
;

COMMENT ON COLUMN d_board_favs.d_seq IS '게시글 순번'
;

COMMENT ON COLUMN d_board_favs.reg_date IS '등록일자'
;

ALTER TABLE d_board_favs
    ADD CONSTRAINT FK_d_board_favs_user_id_D_USER FOREIGN KEY (user_id)
        REFERENCES D_USER (user_id)  
;

ALTER TABLE d_board_favs
    ADD CONSTRAINT FK_d_board_favs_d_seq_D_BOARD_ FOREIGN KEY (d_seq)
        REFERENCES D_BOARD (d_seq)  
;


-- D_EXTENSION Table Create SQL
CREATE TABLE D_EXTENSION
(
    ex_seq         NUMBER(12, 0)    NOT NULL, 
    ex_name        VARCHAR2(50)     NOT NULL, 
    ex_producer    VARCHAR2(50)     NOT NULL, 
    ex_detail      VARCHAR2(800)    NOT NULL, 
    user_id        VARCHAR2(30)     NOT NULL, 
    ex_cnt         VARCHAR2(30)     NOT NULL, 
    ex_filepath    VARCHAR2(400)    NOT NULL, 
    ex_url         VARCHAR2(400)    NOT NULL, 
    ex_category    VARCHAR2(10)     NOT NULL, 
     PRIMARY KEY (ex_seq)
)
;

CREATE SEQUENCE D_EXTENSION_SEQ
START WITH 1
INCREMENT BY 1;
;

CREATE OR REPLACE TRIGGER D_EXTENSION_AI_TRG
BEFORE INSERT ON D_EXTENSION 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT D_EXTENSION_SEQ.NEXTVAL
    INTO :NEW.ex_seq
    FROM DUAL;
END;
;

--DROP TRIGGER D_EXTENSION_AI_TRG; ;

--DROP SEQUENCE D_EXTENSION_SEQ; ;

COMMENT ON TABLE D_EXTENSION IS '익스텐션'
;

COMMENT ON COLUMN D_EXTENSION.ex_seq IS '익스텐션 순번'
;

COMMENT ON COLUMN D_EXTENSION.ex_name IS '익스텐션 이름'
;

COMMENT ON COLUMN D_EXTENSION.ex_producer IS '익스텐션 제작자'
;

COMMENT ON COLUMN D_EXTENSION.ex_detail IS '익스텐션 상세'
;

COMMENT ON COLUMN D_EXTENSION.user_id IS '관리자 아이디'
;

COMMENT ON COLUMN D_EXTENSION.ex_cnt IS '익스텐션 설치수'
;

COMMENT ON COLUMN D_EXTENSION.ex_filepath IS '익스텐션 icon url'
;

COMMENT ON COLUMN D_EXTENSION.ex_url IS '익스텐션 url'
;

COMMENT ON COLUMN D_EXTENSION.ex_category IS '익스텐션 카테고리'
;

ALTER TABLE D_EXTENSION
    ADD CONSTRAINT FK_D_EXTENSION_user_id_D_USER_ FOREIGN KEY (user_id)
        REFERENCES D_USER (user_id)  
;

COMMIT;


