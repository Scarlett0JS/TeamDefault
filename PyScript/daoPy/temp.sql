CREATE SEQUENCE board_num
INCREMENT BY 1
START WITH 1;

CREATE TABLE board(
	num NUMBER NOT NULL,
	title varchar2(20) NOT NULL,
	content varchar2(2000) NOT NULL,
	writer varchar2(50) NOT NULL,
	indate DATE DEFAULT sysdate,
	count NUMBER DEFAULT 0,
	PRIMARY KEY (num)
);

CREATE TABLE member(
	memId varchar2(20) NOT NULL,
	memName varchar2(30),
	memPwd varchar2(30),
	PRIMARY key(memId)
);

CREATE SEQUENCE colSeq
INCREMENT BY 1
START WITH 1;

CREATE TABLE ColorMap(
	Col NUMBER NOT NULL,
	ColName varchar2(30) NOT NULL,
	ColRGB varchar2(20) NOT NULL,
	ColHtml varchar2(20) NOT NULL
);

CREATE SEQUENCE Extension_num
INCREMENT BY 1
START WITH
1;

CREATE TABLE Extension(
	ExtensionNum NUMBER NOT NULL,
	ExtensionName varchar2(100) NOT NULL,
	ExtensionProducer varchar2(30) NOT NULL,
	ExtensionDetail varchar2(500) NOT NULL,
	ExtensionUrl varchar2(200) NOT NULL,
	Category varchar2(30) NOT NULL
);

CREATE FUNCTION get_colorSeq RETURN NUMBER IS
BEGIN
	RETURN colSeq.nextval;
END;

CREATE FUNCTION get_extensionSeq RETURN NUMBER IS
BEGIN
	RETURN Extension_num.nextval;
END;


COMMIT;
