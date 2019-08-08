select * from cart order by no desc;
select * from productoption;
select * from product;
select * from user;

-- 장바구니에 해당 상품이 있나?(회원)
select count(*)
from cart
where productoption_no = 9
and user_no = 2;

-- 장바구니에 해당 상품이 있나?(비회원)
select count(*)
from cart
where productoption_no = 8
and nonuser_no = "aa";

-- 이미 담은 상품 또 담을 때(회원)
update cart 
set quantity = quantity+1
where productoption_no =9
and user_no = 2;

-- 이미 담은 상품 또 담을 때(비회원)
update cart 
set quantity = quantity+100
where productoption_no =8
and nonuser_no = "aa";

-- 장바구니 담기(회원)
insert into cart(no, productoption_no, user_no, quantity) 
values(null, 9, 2, 1);

-- 장바구니 담기(비회원)
insert into cart(no, productoption_no, nonuser_no, quantity, user_no) 
values(null, 8, "re", 11, 0);

select * from cart;

-- 장바구니 정보 가져올때(회원)
select c.no, c.productoption_no productoptionNo, p.name, po.productoption_name productName,
	   sum(c.quantity) quantity, p.price, sum(c.quantity)*price sumPrice
from cart c, productoption po, product p
where c.productoption_no = po.no
and po.product_no = p.no
and user_no = 2
group by productoptionNo;

-- 장바구니 상품(상품옵션)의 상품의 옵션 목록 가져오기
select * 
from productoption
where product_no in (select product_no from productoption where no = 10);

-- 장바구니 정보 가져올때(비회원)
select c.no, c.productoption_no productoptionNo, p.name, po.productoption_name productName, 
	   sum(c.quantity) quantity, p.price, sum(c.quantity)*price sumPrice
from cart c, productoption po, product p
where c.productoption_no = po.no
and po.product_no = p.no
and nonuser_no = "AA1234BB"
group by productoptionNo;

-- 장바구니 삭제
delete from cart
where no = 12;

select * from cart;






select c.no cartNo, p.no productNo, c.productoption_no productoptionNo, p.name, po.productoption_name productName,
		sum(c.quantity) quantity, p.price, sum(c.quantity)*price sumPrice
from cart c, productoption po, product p
where c.productoption_no = po.no
and po.product_no = p.no
and user_no =40
group by productoptionNo;



