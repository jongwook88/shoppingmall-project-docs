select * from user;
delete from user where no = 1;
delete from user;

select count(*) from user
where convert(AES_DECRYPT(id, SHA2("aaa", 512)) using utf8) = 'leeap1004@gmail.com';

-- 시큐리티 권한 설정
select * from user order by no desc;

alter table user 
change column role 
role enum('ROLE_USER','ROLE_ADMIN');
update user set role="ROLE_USER";

-- 회원 아이디 찾기
select no, convert(AES_DECRYPT(id, SHA2("aaa", 512)) using utf8) as id,
convert(AES_DECRYPT(name, SHA2("aaa", 512))using utf8) as name,
pw_question as passwordQuestion,
convert(AES_DECRYPT(pw_answer, SHA2("aaa", 512)) using utf8) as passwordAnswer,
convert(AES_DECRYPT(phone_number, SHA2("aaa", 512)) using utf8) as phoneNumber,
convert(AES_DECRYPT(email, SHA2("aaa", 512)) using utf8) as email,
birth_date as birthDate, role, point, end_date as endDate, gender
from user
where convert(AES_DECRYPT(email, SHA2("aaa", 512)) using utf8) = 'leeap1004@gmail.com';

-- 회원 로그인
select no, convert(AES_DECRYPT(id, SHA2("aaa", 512)) using utf8) as id,
convert(AES_DECRYPT(name, SHA2("aaa", 512))using utf8) as name,
pw_question as passwordQuestion,
convert(AES_DECRYPT(pw_answer, SHA2("aaa", 512)) using utf8) as passwordAnswer,
convert(AES_DECRYPT(phone_number, SHA2("aaa", 512)) using utf8) as phoneNumber,
convert(AES_DECRYPT(email, SHA2("aaa", 512)) using utf8) as email,
birth_date as birthDate, role, point, end_date as endDate, gender
from user
where convert(AES_DECRYPT(id, SHA2("aaa", 512)) using utf8) = 'leeap1003'
and password = SHA2("Wjddms1234", 512);


-- 회원 가입
insert into user(no, id, name, password, pw_question, pw_answer, phone_number, email, birth_date, role, point, end_date, gender) 
values(null, 
AES_ENCRYPT("admin", SHA2("aaa", 512)), 
AES_ENCRYPT("이정은", SHA2("aaa", 512)), 
SHA2("admin",512), 
1, 
AES_ENCRYPT("핸드폰",SHA2("aaa", 512)), 
AES_ENCRYPT("010-9274-3036", SHA2("aaa", 512)), 
AES_ENCRYPT("leeap1003@gmail.com",SHA2("aaa", 512)), 
"1995-11-29", "ROLE_ADMIN", 0, null, 'M');

-- 회원 리스트
select no, convert(AES_DECRYPT(id, SHA2("aaa", 512)) using utf8) as id,
convert(AES_DECRYPT(name, SHA2("aaa", 512))using utf8) as name,
pw_question as passwordQuestion,
convert(AES_DECRYPT(pw_answer, SHA2("aaa", 512)) using utf8) as passwordAnswer,
convert(AES_DECRYPT(phone_number, SHA2("aaa", 512)) using utf8) as phoneNumber,
convert(AES_DECRYPT(email, SHA2("aaa", 512)) using utf8) as email,
DATE_FORMAT(birth_date,'%Y-%m-%d') as birthDate, role, point, end_date as endDate, gender
from user
where no = 39; 

-- 회원 정보 수정 
update user set 
password = SHA2("wjddms1234",512), 
pw_question = 2, 
pw_answer = AES_ENCRYPT("바보333",SHA2("aaa", 512)), 
birth_date = "1992-07-08",
gender = "M"
where no = 7;

-- 회원 삭제
delete from user where no = 31;
-- 회원 주소지 추가 
select * from address;
select * from user;
insert into address values(null, 1, 
AES_ENCRYPT("16929", SHA2("aaa", 512)),  
AES_ENCRYPT("경기도 용인시 무슨 아파트", SHA2("aaa", 512)), 
AES_ENCRYPT("몇동 몇호", SHA2("aaa", 512)),  "집");

-- 회원 주소지 리스트 가져오기
select no, user_no userNo,
convert(AES_DECRYPT(address_code, SHA2("aaa", 512)) using utf8) as addressCode,
convert(AES_DECRYPT(address, SHA2("aaa", 512)) using utf8) as address,
convert(AES_DECRYPT(address_detail, SHA2("aaa", 512)) using utf8) as addressDetail,
address_check addressCheck
from address
where user_no = 2;

-- 회원 주소 가져오기
select no, user_no userNo,
convert(AES_DECRYPT(address_code, SHA2("aaa", 512)) using utf8) as addressCode,
convert(AES_DECRYPT(address, SHA2("aaa", 512)) using utf8) as address,
convert(AES_DECRYPT(address_detail, SHA2("aaa", 512)) using utf8) as addressDetail,
address_check addressCheck
from address
where no = 1;

-- 회원 주소지 삭제
delete from address where no = 3;





	select no, convert(AES_DECRYPT(id, SHA2("aaa", 512)) using utf8) as id, password
	convert(AES_DECRYPT(name, SHA2("aaa", 512))using utf8) as name,
	pw_question as passwordQuestion,
	convert(AES_DECRYPT(pw_answer, SHA2("aaa", 512)) using utf8) as passwordAnswer,
	convert(AES_DECRYPT(phone_number, SHA2("aaa", 512)) using utf8) as phoneNumber,
	convert(AES_DECRYPT(email, SHA2("aaa", 512)) using utf8) as email,
	DATE_FORMAT(birth_date,'%Y-%m-%d') as birthDate, role, point, end_date as endDate, gender
	from user
	where convert(AES_DECRYPT(id, SHA2("aaa", 512)) using utf8) = "admin";










