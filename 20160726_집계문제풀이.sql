/* 집계(통계) SQL 문제 */

-- 문제 1 --
SELECT MAX(SALARY) AS "최고임금",
       MIN(SALARY) AS "최저임금",
       (MAX(SALARY)-MIN(SALARY)) AS "최고임금-최저임금"
       FROM EMPLOYEES;
       
-- 문제 2 --
SELECT TO_CHAR(MAX(HIRE_DATE), 'YYYY"년" MM"월" DD"일"') FROM EMPLOYEES;

-- 문제 3 --
SELECT DEPARTMENT_ID, AVG(SALARY) AS "평균임금", MAX(SALARY) AS "최고임금", MIN(SALARY) AS "최저임금"
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY "평균임금" DESC, "최고임금" DESC, "최저임금" DESC;

-- 문제 4 --
SELECT JOB_ID, AVG(SALARY) AS "평균임금", MAX(SALARY) AS "최고임금", MIN(SALARY) AS "최저임금" FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY "평균임금" DESC, "최고임금" DESC, "최저임금" DESC;

-- 문제 5 --
SELECT TO_CHAR(MIN(HIRE_DATE), 'YYYY"년" MM"월" DD"일"')FROM EMPLOYEES;

-- 문제 6 --
SELECT DEPARTMENT_ID, AVG(SALARY) AS "평균임금",
                      MIN(SALARY) AS "최저임금",(AVG(SALARY)-MIN(SALARY)) AS "평균임금-최저임금"
                      FROM EMPLOYEES WHERE DEPARTMENT_ID IS NOT NULL
                      GROUP BY DEPARTMENT_ID HAVING AVG(SALARY)>2000
                      ORDER BY "평균임금-최저임금" DESC;
                                                 
-- 문제 7 --
SELECT (MAX_SALARY - MIN_SALARY) AS "최고임금-최저임금" FROM JOBS ORDER BY "최고임금-최저임금" DESC;