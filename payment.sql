select * from payment;
select * from paymentdetail;
select * from orders;
-- 12

insert into payment values(null, 12, "카드", "신용카드");
insert into paymentdetail values(null, 1, "이정은", "50000", now(), "국민카드", "결제완료");