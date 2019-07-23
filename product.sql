desc product;

select * from product order by no desc;
select * from category;
select COL no, category_no, product_no from category_product order by COL desc;
select * from option;
select * from optionvalue order by no desc;

delete from category_product;

-- 상품 등록
insert into product
values(null, "aaa", "곰티", 25000, now(), true, true, 2500, 1, "<h1>Hello</h1>");

-- 상품 옵션 등록
select * from productoption;
select * from product;

insert into productoption
values(null, 1, "검정/S", 0, true, 500);


-- 카테고리
insert into category_product
values(null, 1, 1);

-- 옵션 insert
insert into option
values(null, "크기");

-- 옵션 이름 가져오기(중복검사)
select * from option
where name="색상";

-- 하위 옵션 등록
desc optionvalue;
select * from optionvalue;
insert into optionvalue
values(null, 1, 3, "짧");

-- 상품 리스트 가져오기(선택 카테고리)
select * from category_product where category_no=1;
select no, code, name, price, reg_date regDate, isshow isShow, isoption isOption, shipping_fee shippingFee, order_no orderNo
from product
where no in (select product_no from category_product where category_no=1)
and name like '%1%'
order by no desc
limit 0, 5;

-- 상품 상세
select no, code, name, price, reg_date regDate, isshow isShow, 
isoption isOption, shipping_fee shippingFee, order_no orderNo
from product 
where no = 1;

select * from optionvalue;
-- 상품 옵션
select o.no optionNo, o.name , ov.value
from optionvalue ov, option o, product p
where ov.optionname_no = o.no
and p.no = ov.product_no
and ov.product_no=1
order by o.no, ov.no;
--
select no, product_no productNo, productoption_name productOptionName,
		additional_amount additionalAmount, use_stock useStock, stock
from productoption
where product_no = 1;

