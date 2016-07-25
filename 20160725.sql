SELECT LOWER('DATABASE SYSTEM') FROM DUAL; /* 소문자로 변환 */
SELECT UPPER('database system') FROM DUAL; /* 대문자로 변환 */
SELECT INITCAP('the soap') FROM DUAL; /* 앞 글자만 대문자로 변환*/

SELECT CONCAT('data','base') FROM DUAL; /* 문자열 연결 */
SELECT 'data'||'base' FROM DUAL; /* 위의 쿼리문과 결과 같음 */

SELECT SUBSTR('database',2,5) FROM DUAL;  /* 2~5번째 문자 출력 */

SELECT LENGTH('database') FROM DUAL; /* 문자열 길이 출력 */

SELECT INSTR ('database', 'ba') FROM DUAL; /* ba의 문자열 인덱스 */

SELECT FIRST_NAME, LPAD(SALARY, 10, ' ') FROM EMPLOYEES; /* 왼쪽에서부터 정렬 */
SELECT FIRST_NAME, RPAD(SALARY, 10, ' ') FROM EMPLOYEES; /* 오른쪽에서부터 정렬 */

SELECT TRIM ('#' FROM '#####data#base########')FROM DUAL; /* 양쪽 끝에 있는 # 문자열을 없애는 것 (가운데는 replace로) */ 

SELECT ABS(-20000) FROM DUAL; /* 절대값 */
SELECT FLOOR (2.65) FROM DUAL; /* 2.65보다 작거나 같은 최소 정수 */
SELECT CEIL(2.15) FROM DUAL; /* 2.15 보다 크거나 같은 최대 정수 */
SELECT POWER(2,10) FROM DUAL; /* 2의 10승 */
SELECT TRUNC(3.145677,2) FROM DUAL; /* 3.145677의 2째자리까지 출력 */

SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES;

DESC EMPLOYEES;

SELECT VALUE FROM NLS_SESSION_PARAMETERS WHERE PARAMETER = 'NTS_DATE_FORMAT'; /* 날짜 포맷 확인 */
SELECT FIRST_NAME, TO_CHAR(HIRE_DATE, 'yyyy-mm-dd pm hh24:mi:ss')FROM EMPLOYEES; /* 날짜 포맷을 변경해서 출력 */
SELECT FIRST_NAME, TO_CHAR(HIRE_DATE, 'yyyy-mm-dd') FROM EMPLOYEES WHERE '2007'<=TO_CHAR(HIRE_DATE, 'yyyy-mm-dd'); /* 2007년 이후 입사한 사원 검색 */

SELECT SYSDATE FROM DUAL; /* 현재 날짜 반환 */
SELECT TO_CHAR(SYSDATE, 'yyyy-mm-dd pm hh24:mi:ss') FROM DUAL; /* 현재 날짜와 시간을 char 형태로 변환 */
INSERT INTO BOARD VALUES(' ', SYSDATE); /* 날짜 삽입할 때 사용? */

SELECT TO_DATE ('2007-12-10', 'yyyy,mm,dd') FROM DUAL; /* 문자열의 날짜를 oracle date type으로 변환 */

SELECT FIRST_NAME, SALARY FROM EMPLOYEES; /* 기본 포맷으로 출력 */
SELECT FIRST_NAME, TO_CHAR(SALARY, '99999') FROM EMPLOYEES; /* salary를 다음과 같은 포맷으로 출력 (문자열로 변환) */
SELECT FIRST_NAME, TO_CHAR(SALARY, '99,999') FROM EMPLOYEES; /* salary를 다음과 같은 포맷으로 출력 (문자열로 변환) */
SELECT FIRST_NAME, TO_CHAR(SALARY, '$0,99,9990') FROM EMPLOYEES; /* salary를 다음과 같은 포맷으로 출력 (문자열로 변환) */
SELECT FIRST_NAME, TO_CHAR(SALARY, '99,999') FROM EMPLOYEES; /* salary를 다음과 같은 포맷으로 출력 (문자열로 변환) */
SELECT FIRST_NAME, TO_CHAR(SALARY*1.2, '99,999') FROM EMPLOYEES; /* 연산이 더 필요한 경우 컬럼?에다가 먼저 해주기 */

SELECT TO_CHAR(-100000, '999999MI') FROM DUAL; /* 부호를 뒤에 출력 */
SELECT TO_CHAR(-100000, '999999PR') FROM DUAL; /* 앞 뒤에  < > 출력*/

SELECT TO_CHAR(123, 'RN') FROM DUAL; /* 숫자를 로마자로 출력 (대문자)*/
SELECT TO_CHAR(123, 'rn') FROM DUAL; /* 숫자를 로마자로 출력 (소문자)*/
SELECT TO_CHAR(-100000, 'S999999') FROM DUAL; /* 숫자 앞에 부호기호 붙여서 출력*/
SELECT TO_CHAR(100000, 'S999999') FROM DUAL; /* 숫자 앞에 부호기호 붙여서 출력*/
SELECT TO_CHAR(123, 'XXX') FROM DUAL; /* 숫자를 16진수로 출력*/

SELECT FIRST_NAME, SALARY + SALARY*NVL(COMMISSION_PCT, 0) FROM EMPLOYEES; /* expr1이 NULL이면 expr2, 아니면 expr1 */
SELECT FIRST_NAME, SALARY + SALARY*NVL2(COMMISSION_PCT, 0) FROM EMPLOYEES; /* expr1이 NOT NULL이면 expr2, 아니면 expr3 */

select * from employees;

/*case : sql문의 IF문*/
select first_name, job_id, salary, case job_id when 'AD_VP' then salary*1.1 else salary end from EMPLOYEES; /* job_id가 'AD_VP'인 사람들의 salary에 1.1 곱해서 출력 (AD_VP가 아니면 그냥 salary 출력 */
select first_name, job_id, salary, case job_id when 'AD_VP' then salary*1.1 when 'FI_MGR' then salary*1.5 else salary end as "이번달 월급" from EMPLOYEES; /* 이중 case문도 가능 */

select first_name, job_id, salary, case job_id when 'AD_VP' then salary*1.1 when 'FI_MGR' then salary*1.5 else salary end as "case문", decode(job_id, 'AD_VP', salary*1.1, 'FI_MGR', salary*1.5, salary) as "decode문" from EMPLOYEES; /* decode 함수 (case 문과 유사)*/


