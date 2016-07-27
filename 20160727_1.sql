/* 의사 칼럼 : 테이블 내에 없어도 값으로 사용가능한 것*/
select sysdate, EMPLOYEE_ID from employees;

-- conect by prior (계층구조 데이터 표현할 때, 트리, 디렉토리 구조, 조직도)
select level, employee_id, last_name, manager_id
from EMPLOYEES
start with manager_id is null
connect by PRIOR EMPLOYEE_ID=MANAGER_ID
order by level; -- 부모칼럼=자식칼럼

/* rollup */
select department_id, job_id, sum(salary)
from EMPLOYEES
group by rollup (DEPARTMENT_ID , JOB_ID);
--order by DEPARTMENT_ID;

/* cube */
select department_id, job_id, sum(salary)
from EMPLOYEES
group by cube (DEPARTMENT_ID , JOB_ID);

/* top-k rownum (게시판에서 페이징처리) */
select rownum, employee_id, first_name
from EMPLOYEES
where rownum < 6;

/* order by 전에 where전까지 실행되서 선택된 row가 있는 임시테이블에서 rownum이 셋팅되기 때문에 rownum의 순서가 뒤죽박죽 */
/* rownum은 order by 전에 사용!*/
select rownum, employee_id, first_name
from EMPLOYEES
where rownum < 6
order by first_name;

/* 해결 방법 : subquery */
select rownum, employee_id, first_name
from (select employee_id, first_name
      from EMPLOYEES
      order by first_name)
where rownum < 10;

/* 결과 값 안 뜸 */
select rownum, employee_id, first_name
from (select employee_id, first_name
      from EMPLOYEES
      order by first_name)
where 10 < rownum and rownum < 20;

/* 최종 해결 방법 */
select *
from (select rownum as rn, employee_id, first_name
      from (select employee_id, first_name
            from employees
            order by first_name))
where (4-1)*10+1 <= rn and rn < 4*10;

/* row id : row의 절대적인 id (pseudo column rownum, sysdate, rowid)*/
select rowid, first_name from EMPLOYEES;