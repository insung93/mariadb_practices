-- 테이블간 조인(JOIN) SQL 문제입니다.

SELECT 
    e.emp_no, e.first_name, s.salary
FROM
    employees e,
    salaries s
WHERE
    e.emp_no = s.emp_no
        AND s.to_date > CURRENT_DATE()
ORDER BY s.salary DESC;

-- 문제2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.
SELECT 
    e.emp_no, e.first_name, t.title
FROM
    employees e,
    titles t
WHERE
    e.emp_no = t.emp_no
        AND t.to_date > CURRENT_DATE();

-- 문제3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요..
SELECT 
    e.emp_no, e.first_name, d.dept_name
FROM
    employees e,
    dept_emp de,
    departments d
WHERE
    e.emp_no = de.emp_no
        AND de.dept_no = d.dept_no
        AND de.to_date > CURRENT_DATE()
ORDER BY 2;

-- 문제4.
-- 전체 사원의 사번, 이름, 연봉, 직책, 부서를 모두 이름 순서로 출력합니다.
SELECT 
    e.emp_no, e.first_name, s.salary, t.title, d.dept_name
FROM
    employees e,
    salaries s,
    titles t,
    dept_emp de,
    departments d
WHERE
    e.emp_no = s.emp_no
        AND e.emp_no = t.emp_no
        AND e.emp_no = de.emp_no
        AND de.dept_no = d.dept_no
        AND s.to_date > CURRENT_DATE()
        AND t.to_date > CURRENT_DATE()
        AND de.to_date > CURRENT_DATE()
ORDER BY 2;

-- 문제5.
-- ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. (현재 ‘Technique Leader’의 직책(으로 근무하는 사원은 고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력 합니다.
SELECT 
    t.emp_no, e.first_name
FROM
    titles t,
    employees e
WHERE
    t.emp_no = e.emp_no
        AND t.to_date < CURRENT_DATE()
        AND t.title = 'Technique Leader';

-- 문제6.
-- 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.
SELECT 
    e.first_name, e.last_name, d.dept_name, t.title
FROM
    employees e,
    dept_emp de,
    departments d,
    titles t
WHERE
    last_name LIKE 'S%'
        AND e.emp_no = de.emp_no
        AND de.dept_no = d.dept_no
        AND e.emp_no = t.emp_no
        AND t.to_date > CURRENT_DATE()
        AND de.to_date > CURRENT_DATE();

-- 문제7.
-- 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가 큰 순서대로 출력하세요.
SELECT 
    e.emp_no, e.first_name, s.salary, t.title
FROM
    employees e,
    titles t,
    salaries s
WHERE
    t.to_date > CURRENT_DATE()
        AND s.to_date > CURRENT_DATE()
        AND e.emp_no = t.emp_no
        AND e.emp_no = s.emp_no
        AND t.title = 'Engineer'
        AND s.salary >= 40000
ORDER BY s.salary DESC;

-- 문제8.
-- 현재 직원이 급여가 50000이 넘는 직책을 사번, 직책, 급여로 급여가 큰 순서대로 출력하시오
SELECT 
    s.emp_no, t.title, s.salary
FROM
    salaries s,
    titles t
WHERE
    s.to_date > CURRENT_DATE()
        AND t.to_date > CURRENT_DATE()
        AND s.emp_no = t.emp_no
        AND s.salary > 50000
ORDER BY 3 DESC;

-- 문제9.
-- 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.
SELECT 
    de.dept_no, d.dept_name, AVG(s.salary)
FROM
    salaries s,
    dept_emp de,
    departments d
WHERE
    s.emp_no = de.emp_no
        AND s.to_date > CURRENT_DATE()
        AND de.to_date > CURRENT_DATE()
        AND de.dept_no = d.dept_no
GROUP BY de.dept_no
ORDER BY 3 DESC;

-- 문제10.
-- 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.
SELECT 
    t.title, AVG(s.salary)
FROM
    salaries s,
    titles t
WHERE
    s.to_date > CURRENT_DATE()
        AND t.to_date > CURRENT_DATE()
        AND s.emp_no = t.emp_no
GROUP BY t.title
ORDER BY 2 DESC;