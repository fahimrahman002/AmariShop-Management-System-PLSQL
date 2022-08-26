clear screen;

drop table Branch CASCADE CONSTRAINTS;

--> Branch Table
CREATE TABLE Branch(
BranchID INT not null,
ShopID INT Not NULL,
branch_name VARCHAR(30) NOT NULL,
branch_address VARCHAR(200) NULL,
branch_contact VARCHAR(20) NULL,
branch_email VARCHAR(30) NULL,
CONSTRAINT fk_shopID FOREIGN KEY (ShopID) REFERENCES Shop(ShopID),
PRIMARY KEY (BranchID));

insert into Branch(BranchID,ShopID,branch_name,branch_address,branch_contact) 
values (1,1,'Dhaka Branch','Dhaka','01615990017');
insert into Branch(BranchID,ShopID,branch_name,branch_address,branch_contact) 
values (2,1,'Rangpur Branch','Rangpur','01799419364');
insert into Branch(BranchID,ShopID,branch_name,branch_address,branch_contact) 
values (3,1,'Mymensingh Branch','Mymensingh','01615990017');

commit;