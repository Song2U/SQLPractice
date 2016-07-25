-- join --

/* employees의 부서 아이디와 department의 부서 아이디가 같은 것을 연결해서 출력 (join 조건 [table수 : 1])*/
SELECT * FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID; 
 /* row 선택 조건 추가 */
SELECT * FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.SALARY>5000;

-- inner join --

/* equi join */
SELECT FIRST_NAME, DEPARTMENT_ID FROM EMPLOYEES; /*107개 출력*/
/* 106개 출력 : inner join (조건에 부합되지 않으면 나오지 않음) */
SELECT A.FIRST_NAME, B.DEPARTMENT_ID FROM EMPLOYEES A, DEPARTMENTS B WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID; 

/* theta join */
select * from employees a, jobs b where A.SALARY between b.min_salary and B.MAX_SALARY;

/* self join */
/* employees의 manager_id는 employees의 employee_id를 참고하고 있음*/
select A.FIRST_NAME, B.FIRST_NAME from employees a, employees b where A.MANAGER_ID = B.EMPLOYEE_ID;

/* outter join */
select A.FIRST_NAME as "사원", B.FIRST_NAME as "매니저" from employees a, employees b where B.EMPLOYEE_ID(+) = A.MANAGER_ID ; /*값이 null인 것도 나옴(나오게 하고 싶은 쪽에 (+) 붙이기) - 오라클에서만 가능*/
select A.FIRST_NAME as "사원", nvl(B.FIRST_NAME, '없음') as "매니저" from employees a, employees b where B.EMPLOYEE_ID(+) = A.MANAGER_ID ;