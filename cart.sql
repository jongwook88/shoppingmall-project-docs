select * from cart;
select * from productoption;
select * from product;
select * from user;

-- 장바구니 담기
insert into cart(productoption_no, user_no, quantity) 
values(8, 2, 11);

select * from cart;

-- 장바구니 정보 가져올때
select c.productoption_no, p.name, po.productoption_name, c.productoption_no productoptionNo, 
	   sum(c.quantity) quantity, p.price, sum(c.quantity)*price totalPrice   
from cart c, productoption po, product p
where c.productoption_no = po.no
and po.product_no = p.no
and user_no = 2
group by productoptionNo;