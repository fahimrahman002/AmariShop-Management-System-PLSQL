clear screen;

Drop table Shop CASCADE CONSTRAINTS;

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

commit;