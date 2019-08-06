insert into user(no, id, name, password, pw_question, pw_answer, phone_number, email, birth_date, role, point, end_date, gender) 
values(null, 
AES_ENCRYPT("leeap1004", SHA2("aaa", 512)), 
AES_ENCRYPT("이정은", SHA2("aaa", 512)), 
SHA2("Wjddms1234",512), 
1, 
AES_ENCRYPT("핸드폰",SHA2("aaa", 512)), 
AES_ENCRYPT("010-9274-3036", SHA2("aaa", 512)), 
AES_ENCRYPT("leeap1003@gmail.com",SHA2("aaa", 512)), 
"1995-11-29", "U", 0, null, 'M');