desc category;
select * from category;
select no, name, depth, group_no groupNo, order_no orderNo from category
order by group_no, no, order_no;

-- 첫번 째 카테고리 등록
insert into category(no, name, depth, group_no, order_no) 
values(null, "상의", 1, 1, 1);

-- group_no +=1
insert into category(no, name, depth, group_no, order_no) 
values(null, "하의", 1, (select max(group_no)+1 from category category_as), 1); 

insert into category(no, name, depth, group_no, order_no) 
values(null, "원피스", 1, (select max(group_no)+1 from category category_as), 1); 

-- 자식 카테고리 등록
insert into category(no, name, depth, group_no, order_no) 
values(null, "반팔", 2, 1, 1);
insert into category(no, name, depth, group_no, order_no) 
values(null, "나시", 2, 1, 1);
insert into category(no, name, depth, group_no, order_no) 
values(null, "세일", 2, 1, 1);

insert into category(no, name, depth, group_no, order_no) 
values(null, "청바지", 2, 2, 1);
insert into category(no, name, depth, group_no, order_no) 
values(null, "치마", 2, 2, 1);

-- 모든 카테고리 가져오기
select * 
from category
where depth = 1
order by no;

-- 해당 카테고리의 하위 카테고리 가져오기
select * 
from category
where group_no = 4
order by no;

-- 상위 카테고리 이름 중복검사 
select * 
from category
where name = "상의"
and depth=1;

-- 하위 카테고리 이름 중복검사 
select * 
from category
where group_no=1
and depth=2
and name = "세일";

-- 카테고리 수정
update category set name="상위" where no =1;
select * from category;

-- 카테고리 삭제
delete from category where no=11;


