show tables;
select * from oauth_client_details;

INSERT INTO oauth_client_details (
    CLIENT_ID,
    RESOURCE_IDS, 	-- 버전관리
    CLIENT_SECRET,
    SCOPE,
    AUTHORIZED_GRANT_TYPES,
    WEB_SERVER_REDIRECT_URI,
    AUTHORITIES,
    ACCESS_TOKEN_VALIDITY,
    REFRESH_TOKEN_VALIDITY,
    ADDITIONAL_INFORMATION,
    AUTOAPPROVE )
VALUES ('pjmall', 'pjmall_api', '1234', 'read,write,trust', 
'password,client_credentials', '', 'ROLE_CLIENT', null, null, '{}', '');

INSERT INTO oauth_client_details (
    CLIENT_ID,
    RESOURCE_IDS, 	-- 버전관리
    CLIENT_SECRET,
    SCOPE,
    AUTHORIZED_GRANT_TYPES,
    WEB_SERVER_REDIRECT_URI,
    AUTHORITIES,
    ACCESS_TOKEN_VALIDITY,
    REFRESH_TOKEN_VALIDITY,
    ADDITIONAL_INFORMATION,
    AUTOAPPROVE )
VALUES ('jemall', 'jemall_api', '1234', 'read,write,trust', 
'password,client_credentials', '', 'ROLE_CLIENT', null, null, '{}', '');
