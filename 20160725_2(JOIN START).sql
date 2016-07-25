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
SELECT * FROM EMPLOYEES A, JOBS B WHERE A.SALARY BETWEEN B.MIN_SALARY AND B.MAX_SALARY;

/* self join */
/* employees의 manager_id는 employees의 employee_id를 참고하고 있음*/
SELECT A.FIRST_NAME, B.FIRST_NAME FROM EMPLOYEES A, EMPLOYEES B WHERE A.MANAGER_ID = B.EMPLOYEE_ID;

/* outer join */
SELECT A.FIRST_NAME AS "사원", B.FIRST_NAME AS "매니저" FROM EMPLOYEES A, EMPLOYEES B WHERE B.EMPLOYEE_ID(+) = A.MANAGER_ID ; /*값이 null인 것도 나옴(나오게 하고 싶은 쪽에 (+) 붙이기) - 오라클에서만 가능*/
SELECT A.FIRST_NAME AS "사원", NVL(B.FIRST_NAME, '없음') AS "매니저" FROM EMPLOYEES A, EMPLOYEES B WHERE B.EMPLOYEE_ID(+) = A.MANAGER_ID ;

SELECT A.FIRST_NAME, B.DEPARTMENT_NAME FROM EMPLOYEES A, DEPARTMENTS B WHERE B.DEPARTMENT_ID(+) = A.DEPARTMENT_ID;

/* natural join */
-- 두 개의 조인 조건이 의도하지 않았는데 걸린다.
-- department id, manager_id
select A.FIRST_NAME, B.DEPARTMENT_NAME from EMPLOYEES a natural join DEPARTMENTS b;

/* join - using*/
select A.FIRST_NAME, B.DEPARTMENT_NAME from EMPLOYEES a join DEPARTMENTS b using(department_id);

/* join - on */
select A.FIRST_NAME, B.DEPARTMENT_NAME from EMPLOYEES a join DEPARTMENTS b on A.DEPARTMENT_ID = B.DEPARTMENT_ID;
--select a.first_name, b.department_name from EMPLOYEES a, DEPARTMENTS b where B.DEPARTMENT_ID = A.DEPARTMENT_ID; /* 위와 같음 */

/* left outer join */
--SELECT A.FIRST_NAME AS "사원", NVL(B.FIRST_NAME, '없음') AS "매니저" FROM EMPLOYEES A, EMPLOYEES B WHERE B.EMPLOYEE_ID(+) = A.MANAGER_ID ;
select A.FIRST_NAME, B.DEPARTMENT_NAME from EMPLOYEES a left outer join departments b on a.department_id = b.department_id;

/* right outer join */
select A.FIRST_NAME, B.DEPARTMENT_NAME from EMPLOYEES a right outer join departments b on a.department_id = b.department_id;