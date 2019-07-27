-- 결제완료(가정)후 주문
select * from user;
select * from product;
select * from productoption;
select * from orders;
select * from orderdetail;

delete from orderdetail;
delete from orders;

-- 주문시 재고 체크
select use_stock useStock, stock
from productoption
where no = 8;

-- 주문 후 재고 감소
update productoption 
set stock = stock+3
where no = 8;

-- 회원 주문 insert
insert into orders(no, user_no, order_no, name, gender, phone_number, 
email, address, total_price, reg_date, message) values(null,
2, concat(
	DATE_FORMAT(now(),'%Y%m%d'), '-',
	lpad( ((select count(*) from orders ALIAS_FOR_SUBQUERY
	where DATE_FORMAT(reg_date, '%y%m%d') = DATE_FORMAT(now(), '%y%m%d') )+1), '6', '0' )
), 
AES_ENCRYPT("이정은", SHA2("aaa", 512)), "F",  
AES_ENCRYPT("010-9274-3036", SHA2("aaa", 512)), 
AES_ENCRYPT("leeap1004@gmail.com", SHA2("aaa", 512)),
AES_ENCRYPT("경기도", SHA2("aaa", 512)), 30000, now(), "집앞에 놔주세요"
);

-- 회원 주문 상세 insert
insert into orderdetail values(
null, 4, (select product_no from productoption where no = 8) , 
(select name from product where no = (select product_no from productoption where no = 8)),
(select productoption_name from productoption where no = 8), 
1, "배송준비중", 
(select price from product where no = (select product_no from productoption where no = 8))
);

-- 비회원 주문 insert
insert into orders values(null,
0, concat(
	DATE_FORMAT(now(),'%Y%m%d'), '-',
	lpad( ((select count(*) from orders ALIAS_FOR_SUBQUERY
	where DATE_FORMAT(reg_date, '%y%m%d') = DATE_FORMAT(now(), '%y%m%d') )+1), '6', '0' )
), 
AES_ENCRYPT("이정은", SHA2("aaa", 512)), "F",  
SHA2("12345",512), 
AES_ENCRYPT("010-9274-3036", SHA2("aaa", 512)), 
AES_ENCRYPT("leeap1004@gmail.com", SHA2("aaa", 512)),
AES_ENCRYPT("경기도", SHA2("aaa", 512)), 30000, now(), "집앞에 놔주세요"
);

-- 주문 정보
select * from orders;
select no, user_no userNo, order_no orderStringNo,   
convert(AES_DECRYPT(name, SHA2("aaa", 512)) using utf8) name,
gender, convert(AES_DECRYPT(phone_number, SHA2("aaa", 512)) using utf8) phoneNumber,
convert(AES_DECRYPT(email, SHA2("aaa", 512)) using utf8) email,
convert(AES_DECRYPT(address, SHA2("aaa", 512)) using utf8) address,
total_price totalPrice, reg_date regDate, message
from orders
where user_no=2
order by no desc;

-- 주문 상세 select
select * from orderdetail;
select no, order_no orderNo, product_no productNo,
(select order_no from orders where no = orderNo ) orderStringNo,
 product_name productName,
productoption_name productOptionName,
quantity, status, price 
from orderdetail;