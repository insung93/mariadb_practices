-- **join

-- inner join
-- employees 테이블과 titles 테이블를 join하여 직원의 이름과 직책을 모두 출력 하세요.
-- select *
-- from employees, titles;
-- employees 튜플 * titles 튜플 한 결과가 나온다. 실행 xxxx 
-- 카티션 프로덕트(Cartesian Product)

-- 예제1
-- employees 테이블과 titles 테이블을 join하여 직원의 이름과 직책을 모두 출력 하세요.
select e.emp_no, e.first_name, t.title
from employees e 
join titles t on e.emp_no=t.emp_no;

-- 예제2
-- employees 테이블과 titles 테이블를 join하여 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력하세요. 
select e.emp_no, e.first_name, t.title, e.gender 
from employees e, titles t
where e.emp_no=t.emp_no
and e.gender= 'F'
and title='engineer';

-- ANSI / ISO SQL1999 표준 문법

-- 1) natural join
-- 두 테이블에 공통 컬럼이 있으면 별다른 조건없이 묵시적으로 조인됨
-- 공통 컬럼이 하나 이상 있어도 공통된 컬럼은 모두 조인됨
-- 쓸일이 없음
select a.first_name, b.title 
from employees a
natural join titles b;
-- on a.emp_no = b.emp_no; 생략

-- 2) join ~ using
select e.first_name, t.title
from employees e
join titles t using(emp_no);

-- 3) join on
select a.first_name, b.title 
  from employees a
  join titles b on a.emp_no = b.emp_no;

-- outer join
-- insert into dept values(null, '총무');
-- insert into dept values(null, '개발');
-- insert into dept values(null, '영업');
-- insert into dept values(null, '기획');
select * from dept;

-- insert into emp values(null, '둘리', 1);
-- insert into emp values(null, '마이콜', 2);
-- insert into emp values(null, '또치', 3);
-- insert into emp values(null, '길동', null);
select * from emp;

select *
from emp e 
left join dept d on e.dept_no = d.no;

select *
from emp e 
right join dept d on e.dept_no = d.no;

select e.name,ifnull(d.name, '부서없음') as 부서
from emp e 
left join dept d on e.dept_no = d.no;

-- 실습문제 1)
-- 현재 회사 상황을 반영한 직원별 근무부서를 사번, 직원전체이름, 근무 부서 형태로 출력해 보세요.
select e.emp_no, e.first_name, d.dept_name
from employees e, dept_emp de, departments d
where e.emp_no = de.emp_no
and de.dept_no = d. dept_no
and de.to_date > current_date();

-- 실습문제 2)
-- 현재 회사에서 지급되고 있는 급여체계를 반영한 결과를 출력하세요.
-- 사번, 전체이름, 연봉을 출력하세요
select e.emp_no, e.first_name, s.salary
from employees e, salaries s
where e.emp_no = s.emp_no
and s.to_date > current_date();