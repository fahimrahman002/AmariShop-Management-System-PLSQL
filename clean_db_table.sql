clear screen;

Drop table Product CASCADE CONSTRAINTS;
drop table Branch CASCADE CONSTRAINTS;
drop table Shop CASCADE CONSTRAINTS;

--> Shop Table
CREATE table Shop
(
ShopID INT not null,
shop_name VARCHAR(50) NOT NULL ,
shop_logo VARCHAR(150) NULL,
shop_address VARCHAR(200) NULL,
shop_contact VARCHAR(20) NULL,
shop_email VARCHAR(40) NULL,
 PRIMARY KEY (ShopID)
);

insert into Shop(ShopID,shop_name,shop_address,shop_contact,shop_email) values (1,'AmariShop','Dhaka','01615990017','amarishop@support.com');

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

insert into Branch(BranchID,ShopID,branch_name,branch_address,branch_contact) values (1,1,'Dhanmondi Branch','7/2a, Dhanmondi, Dhaka','01615990017');
insert into Branch(BranchID,ShopID,branch_name,branch_address,branch_contact) values (2,1,'Tejgaon Branch','9/2b, Tejgaon, Dhaka','01715990908');

CREATE TABLE Product(
ProductID INT,
product_name VARCHAR(30) NOT NULL,
product_description VARCHAR(200) NULL,
product_model VARCHAR(30) NULL,
product_brand VARCHAR(30) NULL,
product_purchase_rate INT NOT NULL,
product_sales_rate INT NOT NULL,
product_discount INT DEFAULT 0,
total_quantity INT DEFAULT 0,
BranchID INT NOT NULL,
PRIMARY KEY (ProductID),
CONSTRAINT fk_branchID FOREIGN KEY (BranchID) REFERENCES Branch(BranchID));

insert into Product(ProductID,product_name,product_description,product_model,product_brand,
product_purchase_rate,product_sales_rate,product_discount,total_quantity,BranchID) values 
(1,'Dell Laptop','8Gb Memory,512 Gb SSD','Inspiron15','DELL',50000,65000,400,10,1);

commit;