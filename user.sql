select * from user;
delete from user where no = 1;
delete from user;

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
AES_ENCRYPT("leeap1000", SHA2("aaa", 512)), 
AES_ENCRYPT("이정은", SHA2("aaa", 512)), 
SHA2("Wjddms1234",512), 
1, 
AES_ENCRYPT("핸드폰",SHA2("aaa", 512)), 
AES_ENCRYPT("010-9274-3036", SHA2("aaa", 512)), 
AES_ENCRYPT("leeap1003@gmail.com",SHA2("aaa", 512)), 
"1995-11-29", "U", 0, null, 'F');

-- 회원 리스트
select no, convert(AES_DECRYPT(id, SHA2("aaa", 512)) using utf8) as id,
convert(AES_DECRYPT(name, SHA2("aaa", 512))using utf8) as name,
pw_question as passwordQuestion,
convert(AES_DECRYPT(pw_answer, SHA2("aaa", 512)) using utf8) as passwordAnswer,
convert(AES_DECRYPT(phone_number, SHA2("aaa", 512)) using utf8) as phoneNumber,
convert(AES_DECRYPT(email, SHA2("aaa", 512)) using utf8) as email,
DATE_FORMAT(birth_date,'%Y-%m-%d') as birthDate, role, point, end_date as endDate, gender
from user; 

-- 회원 정보 수정 
update user set 
password = SHA2("wjddms1234",512), 
pw_question = 2, 
pw_answer = AES_ENCRYPT("바보333",SHA2("aaa", 512)), 
birth_date = "1992-07-08",
gender = "M"
where no = 7;

-- 회원 삭제
delete from user where no = 6;