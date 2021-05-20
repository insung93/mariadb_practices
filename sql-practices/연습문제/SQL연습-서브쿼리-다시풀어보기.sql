-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
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

-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
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