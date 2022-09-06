set verify off;
set serveroutput on;

create or replace package sell_product_pack as 
    function get_branch_id_by_name(bName in Branch.branch_name%type)return Branch.BranchID%type;
    procedure sell_from_product1(p_id in Product.ProductID%type,p_quantity in Product.total_quantity%type);
end sell_product_pack;
/

create or replace package body sell_product_pack as 

    procedure sell_from_product1(p_id in Product.ProductID%type,p_quantity in Product.total_quantity%type) is
    
    pQuantity Product.total_quantity%type;
    
    begin 

        select total_quantity into pQuantity from Product1 WHERE ProductID = p_id; 

        if p_quantity is not NULL then
           pQuality:=0;
        end if;
        

        UPDATE Product1
        SET product_name = pName, product_description= pDesc, product_model=pModel,product_brand=pBrand,product_purchase_rate=pPurchaseRate,product_sales_rate=pSalesRate,total_quantity=pQuality
        WHERE ProductID = p_id;
    end update_product1_details;

    function get_branch_id_by_name(bName in Branch.branch_name%type)
    return Branch.BranchID%type is 
    begin 
        for row in (select * from Branch where lower(branch_name) like '%'||bName||'%') loop
            return row.BranchID;
        end loop;
        return 0;
    end get_branch_id_by_name;

end sell_product_pack;
/

accept branchNameIn prompt "Enter branch name:";
accept pIdIn prompt "Enter product ID:";
accept pQuantityIn prompt "Enter quantity:";

declare 
branchId Branch.BranchID%type;
branchName Branch.branch_name%type:='&branchNameIn';
pId Product.ProductID%type:=&pIdIn;
pQuantity Product.total_quantity%type := '&pQuantityIn';

branch_not_exist EXCEPTION;

begin 

    branchId := sell_product_pack.get_branch_id_by_name(branchName);
    
    if BranchId = 0 THEN
        RAISE branch_not_exist;
    elsif BranchId = 1 then
        sell_product_pack.sell_from_product1(pId,pQuality);
    end if;

    EXCEPTION
		WHEN branch_not_exist THEN
			DBMS_OUTPUT.PUT_LINE('Branch does not exist.');

end;
/