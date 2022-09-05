SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE PACKAGE findprofit AS

	PROCEDURE get_profit;
	
	
END findprofit;
/


CREATE OR REPLACE PACKAGE BODY findprofit AS

    PROCEDURE get_profit
	IS
	t_profit number;
	BEGIN
	
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
        
		SELECT SUM(product_sales_rate - product_purchase_rate) AS Profit INTO t_profit
		From Product;
          
        DBMS_OUTPUT.PUT_LINE(t_profit);
	END findRoom;

END findprofit;
/
