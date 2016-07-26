SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Jack';
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY>8400;

/*서브쿼리로 두 쿼리를 합침*/
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY>(SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Jack');

/* 문제점 */-- 쿼리 결과값이 2개 이상인 경우 비교가 불가능해진다.
/*쿼리가 2개 이상으로 나눠지면 최신의 결과값을 적용시킬 수 없어질 수 있음!*/
select FIRST_NAME, salary from EMPLOYEES where SALARY>(select SALARY from employees where first_name = 'Karen');

--연습 1--
select min(salary) from EMPLOYEES;
select FIRST_NAME, salary from EMPLOYEES where salary = (select min(salary) from EMPLOYEES);

select FIRST_NAME, salary from EMPLOYEES where salary < (select avg(salary) from EMPLOYEES);

--subquery--
select FIRST_NAME, DEPARTMENT_ID from EMPLOYEES where department_id= (SELECT department_id from DEPARTMENTS where department_name = 'Purchasing');

--join--
select first_name, a.department_id from EMPLOYEES a, DEPARTMENTS b where A.DEPARTMENT_ID = B.DEPARTMENT_ID and B.DEPARTMENT_name = 'Purchasing';
--왜 =이 안 되는가? : subquery의 결과가 multirow
select FIRST_NAME, DEPARTMENT_ID from EMPLOYEES where salary in (select min(salary) from EMPLOYEES group by DEPARTMENT_ID);
select FIRST_NAME, DEPARTMENT_ID from EMPLOYEES where salary = any (select min(salary) from EMPLOYEES group by DEPARTMENT_ID);
select min(salary) from EMPLOYEES group by DEPARTMENT_ID; /* 값이 여러개 나옴 */

-- multi row&multi colum
select FIRST_NAME, DEPARTMENT_ID from EMPLOYEES where (department_id, salary) in (select department_id, min(salary) from EMPLOYEES group by DEPARTMENT_ID);

--correlated query --
select first_name, salary from EMPLOYEES a where salary = (select min(salary) from EMPLOYEES where department_id = a.department_id);

--select first_name, salary from employees;

-- from절에 select(select 결과를 테이블로 사용한다.(★★★★★)
select department_id, min(salary) as min_salary from EMPLOYEES group by DEPARTMENT_ID;
select * from EMPLOYEES; /* 위 문장과 Join */

select A.FIRST_NAME, A.SALARY from EMPLOYEES a, (select department_id, min(salary) as min_salary from EMPLOYEES group by DEPARTMENT_ID) b where A.DEPARTMENT_ID = B.DEPARTMENT_ID
and a.salary = B.MIN_SALARY;
