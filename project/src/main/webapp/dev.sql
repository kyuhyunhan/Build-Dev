SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS Reply;
DROP TABLE IF EXISTS Board;
DROP TABLE IF EXISTS calendar;
DROP TABLE IF EXISTS File;
DROP TABLE IF EXISTS GoodOrBad;
DROP TABLE IF EXISTS Hash;
DROP TABLE IF EXISTS Message;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Report;
DROP TABLE IF EXISTS Setting;
DROP TABLE IF EXISTS Subscribe;
DROP TABLE IF EXISTS Tag;
DROP TABLE IF EXISTS User_group;
DROP TABLE IF EXISTS Working;
DROP TABLE IF EXISTS User;




/* Create Tables */

CREATE TABLE Board
(
	no int(11) NOT NULL,
	bno int(11) NOT NULL,
	name varchar(20) NOT NULL,
	title varchar(100),
	content varchar(4000),
	regdate datetime,
	open boolean,
	PRIMARY KEY (no, bno)
);


CREATE TABLE calendar
(
	gno int(11) NOT NULL,
	cno int(11) NOT NULL,
	subject varchar(100) NOT NULL,
	content varchar(4000),
	start datetime,
	end datetime,
	color varchar(20) NOT NULL,
	address varchar(50),
	PRIMARY KEY (gno, cno)
);


CREATE TABLE File
(
	-- 
	-- 
	no int(11) NOT NULL COMMENT '
',
	wno int(11) NOT NULL,
	fno int NOT NULL,
	name varchar(20),
	filename varchar(100),
	fileurl varchar(100),
	regdate datetime,
	PRIMARY KEY (no, wno, fno)
);


CREATE TABLE GoodOrBad
(
	no int(11) NOT NULL,
	wno int(11) NOT NULL,
	gno int(11) NOT NULL,
	name varchar(20),
	point int,
	regdate datetime,
	PRIMARY KEY (no, wno, gno)
);


CREATE TABLE Hash
(
	no int(11) NOT NULL,
	wno int(11) NOT NULL,
	hno int NOT NULL,
	hashname varchar(50),
	PRIMARY KEY (no, wno, hno)
);


CREATE TABLE Message
(
	meno int(11) NOT NULL,
	me_from varchar(20),
	me_to varchar(20),
	title varchar(100),
	content varchar(4000),
	regdate datetime,
	PRIMARY KEY (meno)
);


CREATE TABLE Project
(
	name varchar(20) NOT NULL,
	prono int(11) NOT NULL,
	subject varchar(100),
	num int(11),
	description varchar(4000),
	repository varchar(100),
	able boolean,
	start datetime,
	end datetime,
	PRIMARY KEY (name, prono)
);


CREATE TABLE Reply
(
	no int(11) NOT NULL,
	rno int(11) NOT NULL,
	bno int(11) NOT NULL,
	name varchar(20),
	content varchar(4000),
	regdate datetime,
	grp int(11),
	grplevel int(11),
	grpstep int(11),
	PRIMARY KEY (no, rno, bno)
);


CREATE TABLE Report
(
	no int(11) NOT NULL,
	wno int(11) NOT NULL,
	reno int(11) NOT NULL,
	name varchar(20),
	content varchar(4000),
	regdate datetime,
	PRIMARY KEY (no, wno, reno)
);


CREATE TABLE Setting
(
	name varchar(20) NOT NULL,
	name2 varchar(20) NOT NULL,
	regdate datetime,
	PRIMARY KEY (name, name2)
);


CREATE TABLE Subscribe
(
	scrapper varchar(20) NOT NULL,
	scrapped varchar(20) NOT NULL,
	PRIMARY KEY (scrapper, scrapped)
);


CREATE TABLE Tag
(
	no int(11) NOT NULL,
	wno int(11) NOT NULL,
	tno int(11) NOT NULL,
	tag varchar(50),
	PRIMARY KEY (no, wno, tno)
);


CREATE TABLE User
(
	name varchar(20) NOT NULL,
	uno int(11) NOT NULL,
	id varchar(10),
	pw varchar(15),
	email varchar(50),
	phone varchar(50),
	regdate datetime,
	auth varchar(10),
	alertnum int(11),
	giturl varchar(100),
	giturlable boolean,
	tilurl varchar(100),
	tilurlable boolean,
	content varchar(4000),
	open boolean,
	PRIMARY KEY (name)
);


CREATE TABLE User_group
(
	name varchar(20) NOT NULL,
	gno int(11) NOT NULL,
	lang varchar(50),
	chk varchar(20),
	auth varchar(20),
	comment varchar(100),
	PRIMARY KEY (name, gno)
);


CREATE TABLE Working
(
	gno int(11) NOT NULL,
	name varchar(20) NOT NULL,
	title varchar(100),
	category varchar(20),
	content varchar(4000),
	maxnum int(11),
	startdate datetime,
	enddate datetime,
	deadline datetime,
	process varchar(20),
	grade varchar(100),
	loc varchar(200),
	regdate datetime,
	PRIMARY KEY (gno)
);



/* Create Foreign Keys */

ALTER TABLE Reply
	ADD FOREIGN KEY (no, bno)
	REFERENCES Board (no, bno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Board
	ADD FOREIGN KEY (name)
	REFERENCES User (name)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Message
	ADD FOREIGN KEY (me_to)
	REFERENCES User (name)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Message
	ADD FOREIGN KEY (me_from)
	REFERENCES User (name)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Project
	ADD FOREIGN KEY (name)
	REFERENCES User (name)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Setting
	ADD FOREIGN KEY (name)
	REFERENCES User (name)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Subscribe
	ADD FOREIGN KEY (scrapped)
	REFERENCES User (name)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Subscribe
	ADD FOREIGN KEY (scrapper)
	REFERENCES User (name)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE User_group
	ADD FOREIGN KEY (name)
	REFERENCES User (name)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Working
	ADD FOREIGN KEY (name)
	REFERENCES User (name)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE calendar
	ADD FOREIGN KEY (gno)
	REFERENCES Working (gno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE User_group
	ADD FOREIGN KEY (gno)
	REFERENCES Working (gno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



