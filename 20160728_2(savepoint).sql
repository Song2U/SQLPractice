delete from book;
delete from author;
commit; -- 새 트랜잭션 시작

select * from book;
select * from author;

insert into author values (1, '박경리', '토지 작가');
insert into author (no, name, DESCRIPTION) values (2, '이훈', '..');
insert into author (name, no,DESCRIPTION) values ('공자', 3, '..');
savepoint sp1;

delete from author where no = 1;
delete from author where no = 2;
savepoint sp2;

update author set name = '꽁자' where no = 3;
rollback to sp2;  --세이브 포인트 sp2 롤백

update author set name ='공자' where no =3;
rollback to sp1;

select * from author;
select * from book;
commit;