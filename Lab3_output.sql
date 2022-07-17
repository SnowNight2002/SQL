
--Database Principles Lab 3
drop table Publisher cascade constraints;
drop table Category cascade constraints;
drop table Book cascade constraints;
drop table Author cascade constraints;
drop table BookAuthor cascade constraints;


--Task 2
create table Publisher(
publisherID CHAR(2) NOT NULL,
publisherName VARCHAR(50) NOT NULL,
address VARCHAR(250) NULL,
CONSTRAINT Publisher_pk PRIMARY KEY (publisherID)
);

create table Category(
catID CHAR(2) NOT NULL,
category VARCHAR(50) NOT NULL,
CONSTRAINT Category_pk PRIMARY KEY (catID)
);

create table Book(
bookID NUMBER(2) NOT NULL,
title VARCHAR(50) NOT NULL,
catID CHAR(2) NULL,
copyrightYear NUMBER(2) NULL,
isbnNumber VARCHAR(50) NULL,
publisherID CHAR(2) NULL,
purchasePrice NUMBER(4,2) NULL,
coverType VARCHAR(10) NULL,
datePurchased date DEFAULT SYSDATE,
pages NUMBER(4) NULL,
CONSTRAINT Book_pk PRIMARY KEY (bookID),
CONSTRAINT Book_publisherID_fk FOREIGN KEY (publisherID)
REFERENCES  Publisher(publisherID)
);

create table Author(
authorID CHAR(2) NOT NULL,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
qualification VARCHAR(10) NULL,
gender VARCHAR(1) NULL,
CONSTRAINT Author_pk PRIMARY KEY (authorID),
CONSTRAINT Author_gender_cc CHECK (gender IN ('M','F','m','f'))
);

create table BookAuthor(
bookID NUMBER(4) NOT NULL,
authorID CHAR(2) NOT NULL,
CONSTRAINT BookAuthor_pk PRIMARY KEY (bookID,authorID),
CONSTRAINT  BookAuthor_fk1  FOREIGN KEY  (bookID) 
 REFERENCES Book(bookID),
CONSTRAINT  BookAuthor_fk2  FOREIGN KEY  (authorID) 
 REFERENCES Author(authorID)
);


--Task 3

INSERT INTO Publisher VALUES('NE','New 2000 Publishing','Hong Kong');
INSERT INTO Publisher VALUES('SA','South Asia Limited','Singapore');
INSERT INTO Publisher VALUES('OR','Oriental Publishing','Taiwan');

INSERT INTO Category VALUES('PS','Fiction');
INSERT INTO Category VALUES('BU','Business');
INSERT INTO Category VALUES('RO','Relaxation');
INSERT INTO Category VALUES('HE','Technical');

INSERT INTO Book VALUES(1,'Dirk Luchte','PS',93,NULL,'NE',23.50,'Hard','23-NOV-93',1012);
INSERT INTO Book VALUES(2,'Planning Your Career','BU',90,NULL,'SA',22.95,'Hard','23-DEC-94',395);
INSERT INTO Book VALUES(3,'Diamonds','RO',94,NULL,'OR',9.95,'Paperback','12-JAN-94',593);
INSERT INTO Book VALUES(4,'Techniques of Transportation','HE',93,NULL,'OR',25.95,'Hard','27-OCT-93',236);
INSERT INTO Book VALUES(5,'My Family','PS',93,NULL,'NE',17.95,'Paperback','13-JUL-93',226);


INSERT INTO Author VALUES('CA','Laura','Callahan',NULL,'F');
INSERT INTO Author VALUES('DA','Nancy','Davolio','B.A.','F');
INSERT INTO Author VALUES('FU','Andrew','Fuller','Ph.D.','M');
INSERT INTO Author VALUES('LE','Janet','Leverling','M.A.','F');
INSERT INTO Author VALUES('PE','Margaret','Peacock',NULL,'F');


INSERT INTO BookAuthor VALUES(3,'LE');
INSERT INTO BookAuthor VALUES(1,'CA');
INSERT INTO BookAuthor VALUES(5,'FU');
INSERT INTO BookAuthor VALUES(2,'DA');
INSERT INTO BookAuthor VALUES(4,'PE');







--Task 4

/* the first insert statement can be run sucessfully.
the second insert statement cannot be run sucessfully.
it is because gender is only can accept ('M','F','m','f'), 'n' is not accepted. */

--Task 5
ALTER TABLE Publisher
ADD  (phoneNumber  NUMBER(5,2) NULL); 
--Task 6
ALTER TABLE Publisher
MODIFY  (phoneNumber NUMBER(8));

--Task 7
ALTER TABLE Book
MODIFY  (purchasePrice DEFAULT 0.0);

--Task 8
ALTER TABLE Book
ADD CONSTRAINT  Book_catID_fk  FOREIGN KEY  (catID)
REFERENCES Category(catID);

--Task 9

ALTER TABLE  Book 
DROP  CONSTRAINT  Book_publisherID_fk;

--Task 10
UPDATE Author
  SET qualification = 'M.A.'
  WHERE firstName = 'Laura';

UPDATE Author
  SET qualification = NULL
  WHERE firstName = 'Janet';

--Task 11

UPDATE Book
 SET purchasePrice = purchasePrice*0.85;

--Task 12

DELETE FROM Publisher
 WHERE publisherName = 'Oriental Publishing';

--Task 13

DELETE FROM BookAuthor
 WHERE authorID = 'PE';

DELETE FROM Author
 WHERE firstName = 'Margaret';

--Task 14


ALTER TABLE  Book 
DROP  (datePurchased); 
ALTER TABLE Book
ADD  (datePurchased DATE DEFAULT SYSDATE); 
SELECT datePurchased FROM book;

spool off
set echo off