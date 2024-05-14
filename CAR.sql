-- 회원 테이블 생성
create table user_tbl(
      userid varchar2(50) not null primary key,   -- 회원아이디
      username varchar2(50) not null,  -- 회원이름(실명)
      password varchar2(100) not null, -- 회원비밀번호
      email varchar2(50) not null,   -- 회원이메일(api 사용시 primary key로 받아와야함)
      nickname varchar2(50),-- 회원닉네임 (게시판 이용시 사용)
      enabled char(1) default '1');  -- 회원의 계정 활성화 여부, 기본값 1사용
      
-- 회원 권한 테이블 생성
create table user_auth_tbl (
     userid varchar2(50) not null,  -- 회원 아이디
     auth varchar2(50) not null,  -- 회원 권한
     constraint fk_user_auth foreign key(userid) references user_tbl(userid) 
     -- 외래 키 제약 조건으로 user_tbl의 username(pk)를 참조함
);

-- 자동로그인 테이블 생성
create table persistent_logins(
    username varchar2(64) not null,
    series varchar2(64) primary key,
    token varchar2(64) not null,
    last_used timestamp not null
    );


-- 테이블 확인
DESC user_tbl;
DESC user_auth_tbl;
DESC persistent_logins;

-- 테이블 삭제
drop table user_tbl;
drop table user_auth_tbl;
drop table persistent_logins;

-- 모든 회원 조회
select * from user_tbl;
select * from user_auth_tbl;
select * from persistent_logins;

commit;

rollback;
--TEST
--  user_tbl과 user_auth_tbl join 해당 아이디회원 정보
SELECT us.userid,username,password,email,nickname,enabled,auth.auth
FROM  user_tbl us LEFT OUTER JOIN user_auth_tbl auth ON us.userid = auth.userid
WHERE us.userid='user1';

-- user_tbl과 user_auth_tbl join 모든 회원의 정보
SELECT  us.userid,username,password,email,nickname,enabled,auth.auth
FROM user_tbl us LEFT OUTER JOIN user_auth_tbl auth ON us.userid=auth.userid;

-- Login
SELECT * FROM user_tbl WHERE  password='1234';
SELECT password FROM user_tbl WHERE  userid='user1';