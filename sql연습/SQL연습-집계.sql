-- 집계(통계) SQL 문제입니다.

-- 문제 1. 
-- 최고임금(salary)과  최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께 출력해 보세요. 두 임금의 차이는 얼마인가요? 함께 “최고임금 – 최저임금”이란 타이틀로 출력해 보세요.
select max(salary) as '최고임금' , min(salary) as '최저임금' , max(salary) - min(salary) as '최고임금- 최저임금'
from salaries;

-- 문제2.
-- 마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
select date_format( max(hire_date),'%Y년 %m월 %d일')
from employees;

-- 문제3.
-- 가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
select date_format( min(hire_date),'%Y년 %m월 %d일')
from employees where emp_no in
(select emp_no from salaries
where to_date>current_date());
select date_format( min(hire_date),'%Y년 %m월 %d일')
from employees;

-- 문제4.
-- 현재 이 회사의 평균 연봉은 얼마입니까?
select avg(salary)
from salaries;
-- 현재 근무하고 있는 직원의 평균 연봉은?
select avg(salary)
from salaries
where to_date > current_date();

-- 문제5.
-- 현재 이 회사의 최고/최저 연봉은 얼마입니까?
select max(salary), min(salary)
from salaries;
-- 현재 이 회사에서 근무하고 있는 직원들의 최고/최저 연봉은 얼마?
select max(salary), min(salary)
from salaries
where to_date > current_date();

-- 문제6.
-- 최고 어린 사원의 나이와 최 연장자의 나이는?
-- 한국 나이
select (date_format(current_date(), '%Y')-date_format(min(birth_date),'%Y')+1)as '최고연장자',
	(date_format(current_date(), '%Y')-date_format(max(birth_date),'%Y')+1) as '최고어린사원'
from employees;

-- 현재 근무중인 직원들 중 최고 어린 사원과 최 연장자의 나이차는?
select (date_format(current_date(), '%Y')-date_format(min(birth_date),'%Y')+1)as '연장자',
	(date_format(current_date(), '%Y')-date_format(max(birth_date),'%Y')+1) as '최고어린사원',
	(date_format(current_date(), '%Y')-date_format(min(birth_date),'%Y')+1)-
	(date_format(current_date(), '%Y')-date_format(max(birth_date),'%Y')+1) as '나이차이'
from employees
where emp_no in 
	(select emp_no
    from salaries
    where to_date > current_date());