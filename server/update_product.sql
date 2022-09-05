set serveroutput on;
set verify off;

create or replace package product_package AS
PROCEDURE getBranchID_by_pname(p_name in Product.product_name%type,BranchID out Branch.BranchID%type,ProductID out Product.ProductID%type) ;
procedure update_ProductName(p_name in Product.product_name%type,up_name in Product.product_name%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type);
procedure update_ProductDescription(p_name in Product.product_name%type,up_des in Product.product_description%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type);
procedure update_ProductModel(p_name in Product.product_name%type,up_model in Product.product_model%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type);
procedure update_ProductBrand(p_name in Product.product_name%type,up_brand in Product.product_brand%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type);
procedure update_Product_purchase_rate(p_name in Product.product_name%type,up_pur in Product.product_purchase_rate%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type);
procedure update_Product_sales_rate(p_name in Product.product_name%type,up_sal in Product.product_sales_rate%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type);
procedure update_Product_totalQ(p_name in Product.product_name%type,up_tq in Product.total_quantity%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type);
end product_package;

/

create or replace package body product_package AS
PROCEDURE getBranchID_by_pname(p_name in Product.product_name%type,BranchID out Branch.BranchID%type,ProductID out Product.ProductID%type)

    is 
    BEGIN
        for row in (select Product1@site1.BranchID,Product1@site1.ProductID from (Product1@site1 INNER JOIN Branch ON Product1@site1.BranchID = Branch.BranchID) where  Product1@site1.product_name like '%'||p_name||'%') loop
		BranchID:= row.BranchID;
		ProductID:= row.ProductID; 
		end loop;
		for row in (select Product1@site2.BranchID,Product1@site2.ProductID  from (Product2@site2 INNER JOIN Branch ON Product2@site2.BranchID = Branch.BranchID) where  Product2@site2.product_name like '%'||p_name||'%') loop
		BranchID:= row.BranchID;
		ProductID:= row.ProductID;
		end loop;
       
    end getBranchID_by_pname;

procedure update_ProductName(p_name in Product.product_name%type,up_name in Product.product_name%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type)
    IS
    BEGIN
       If MOD(BranchID,2)=0 then
			update Product2@site2 set product_name= REPLACE(product_name,p_name,up_name) where Product2@site2.ProductID=P_id;
			commit;
		else 
			update Product1@site1 set product_name= REPLACE(product_name,p_name,up_name) where Product1@site1.ProductID=P_id;
			commit;
		end if;
    END update_ProductName;
procedure update_ProductDescription(p_name in Product.product_name%type,up_des in Product.product_description%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type)
    IS
    BEGIN
       If MOD(BranchID,2)=0 then
			update Product2@site2 set product_description=(up_des) where Product2@site2.ProductID=P_id;
			commit;
		else 
			update Product1@site1 set product_description=(up_des) where Product1@site1.ProductID=P_id;
			commit;
		end if;
    END update_ProductDescription;
procedure update_ProductModel(p_name in Product.product_name%type,up_model in Product.product_model%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type)
    IS
    BEGIN
       If MOD(BranchID,2)=0 then
			update Product2@site2 set product_model=(up_model) where Product2@site2.ProductID=P_id;
			commit;
		else 
			update Product1@site1 set product_model=(up_model) where Product1@site1.ProductID=P_id;
			commit;
		end if;
    END update_ProductModel;
procedure update_ProductBrand(p_name in Product.product_name%type,up_brand in Product.product_brand%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type)
    IS
    BEGIN
       If MOD(BranchID,2)=0 then
			update Product2@site2 set product_brand=(up_brand) where Product2@site2.ProductID=P_id;
			commit;
		else 
			update Product1@site1 set product_brand=(up_brand) where Product1@site1.ProductID=P_id;
			commit;
		end if;
    END update_ProductBrand;
procedure update_Product_purchase_rate(p_name in Product.product_name%type,up_pur in Product.product_purchase_rate%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type)
    IS
    BEGIN
       If MOD(BranchID,2)=0 then
			update Product2@site2 set product_purchase_rate=(up_pur) where Product2@site2.ProductID=P_id;
			commit;
		else 
			update Product1@site1 set product_purchase_rate=(up_pur) where Product1@site1.ProductID=P_id;
			commit;
		end if;
    END update_Product_purchase_rate;
procedure update_Product_sales_rate(p_name in Product.product_name%type,up_sal in Product.product_sales_rate%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type)
    IS
    BEGIN
       If MOD(BranchID,2)=0 then
			update Product2@site2 set product_sales_rate=(up_sal) where Product2@site2.ProductID=P_id;
			commit;
		else 
			update Product1@site1 set product_sales_rate=(up_sal) where Product1@site1.ProductID=P_id;
			commit;
		end if;
    END update_Product_sales_rate;
procedure update_Product_totalQ(p_name in Product.product_name%type,up_tq in Product.total_quantity%type,BranchID in Branch.BranchID%type,P_id in Product.ProductID%type)
    IS
    BEGIN
       If MOD(BranchID,2)=0 then
			update Product2@site2 set total_quantity=(up_tq) where Product2@site2.ProductID=P_id;
			commit;
		else 
			update Product1@site1 set total_quantity=(up_tq) where Product1@site1.ProductID=P_id;
			commit;
		end if;
    END update_Product_totalQ;

end product_package;
/





accept ProductName prompt "Enter product name to update:";
accept UpdateProductName prompt "Enter new product name to update:";
accept ProductDes prompt "Enter product description to update:";
accept ProductModel prompt "Enter product model to update:";
accept ProductBrand prompt "Enter product brand to update:";
accept ProductPurRate prompt "Enter product purchase rate to update:";
accept ProductSalesRate prompt "Enter product sales rate to update:";
accept ProductTQ prompt "Enter product toral quantity to update:";



declare 
BranchID Branch.BranchID%type;
ProductID Product.ProductID%type;
upPName Product.product_name%type := '&UpdateProductName';
ProductName Product.product_name%type := '&ProductName';
up_des  Product.product_description%type := '&ProductDes';
up_model Product.product_model%type:='&ProductModel';
up_brand Product.product_brand%type:='&ProductBrand';
up_purchase Product.product_purchase_rate%type:= '&ProductPurRate';
up_sales Product.product_sales_rate%type:= '&ProductSalesRate';
up_tq Product.total_quantity%type := '&ProductTQ';


BEGIN
	product_package.getBranchID_by_pname(ProductName,BranchID,ProductID);
	product_package. update_ProductName(ProductName,upPName,BranchID,ProductID);
	product_package. update_ProductDescription(ProductName,up_des,BranchID,ProductID);
	product_package.update_ProductModel(ProductName,up_model,BranchID,ProductID);
	product_package.update_ProductBrand(ProductName,up_brand,BranchID,ProductID);
	product_package.update_Product_purchase_rate(ProductName,up_purchase,BranchID,ProductID);
	product_package.update_Product_sales_rate(ProductName,up_sales,BranchID,ProductID);
	product_package.update_Product_totalQ(ProductName,up_tq,BranchID,ProductID);
	
	
	
END;
/
