-- 집계쿼리 : select 절에 그룹함수가 적용된 경우

select avg(salary)
from salaries;

select emp_no, avg(salary)
from salaries;
-- select 절에 그룹 함수가 있는 경우, 어떤 컬럼도 select 절에 올 수 없다.

select avg(salary)
from salaries
where emp_no='10060';

-- 쿼리 실행 순서 숙지
-- (1) from : 접근 테이블 확인
-- (2) where : 조건에 맞는 row 선택 -> 임시 테이블
-- (3) 집계
-- (4) projection

-- group by절 에 참여 하고 있는 컬럼은 projection 가능( select절에 올 수 있다).
select emp_no, avg(salary)
from salaries
group by emp_no;

-- having절
-- 집계 결과 임시 테이블에서 로우를 선택해야 하는 경우
-- 이미 where절은 실행이 되었기 때문에 having절에서 조건을 주어야 한다.
select emp_no, avg(salary)
from salaries
group by emp_no
having avg(salary) > 60000;

-- 사번이 10060인 직원의 최저 임금을 받은 시기와 최대 임금을 받은 시기를 각 각 출력해보세요
-- 문법적으로는 오류
-- 의미적으로는 맞다.
select from_date 
from salaries 
where salary in 
			(select max(salary), min(salary) 
            from salaries 
            where emp_no = 10060) 
		and emp_no=10060;