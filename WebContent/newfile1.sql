SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS Order_history;
DROP TABLE IF EXISTS product_chat;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS trailer_comment;
DROP TABLE IF EXISTS trailer;
DROP TABLE IF EXISTS user_review;
DROP TABLE IF EXISTS User_general;




/* Create Tables */

CREATE TABLE Order_history
(
	order_num int NOT NULL AUTO_INCREMENT,
	order_date  timestamp,
	order_qnt int NOT NULL,
	product_id int NOT NULL,
	user_id varchar(20) NOT NULL,
	PRIMARY KEY (order_num)
);


CREATE TABLE product
(
	product_id int NOT NULL AUTO_INCREMENT,
	product_name varchar(25) NOT NULL,
	product_title varchar(80) NOT NULL,
	product_price int NOT NULL,
	product_image varchar(300),
	product_category int NOT NULL,
	product_detail varchar(3000) NOT NULL,
	user_id varchar(20) NOT NULL,
	aws_url varchar(200),
	trailer_id int,
	user_charn varchar(200) NOT NULL,
	PRIMARY KEY (product_id),
	UNIQUE (product_id)
);


CREATE TABLE product_chat
(
	chat_id int NOT NULL AUTO_INCREMENT,
	chat_content varchar(200) NOT NULL,
	chat_date timestamp NOT NULL,
	user_id varchar(20) NOT NULL,
	product_id int NOT NULL,
	PRIMARY KEY (chat_id),
	UNIQUE (user_id),
	UNIQUE (product_id)
);


CREATE TABLE trailer
(
	trailer_id int NOT NULL AUTO_INCREMENT,
	trailer_name varchar(25) NOT NULL,
	trailer_title varchar(50) NOT NULL,
	trailer_price int NOT NULL,
	trailer_image varchar(300),
	trailer_aws_url varchar(300) NOT NULL,
	trailer_detail varchar(2500) NOT NULL,
	trailer_launchdate timestamp NOT NULL,
	trailer_updatedate timestamp NOT NULL,
	user_id varchar(20) NOT NULL,
	PRIMARY KEY (trailer_id),
	UNIQUE (user_id)
);


CREATE TABLE trailer_comment
(
	comment_id int NOT NULL AUTO_INCREMENT,
	comment_content varchar(200) NOT NULL,
	comment_date timestamp NOT NULL,
	user_id varchar(20) NOT NULL,
	trailer_id int NOT NULL,
	PRIMARY KEY (comment_id),
	UNIQUE (user_id)
);


CREATE TABLE User_general
(
	user_id varchar(20) NOT NULL,
	user_pw varchar(20) NOT NULL,
	user_name varchar(10) NOT NULL,
	user_phone varchar(20) NOT NULL,
	user_addr varchar(30),
	user_addr2 varchar(20) NOT NULL,
	user_email varchar(30) NOT NULL,
	user_corp int(5) NOT NULL,
	PRIMARY KEY (user_id),
	UNIQUE (user_id),
	UNIQUE (user_email)
);


CREATE TABLE user_review
(
	review_id int NOT NULL AUTO_INCREMENT,
	review_content varchar(200) NOT NULL,
	review_date timestamp NOT NULL,
	review_scope int(5) NOT NULL,
	user_id varchar(20) NOT NULL,
	PRIMARY KEY (review_id),
	UNIQUE (user_id)
);



/* Create Foreign Keys */

ALTER TABLE Order_history
	ADD FOREIGN KEY (product_id)
	REFERENCES product (product_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE product_chat
	ADD FOREIGN KEY (product_id)
	REFERENCES product (product_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE trailer_comment
	ADD FOREIGN KEY (trailer_id)
	REFERENCES trailer (trailer_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Order_history
	ADD FOREIGN KEY (user_id)
	REFERENCES User_general (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE product
	ADD FOREIGN KEY (user_id)
	REFERENCES User_general (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE product_chat
	ADD FOREIGN KEY (user_id)
	REFERENCES User_general (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE trailer
	ADD FOREIGN KEY (user_id)
	REFERENCES User_general (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE trailer_comment
	ADD FOREIGN KEY (user_id)
	REFERENCES User_general (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE user_review
	ADD FOREIGN KEY (user_id)
	REFERENCES User_general (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



