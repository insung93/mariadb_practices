-- 함수 : 문자열 함수
-- upper
select upper('buSan'), upper('busan'), upper('doUzone'), upper('douzone');
select upper(first_name) from employees;
-- 자바에서 처리하는거 보다 db에서 upper 같은 데이터 처리를 해주는게 좋음

-- lower
select lower('BUsAn'), lower('BUSAN'), lower('DOUzONE'), lower('DOUZONE');
select lower(first_name) from employees;

-- substring ( 문장 , index , length )
select substring('Happy Day',3,2);

-- 1989년에 입사한 사원들의 이름, 입사일 출력
select first_name, hire_date
from employees
where substring(hire_date,1,4) = '1989';

-- lpad , rpad 빈 공간을 
select lpad('1234', 10, '-');
select rpad('1234', 10, '-');
-- 직원들의 월급
select emp_no, lpad(salary,10,'  ') from salaries; 

-- trim, ltrim, rtrim
-- trim 사용시 공백 대신에 다른 문자 넣을 수도 있음
select ltrim('    hello     world    '),
rtrim('    hello     world    '),
trim('    hello     world    '),
trim(both ' ' from '    hello     world    '),
replace('    hello     world    ',' ', '');