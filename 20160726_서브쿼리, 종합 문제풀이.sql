/* 서브 쿼리 & 종합 문제 풀이 */

/* 서브 쿼리 */

-- 문제 1 --
select count(*) from EMPLOYEES;
select avg(salary) from employees;
select count(*) from EMPLOYEES where salary<(select avg(salary) from employees);

-- 문제 2 --
select EMPLOYEE_ID, LAST_NAME, max(salary) from employees order by max(salary) desc;
select department_id from EMPLOYEES group by DEPARTMENT_ID;

-- 문제 3 --
select * from jobs;
select sum(salary) from jobs;
-- 문제 4 --


-----------------------------------------------------------------------------------------------------------------------------------------------------

/* 종합 문제 */

-- 문제 1 --
select (e.first_name || ' ' || e. last_name) as "이름", e.salary, d.DEPARTMENT_name
FROM employees e, departments d
where D.DEPARTMENT_ID=E.DEPARTMENT_ID
and (select max(hire_date) from employees)=hire_date;

-- 문제 2 --
select * from DEPARTMENTS;
select max(avg(salary)) from EMPLOYEES ;

-- 문제 3 --


-- 문제 4 --


-- 문제 5 --


-- 문제 6 --
