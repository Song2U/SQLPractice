select * from tab; -- 테이블 리스트 조회

desc book; -- 테이블 스키마

create table book(
  no  NUMBER,
  title varchar2(100),
  author varchar2(100),
  pub_date date
);

/* 예제 데이터 넣기 */
insert into book values(1, '나의 라임 오렌지 나무', '바스콘셀로스', to_date('2010-04-15', 'yyyy-mm-dd')); -- 데이터 삽입
insert into book values(2, '슬램덩크', '다케이코', to_date('2006-04-05', 'yyyy-mm-dd')); -- 데이터 삽입
insert into book values(3, '토지', '박경리', to_date('2005-03-12', 'yyyy-mm-dd')); -- 데이터 삽입

select * from book; -- 테이블 조회

/* 데이터를 넣으면서 테이블 생성하기 (테이블 백업) */
create table book_temp as(select * from book);

select * from BOOK_TEMP;

/* 테이블 변경 (컬럼 추가) */
alter table book add(pubs varchar(200));
desc book;
select * from book;

/* 테이블 변경 (컬럼 수정) */
desc book;
alter table book modify(pubs varchar(500));

/* 테이블 변경 (컬럼 삭제) */
alter table book drop (pubs);
desc book;

/* unused 테이블 변경 (컬럼 unused 설정)*/
alter table book set unused(author);
desc book;

/* 테이블 삭제 */
drop table book_temp;
select * from book_temp;
select * from tabs;

/* 테이블 데이터 삭제 */
TRUNCATE table book;
select * from book;

/* 코멘트 달기 */
comment on table book is 'this is comment';
select * from user_tab_comments;

/* rename */
rename book to article;
select * from article;

insert into article values(3, '토지', to_date('2005-03-12', 'yyyy-mm-dd')); -- 데이터 삽입
insert into article values(2, '슬램덩크', to_date('2006-04-05', 'yyyy-mm-dd')); -- 데이터 삽입4
insert into article values(1, '나의 라임 오렌지 나무', to_date('2010-04-15', 'yyyy-mm-dd')); -- 데이터 삽입
commit; -- 다른데서 보려면 commit 해줘야 함

/* constraint (제약조건) - not null*/
create table book(
  no  NUMBER not null,
  title varchar2(100) not null,
  author varchar2(100),
  pub_date date
);

insert into book values (1, null, null, null); --error
insert into book values (1, '논어', null, null);
select * from book;
insert into book values (2, ' ', null, null); -- 공백은 null이 아님(그냥 ''는 null로 취급)

/* constraint (제약조건) - unique */
drop table book;

create table book(
  no  NUMBER not null,
  title varchar2(100) not null,
  author varchar2(100),
  pub_date date,
  CONSTRAINT c_book_unique unique(no)
);

insert into book values (1, '논어', '공자', null);
insert into book values (1, '논어', '공자', null); -- 중복 제한을 걸었기 때문에 똑같은 걸로 넣으면 안 됨
insert into book values (2, '논어2', '공자2', null);

select * from book;

/* constraint (제약조건) - primary key : not null + unique */
drop table book;

create table book(
  no  NUMBER,
  title varchar2(100) not null,
  author varchar2(100),
  pub_date date,
  PRIMARY key (no)
);

insert into book values (1, '논어', '공자', sysdate);
insert into book values (1, '논어', '공자', sysdate); -- 기본키 설정을 걸었기 때문에 똑같은 걸로 넣으면 안 됨
insert into book values (2, '논어2', '공자2', sysdate);

select * from book;

/* constraint (제약조건) - Check */
drop table book;

create table book(
  no  NUMBER,
  title varchar2(100) not null,
  author varchar2(100),
  pub_date date,
  rate number not null,
  PRIMARY key (no),
  check(rate in (1,2,3,4,5))
);

insert into book values (1, '논어', '공자', sysdate, 6); -- rate를 1,2,3,4,5로 체크해두었기때문에 오류
insert into book values (1, '논어', '공자', sysdate, 5);
insert into book values (2, '논어2', '공자2', sysdate,4);

select * from book;

/* author table 생성 */
drop table author;
create table author(
  no number,
  name varchar2(80) not null,
  description varchar(2000),
  primary key(no)
);
insert into author values(1,'공자','어쩌구 저쩌구...');
SELECT * FROM AUTHOR;

drop table author constraint; -- 참조까지 다 지움

/* constraint (제약조건) - Foreign key(외래키) */
drop table book;

create table book(
no  NUMBER,
title varchar2(100) not null,
pub_date date,
rate number not null,
author_no number,
constraint c_book_pk primary key(no),
constraint c_book_check_rate check(rate in (1,2,3,4,5)),
constraint c_book_fk FOREIGN KEY(author_no)
references author(no),
-- 삭제시 에러
on delete set null -- pk  삭제시 null로 세팅
                    -- in delete casecade 삭제시 함께 삭제
);

insert into book values (1, '논어', sysdate, 5, 1);
insert into book values (2, '논어2',sysdate, 4, 1);

select * from book;
select * from tabs;

/* foreign key 삭제 시 문제점 */
delete from author where no = 1; -- 참조하고 있는게 있어서 삭제가 안 됨

select OBJECT_NAME 
  FROM USER_OBJECTS
  WHERE OBJECT_TYPE = 'TABLE';
  
select constraint_name, constraint_type, search_condition
from user_constraints
WHERE table_name = 'BOOK';