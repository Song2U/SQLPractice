-- 문제 1 --
SELECT (FIRST_NAME||' '||LAST_NAME) AS "이름",
SALARY AS "급여", PHONE_NUMBER AS "전화번호"
FROM EMPLOYEES ORDER BY HIRE_DATE ASC;

-- 문제 2 --
SELECT JOB_TITLE, MAX_SALARY FROM JOBS ORDER by MAX_SALARY desc;

-- 문제 3 --
SELECT count(*) FROM EMPLOYEES WHERE MANAGER_ID is null;

-- 문제 4 --
select Job_TITLE from JOBS Order By JOB_TITLE desc, MAX_SALARY desc;

-- 문제 5 --
SELECT count(*) from DEPARTMENTS;

-- 문제 6 --
SELECT DEPARTMENT_NAME FROM DEPARTMENTS order by length(DEPARTMENT_NAME) desc;

-- 문제 7 --
SELECT count(*) FROM DEPARTMENTS where MANAGER_ID is null;

-- 문제 8 --
SELECT upper(COUNTRY_NAME) AS cn FROM COUNTRIES order by cn desc ;

-- 문제 9 --
SELECT count(*) region_id from regions;
SELECT region_name FROM regions order by length(Region_name) asc;

-- 문제 10 --
--SELECT * FROM distinct city from locations;