commit;

set TRANSACTION read write;
select * from author;
insert into author values(5,'안대혁','..');

commit;

SELECT * FROM author;
update AUTHOR set name = 'kickscar' where no=5;
commit;