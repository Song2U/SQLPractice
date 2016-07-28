/* insert */
insert into author values (1, '박경리', '토지 작가');
SELECT * FROM AUTHOR;

/* insert2 */
insert into author (no, NAME, DESCRIPTION) values(2, '이훈', '..');
insert into author (NAME, no, DESCRIPTION) values('공자', 3, '..');
SELECT * FROM AUTHOR;

/* insert3 */
insert into book values(1,'토지',null, 1);
select * from book;

insert into book(no, title, author_no) values(2,'칼의노래',2);
select * from book;

/* insert4 (subquery 사용) */
insert into book (select 3, '논어', null, 3 from dual);
select 3, '논어', null, 3 from dual;
select * from book;

commit;

/* update 1 */
update book
   set title = '토지 3판',
       rate = 5,
       AUTHOR_NO = 3;
       
select * from book;
ROLLBACK; -- commit해두지 않으면 원래 있던것까지 다 사라짐
commit;

/* update 2 */
update book
   set rate = 3
 where AUTHOR_NO = (select no from author where name = '박경리');
commit;
select no from author where name = '박경리';

/* delete 1 */
delete from book where no = 3;
SELECT * FROM book;

/* delete 2 */
delete
  from book
 where AUTHOR_NO = (select no from author where name = '이훈');
 
/* pseudo column */
select user from dual; -- 현재 사용자 id 출력