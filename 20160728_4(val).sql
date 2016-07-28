select * from AUTHOR;

CREATE SEQUENCE seq_author
START WITH 1
INCREMENT BY 1
MAXVALUE 1000000;

select seq_Author.nextval from dual; -- 부를때마다 시퀀스 증가
select seq_Author.currval from dual; -- 시퀀스 출력

insert into AUTHOR values(seq_Author.nextval, '','');

SELECT * FROM AUTHOR;



select * from book;