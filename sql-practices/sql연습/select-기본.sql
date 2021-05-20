use employees;

-- concat, alias (as, 생략 가능)
select concat(first_name, ' ', last_name) as name, gender, hire_date from employees;
select concat(first_name, ' ', last_name) name, gender, hire_date from employees;
select concat(first_name, ' ', last_name) as '전체 이름', gender, hire_date from employees;

-- distinct
select distinct(title) from titles;

-- 예제 : deaprtments 테이블의 모든 데이터를 출력.
select * from departments;

-- 예제 : employees 테이블에서 직원의 이름,  성별, 입사일을 출력
select first_name, last_name, gender, hire_date from employees;