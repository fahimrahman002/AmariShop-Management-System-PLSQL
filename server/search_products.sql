set serveroutput on;
set verify off;

create or replace package search_product_package AS
procedure search_product_by_name(p_name in Product.product_name%type);

end search_product_package;
/

create or replace package body search_product_package AS
    procedure search_product_by_name(p_name in Product.product_name%type)
    IS
    BEGIN
    dbms_output.put_line('Products with matching name:');
    dbms_output.put_line('Branch name | Product Name | Model | Brand | Purchase rate | Sales rate | Total quantity');
    
    for row in (select * from (Product1@site1 P1 INNER JOIN Branch ON P1.BranchID = Branch.BranchID) where lower(product_name) like '%'||p_name||'%') loop
        dbms_output.put_line(row.branch_name||' | '||row.product_name||' | '||row.product_model||' | '||row.product_brand||' | '||row.product_purchase_rate||' | '||row.product_sales_rate||' | '||row.total_quantity);
    end loop;

    for row in (select * from (Product2@site2 P2 INNER JOIN Branch ON P2.BranchID = Branch.BranchID) where lower(product_name) like '%'||p_name||'%') loop
        dbms_output.put_line(row.branch_name||' | '||row.product_name||' | '||row.product_model||' | '||row.product_brand||' | '||row.product_purchase_rate||' | '||row.product_sales_rate||' | '||row.total_quantity);
    end loop;

    end search_product_by_name;

end search_product_package;
/

accept ProductName prompt "Enter product name to search:";

declare 
ProductName Product.product_name%type := '&ProductName';
BEGIN

search_product_package.search_product_by_name(ProductName);

END;
/

commit;