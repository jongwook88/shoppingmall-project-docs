desc product;

select * from product;
select * from category_product;
select * from option;
select * from optionvalue;

delete from category_product;

insert into product
values(null, "aaa", "곰티", 25000, now(), true, true, 2500, 1, "<h1>Hello</h1>");

insert into category_product
values(null, 1, 1);

-- 옵션 insert
insert into option
values(null, "색상");

-- 옵션 이름 가져오기(중복검사)
select * from option
where name="색상";

-- 하위 옵션 등록
desc optionvalue;
select * from optionvalue;
insert into optionvalue
values(null, 1, 1, "검정");


