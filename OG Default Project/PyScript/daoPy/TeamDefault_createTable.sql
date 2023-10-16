-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

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

COMMENT ON TABLE D_USER IS '���� ����'
;

COMMENT ON COLUMN D_USER.user_id IS '���� ���̵�'
;

COMMENT ON COLUMN D_USER.user_pw IS '���� ��й�ȣ'
;

COMMENT ON COLUMN D_USER.user_nick IS '���� �г���'
;

COMMENT ON COLUMN D_USER.user_joindate IS '���� ��������'
;

COMMENT ON COLUMN D_USER.user_type IS '���� ����. ���� ''user'', ������ ''admin'''
;

COMMENT ON COLUMN D_USER.user_status IS '���� ���'
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

COMMENT ON TABLE D_BOARD IS '�Խ���'
;

COMMENT ON COLUMN D_BOARD.d_seq IS '�� ����'
;

COMMENT ON COLUMN D_BOARD.d_title IS '�� ����'
;

COMMENT ON COLUMN D_BOARD.d_content IS '�� ����'
;

COMMENT ON COLUMN D_BOARD.d_file IS '�� ÷������'
;

COMMENT ON COLUMN D_BOARD.d_date IS '�� �ۼ�����'
;

COMMENT ON COLUMN D_BOARD.user_id IS '�� �ۼ���'
;

COMMENT ON COLUMN D_BOARD.d_cnt IS '�� ��ȸ��'
;

COMMENT ON COLUMN D_BOARD.d_category IS '�� ī�װ�'
;

COMMENT ON COLUMN D_BOARD.d_like IS '�� ���ƿ� ��'
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

COMMENT ON TABLE D_THEME IS '�׸�'
;

COMMENT ON COLUMN D_THEME.theme_seq IS '�׸� ����'
;

COMMENT ON COLUMN D_THEME.theme_name IS '�׸� ��'
;

COMMENT ON COLUMN D_THEME.theme_lang IS '�׸� ���'
;

COMMENT ON COLUMN D_THEME.theme_font IS '�׸� ��Ʈ'
;

COMMENT ON COLUMN D_THEME.theme_likes IS '�׸� ���ƿ��'
;

COMMENT ON COLUMN D_THEME.theme_col1 IS '�׸� �÷�1'
;

COMMENT ON COLUMN D_THEME.theme_col2 IS '�׸� �÷�2'
;

COMMENT ON COLUMN D_THEME.theme_col3 IS '�׸� �÷�3'
;

COMMENT ON COLUMN D_THEME.theme_col4 IS '�׸� �÷�4'
;

COMMENT ON COLUMN D_THEME.theme_col5 IS '�׸� �÷�5'
;

COMMENT ON COLUMN D_THEME.theme_producer IS '�׸� ������'
;

COMMENT ON COLUMN D_THEME.theme_filepath IS '�׸� ���ϰ��'
;

COMMENT ON COLUMN D_THEME.theme_url IS '�׸� ��ġ url'
;

COMMENT ON COLUMN D_THEME.theme_icon IS '�׸� ������ url'
;

COMMENT ON COLUMN D_THEME.theme_installcnt IS '�׸� ��ġ Ƚ��'
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

COMMENT ON TABLE D_COMMENT IS '���'
;

COMMENT ON COLUMN D_COMMENT.cmt_seq IS '��� ����'
;

COMMENT ON COLUMN D_COMMENT.p_seq IS '�Խñ� ����'
;

COMMENT ON COLUMN D_COMMENT.cmt_content IS '��� ����'
;

COMMENT ON COLUMN D_COMMENT.cmt_date IS '��� �ۼ�����'
;

COMMENT ON COLUMN D_COMMENT.user_id IS '��� �ۼ���'
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

COMMENT ON TABLE D_COLOR IS '�÷�'
;

COMMENT ON COLUMN D_COLOR.color_seq IS '�÷� ����'
;

COMMENT ON COLUMN D_COLOR.rgb_value IS 'RGB ��'
;

COMMENT ON COLUMN D_COLOR.html_code IS 'HTML �ڵ�'
;

COMMENT ON COLUMN D_COLOR.admin_id IS '������ ���̵�'
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

COMMENT ON TABLE D_USER_FAVS IS '���� ��ȣ �׸�'
;

COMMENT ON COLUMN D_USER_FAVS.uf_seq IS '������ȣ �׸�'
;

COMMENT ON COLUMN D_USER_FAVS.theme_seq IS '�׸� ����'
;

COMMENT ON COLUMN D_USER_FAVS.user_id IS '���� ���̵�'
;

COMMENT ON COLUMN D_USER_FAVS.reg_date IS '��� ����'
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

COMMENT ON TABLE d_board_favs IS '���� ��ȣ �Խñ�'
;

COMMENT ON COLUMN d_board_favs.db_seq IS '������ȣ �Խñ�'
;

COMMENT ON COLUMN d_board_favs.user_id IS '���� ���̵�'
;

COMMENT ON COLUMN d_board_favs.d_seq IS '�Խñ� ����'
;

COMMENT ON COLUMN d_board_favs.reg_date IS '�������'
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

COMMENT ON TABLE D_EXTENSION IS '�ͽ��ټ�'
;

COMMENT ON COLUMN D_EXTENSION.ex_seq IS '�ͽ��ټ� ����'
;

COMMENT ON COLUMN D_EXTENSION.ex_name IS '�ͽ��ټ� �̸�'
;

COMMENT ON COLUMN D_EXTENSION.ex_producer IS '�ͽ��ټ� ������'
;

COMMENT ON COLUMN D_EXTENSION.ex_detail IS '�ͽ��ټ� ��'
;

COMMENT ON COLUMN D_EXTENSION.user_id IS '������ ���̵�'
;

COMMENT ON COLUMN D_EXTENSION.ex_cnt IS '�ͽ��ټ� ��ġ��'
;

COMMENT ON COLUMN D_EXTENSION.ex_filepath IS '�ͽ��ټ� icon url'
;

COMMENT ON COLUMN D_EXTENSION.ex_url IS '�ͽ��ټ� url'
;

COMMENT ON COLUMN D_EXTENSION.ex_category IS '�ͽ��ټ� ī�װ�'
;

ALTER TABLE D_EXTENSION
    ADD CONSTRAINT FK_D_EXTENSION_user_id_D_USER_ FOREIGN KEY (user_id)
        REFERENCES D_USER (user_id)  
;

COMMIT;


