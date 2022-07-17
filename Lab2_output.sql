
--Database Principles Lab 2
drop table Inventory ;
drop table Item ;
drop table Color ;


--Task 2
create table Item(
itemId NUMBER(8) NOT NULL,
itemDesc VARCHAR2(20) NOT NULL,
category VARCHAR2(15) NOT NULL,
CONSTRAINT Item_pk PRIMARY KEY (itemId)
);

create table Color(
color VARCHAR2(20) NOT NULL,
CONSTRAINT Color_pk PRIMARY KEY (color)
);

create table Inventory(
invId NUMBER(10) NOT NULL,
itemId NUMBER(8) NOT NULL,
itemSize VARCHAR2(10) NULL,
color VARCHAR2(20) NOT NULL,
currPrice NUMBER(6,2) NOT NULL,
qoh NUMBER(4) NOT NULL,
CONSTRAINT  Inventory_pk  PRIMARY KEY  (invId),
CONSTRAINT  Inventory_ItemId_fk  FOREIGN KEY  (itemId) 
					REFERENCES  item(itemId),
CONSTRAINT  Inventory_color_fk  FOREIGN KEY  (color)
					REFERENCES  Color(color),
CONSTRAINT  Inventory_currPrice_cc CHECK (currPrice BETWEEN 5 and 1000)
);

--Task 3
ALTER TABLE Item
ADD  (unitPrice  NUMBER(5,2) NULL); 

--Task 4
ALTER TABLE Inventory
ADD  (inStockDate DATE NULL); 

--Task 5

ALTER TABLE Item
MODIFY  (unitPrice NUMBER(6,2)); 	
--Task 6

ALTER TABLE Item
MODIFY  (category VARCHAR2(30)); 
--Task 7

ALTER TABLE  Inventory 
DROP  constraint Inventory_currPrice_cc; 
--Task 8
ALTER TABLE  Item
DROP  (unitPrice); 

spool off
set echo off