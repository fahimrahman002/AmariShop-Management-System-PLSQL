set serveroutput on;
set verify off;
create or replace procedure totalProfitSite1(branch_id in Branch.BranchID%type)
	 is
	 A Product.product_purchase_rate%type;
	 B Product.product_sales_rate%type;
	 C Product.total_quantity%type;
	 Tsum Product.product_purchase_rate%type :=0;
	 Temp Product.product_purchase_rate%type ;
	 BEGIN
	 for R in (select * from Product1@site1) LOOP
		A := R.product_purchase_rate;
		B := R.product_sales_rate;
		C := R.total_quantity;
		Temp:= (B*C)-(A*C);
		Tsum := Tsum+Temp;
		end loop;
	DBMS_OUTPUT.PUT_LINE('Total Profit at Branch Dhaka is ' || Tsum );
	 
	 
	 
	 END totalProfitSite1;
	 /
 Create or replace procedure totalProfitSite2(branch_id in Branch.BranchID%type)
	 is
	 A Product.product_purchase_rate%type;
	 B Product.product_sales_rate%type;
	 C Product.total_quantity%type;
	 Tsum Product.product_purchase_rate%type :=0;
	 Temp Product.product_purchase_rate%type ;
	 BEGIN
	 for R in (select * from Product2@site2 ) LOOP
		A := R.product_purchase_rate;
		B := R.product_sales_rate;
		C := R.total_quantity;
		Temp:= (B*C)-(A*C);
		Tsum := Tsum+Temp;
		end loop;
	DBMS_OUTPUT.PUT_LINE('Total Profit at Bracnch Rangpur is ' || Tsum );
	 
	 
	 
	 END totalProfitSite2;

  /
declare 
A Branch.BranchID%type:= 1;
B Branch.BranchID%type:= 2;
begin 
  totalProfitSite1(A);
  totalProfitSite2(B);
  

end;
/