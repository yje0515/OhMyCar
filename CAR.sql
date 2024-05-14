-- ȸ�� ���̺� ����
create table user_tbl(
      userid varchar2(50) not null primary key,   -- ȸ�����̵�
      username varchar2(50) not null,  -- ȸ���̸�(�Ǹ�)
      password varchar2(100) not null, -- ȸ����й�ȣ
      email varchar2(50) not null,   -- ȸ���̸���(api ���� primary key�� �޾ƿ;���)
      nickname varchar2(50),-- ȸ���г��� (�Խ��� �̿�� ���)
      enabled char(1) default '1');  -- ȸ���� ���� Ȱ��ȭ ����, �⺻�� 1���
      
-- ȸ�� ���� ���̺� ����
create table user_auth_tbl (
     userid varchar2(50) not null,  -- ȸ�� ���̵�
     auth varchar2(50) not null,  -- ȸ�� ����
     constraint fk_user_auth foreign key(userid) references user_tbl(userid) 
     -- �ܷ� Ű ���� �������� user_tbl�� username(pk)�� ������
);

-- �ڵ��α��� ���̺� ����
create table persistent_logins(
    username varchar2(64) not null,
    series varchar2(64) primary key,
    token varchar2(64) not null,
    last_used timestamp not null
    );


-- ���̺� Ȯ��
DESC user_tbl;
DESC user_auth_tbl;
DESC persistent_logins;

-- ���̺� ����
drop table user_tbl;
drop table user_auth_tbl;
drop table persistent_logins;

-- ��� ȸ�� ��ȸ
select * from user_tbl;
select * from user_auth_tbl;
select * from persistent_logins;

commit;

rollback;
--TEST
--  user_tbl�� user_auth_tbl join �ش� ���̵�ȸ�� ����
SELECT us.userid,username,password,email,nickname,enabled,auth.auth
FROM  user_tbl us LEFT OUTER JOIN user_auth_tbl auth ON us.userid = auth.userid
WHERE us.userid='user1';

-- user_tbl�� user_auth_tbl join ��� ȸ���� ����
SELECT  us.userid,username,password,email,nickname,enabled,auth.auth
FROM user_tbl us LEFT OUTER JOIN user_auth_tbl auth ON us.userid=auth.userid;

-- Login
SELECT * FROM user_tbl WHERE  password='1234';
SELECT password FROM user_tbl WHERE  userid='user1';