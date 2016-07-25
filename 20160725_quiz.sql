-- join 문제 --

/* 문제 1 */
select E.EMPLOYEE_ID as "사번",
e.first_name as "사원명",
D.DEPARTMENT_NAME as "부서명",
c.first_name as "매니저명"
from EMPLOYEES e, DEPARTMENTS d, EMPLOYEES c
where C.EMPLOYEE_ID = e.manager_ID;

/* 문제 2 */
select R.REGION_NAME, C.COUNTRY_NAME
from REGIONS r, COUNTRIES c
order by R.REGION_ID desc, C.REGION_ID desc;

/* 문제 3 */
select * from DEPARTMENTS;
select D.DEPARTMENT_ID, D.DEPARTMENT_NAME, E.EMPLOYEE_ID
from DEPARTMENTS d, EMPLOYEES e, LOCATIONS l, REGIONS r, COUNTRIES c;

/* 문제 4*/

/* 문제 5*/

/* 문제 6*/