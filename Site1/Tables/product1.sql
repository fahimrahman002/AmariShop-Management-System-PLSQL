clear screen;

Drop table Product1 CASCADE CONSTRAINTS;

CREATE SEQUENCE product1_seq START WITH 1;

CREATE TABLE Product1(
ProductID INT,
product_name VARCHAR(30) NOT NULL,
product_description VARCHAR(200) NULL,
product_model VARCHAR(30) NULL,
product_brand VARCHAR(30) NULL,
product_purchase_rate INT NOT NULL,
product_sales_rate INT NOT NULL,
total_quantity INT DEFAULT 0,
BranchID INT NOT NULL,
CONSTRAINT product1_pk PRIMARY KEY (ProductID)
);


CREATE OR REPLACE TRIGGER Product1Trigger_after_insert
AFTER INSERT
ON Product1
BEGIN
   DBMS_OUTPUT.PUT_LINE('VALUES INSERTED INTO Product1 TABLE');
END;
/

CREATE OR REPLACE TRIGGER Product1Trigger_before_insert 
BEFORE INSERT ON Product1 
FOR EACH ROW
BEGIN
  SELECT product1_seq.NEXTVAL
  INTO   :new.ProductID
  FROM   dual;
END;
/
CREATE OR REPLACE TRIGGER Product1Trigger_after_update
AFTER update
ON Product1
BEGIN
   DBMS_OUTPUT.PUT_LINE('VALUES updates INTO Product1 TABLE');
END;
/
CREATE OR REPLACE TRIGGER Product1Trigger_after_delete
AFTER Delete
ON Product1
BEGIN
   DBMS_OUTPUT.PUT_LINE('VALUES deleted from Product1 TABLE');
END;
/
commit;