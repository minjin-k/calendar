SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS calendar;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE board
(
	num int NOT NULL,
	id varchar(15) NOT NULL,
	-- 1 : 공지사항
	-- 2 : 건의사항
	-- -----자유게시판 분류---
	-- 3 : 빅데이터개발
	-- 4 : 네트워크
	-- 5 : 스마트웹
	-- 6 : 빅데이터
	-- 7 : c샵
	code int NOT NULL COMMENT '1 : 공지사항
2 : 건의사항
-----자유게시판 분류---
3 : 빅데이터개발
4 : 네트워크
5 : 스마트웹
6 : 빅데이터
7 : c샵',
	name varchar(20),
	subject varchar(100) DEFAULT 'NULL',
	content varchar(4000) DEFAULT 'NULL',
	file1 varchar(100) DEFAULT 'NULL',
	regdate datetime DEFAULT NULL,
	readcnt int(20) DEFAULT NULL,
	ref int(20),
	reflevel int(20),
	refstep int(20),
	PRIMARY KEY (num)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE calendar
(
	no int NOT NULL,
	id varchar(15) NOT NULL,
	s_date date,
	e_date date,
	major varchar(20),
	subject varchar(100),
	content varchar(4000),
	PRIMARY KEY (no)
);


CREATE TABLE comment
(
	no int(11) NOT NULL,
	num int NOT NULL,
	id varchar(15) NOT NULL,
	code int(11),
	name varchar(20),
	content varchar(4000) DEFAULT 'NULL',
	regdate datetime DEFAULT NULL,
	ref int,
	reflevel int,
	refstep int,
	PRIMARY KEY (no)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE member
(
	id varchar(15) NOT NULL,
	major varchar(100) NOT NULL,
	pass varchar(20) DEFAULT 'NULL',
	name varchar(20) DEFAULT 'NULL',
	nick varchar(8),
	tel varchar(15) DEFAULT 'NULL',
	picture varchar(200) DEFAULT 'NULL',
	accept int,
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;



/* Create Foreign Keys */

ALTER TABLE comment
	ADD FOREIGN KEY (num)
	REFERENCES board (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE calendar
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



