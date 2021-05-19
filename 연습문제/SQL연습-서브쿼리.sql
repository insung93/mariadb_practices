-- 서브쿼리(SUBQUERY) SQL 문제입니다.
-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?

SELECT 
    COUNT(*)
FROM
    salaries s
WHERE
    s.to_date > CURRENT_DATE()
        AND s.salary > (SELECT 
            AVG(salary)
        FROM
            salaries s
        WHERE
            s.to_date > CURRENT_DATE());

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
SELECT 
    e.emp_no, e.first_name, d.dept_name, s.salary
FROM
    salaries s,
    employees e,
    dept_emp de,
    departments d
WHERE
    s.to_date > CURRENT_DATE()
        AND de.to_date > CURRENT_DATE()
        AND s.emp_no = e.emp_no
        AND de.emp_no = e.emp_no
        AND d.dept_no = de.dept_no
        AND (de.dept_no , s.salary) IN (SELECT 
            d.dept_no, MAX(s.salary) AS max_salary
        FROM
            (SELECT 
                *
            FROM
                dept_emp
            WHERE
                to_date > CURRENT_DATE()) d
                JOIN
            (SELECT 
                *
            FROM
                salaries
            WHERE
                to_date > CURRENT_DATE()) s ON d.emp_no = s.emp_no
        GROUP BY d.dept_no);

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
select sub1.emp_no, sub1.first_name, sub1.salary
from
(select de.emp_no, de.dept_no, s.salary, e.first_name
from dept_emp de, salaries s, employees e
where de.to_date > current_date()
and s.to_date > current_date()
and de.emp_no = s.emp_no
and de.emp_no = e.emp_no) sub1 ,
(select de.dept_no, avg(s.salary) as avg_salary
from dept_emp de, salaries s
where de.to_date > current_date()
and s.to_date > current_date()
and de.emp_no = s.emp_no
group by de.dept_no) sub2
where sub1.dept_no = sub2.dept_no
and sub1.salary > sub2.avg_salary;

-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.

-- left outer join 사용
select sub1.emp_no, sub1.first_name, sub2.first_name 매니저이름, sub1.dept_name
from (select e.emp_no, e.first_name, de.dept_no, d.dept_name
	from employees e, dept_emp de, departments d
	where de.to_date > current_date()
	and e.emp_no = de.emp_no
	and de.dept_no = d. dept_no) sub1 left join (select dm.dept_no, e.emp_no,first_name
												from employees e, dept_manager dm
												where e.emp_no = dm.emp_no
												and dm.to_date > current_date()) sub2 on sub1.dept_no = sub2.dept_no;

-- from절 sub-query 사용
select sub1.emp_no, sub1.first_name, sub2.first_name, sub2.dept_name
from
(select e.emp_no, e.first_name, de.dept_no
from employees e, dept_emp de
where e.emp_no = de.emp_no
and de.to_date > current_date()) sub1,
(select dm.dept_no, e.first_name, d.dept_name
from dept_manager dm, departments d, employees e
where dm.to_date > current_date()
and dm.emp_no = e.emp_no
and dm.dept_no = d.dept_no) sub2
where sub1.dept_no = sub2.dept_no;


-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select e.emp_no, e.first_name, t.title, s.salary
from dept_emp de, employees e, titles t, salaries s
where de.to_date > current_date()
and t.to_date > current_date()
and s.to_date > current_date()
and de.emp_no = e.emp_no
and e.emp_no = t.emp_no
and e.emp_no = s.emp_no
and de.dept_no = (select sub1.dept_no
					from (select de.dept_no, avg(s.salary)
					from dept_emp de , salaries s
					where de.to_date > current_date()
					and s.to_date > current_date()
					and de.emp_no = s.emp_no
					group by de.dept_no
					order by 2 desc
					limit 1) sub1)
order by 4 desc;

-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 
select sub1.dept_no, d.dept_name, sub1.avg_salary
from (select de.dept_no, avg(s.salary) as avg_salary
from dept_emp de, salaries s
where de.to_date > current_date() 
and s.emp_no = de.emp_no
and s.to_date > current_date()
group by de.dept_no
order by 2 desc
limit 1)sub1, departments d 
where sub1.dept_no = d.dept_no;

-- 문제7.
-- 평균 연봉이 가장 높은 직책?
select t.title, avg(s.salary)
from titles t, salaries s
where t.emp_no = s.emp_no
and t.to_date > current_date()
and s.to_date > current_date()
group by t.title
order by 2 desc
limit 1;

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

-- left outer join 사용
select sub2.dept_name, sub1.first_name, sub1.salary, sub2.first_name 매니저이름, sub2.salary 매니저연봉
from (select de.dept_no, e.first_name, s.salary
		from employees e, salaries s, dept_emp de
		where e.emp_no = s.emp_no
		and s.to_date > current_date()
		and de.to_date > current_date()
		and e.emp_no = de.emp_no) sub1 left join (select dm.dept_no, s.salary , d.dept_name, e.first_name
													from dept_manager dm, salaries s, employees e, departments d
													where dm.to_date > current_date()
													and s.to_date > current_date()
													and dm.emp_no = s.emp_no
													and e.emp_no = dm.emp_no
													and d.dept_no = dm.dept_no) sub2 on sub1.dept_no = sub2.dept_no
where sub1.salary > sub2.salary; 

-- from절 sub-query 사용
select sub1.dept_name, sub2.first_name, sub2.salary, sub1.first_name, sub1.salary
from
(select dm.dept_no, dm.emp_no, s.salary, e.first_name, d.dept_name
from dept_manager dm, salaries s, employees e, departments d
where dm.to_date > current_date()
and s.to_date > current_date()
and dm.emp_no = s.emp_no
and e.emp_no = dm.emp_no
and dm.dept_no = d.dept_no) sub1,
(select de.dept_no, e.first_name, s.salary
from employees e, salaries s, dept_emp de
where e.emp_no = s.emp_no
and s.to_date > current_date()
and de.to_date > current_date()
and e. emp_no = de.emp_no) sub2
where sub1.dept_no = sub2.dept_no
and sub2.salary > sub1.salary;