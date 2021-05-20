-- subquery
-- 1) from절의 서브쿼리
SELECT NOW() AS a, SYSDATE() AS b, 3 + 1 AS c;
SELECT 
    s.a, s.b, s.c
FROM
    (SELECT NOW() AS a, SYSDATE() AS b, 3 + 1 AS c) s;

-- 2) where
-- 현재 Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체 이름을 출력해보세요. 
SELECT 
    e.emp_no, e.first_name, e.last_name
FROM
    employees e,
    dept_emp de
WHERE
    e.emp_no = de.emp_no
        AND de.to_date > CURRENT_DATE()
        AND de.dept_no = (SELECT 
            de.dept_no
        FROM
            employees e,
            dept_emp de
        WHERE
            e.emp_no = de.emp_no
                AND de.to_date > CURRENT_DATE()
                AND CONCAT(e.first_name, ' ', e.last_name) = 'Fai Bale');
                    
-- 2-1) where 절의 서브쿼리 : 단일행
-- 단일행 연산자 : =, >, <, >=, <=, <>, != 
-- 현재 전체사원의 평균 연봉보다 적은 급여를 받는 사원의 이름, 급여를 나타내세요
SELECT 
    e.first_name, s.salary
FROM
    employees e,
    salaries s
WHERE
    e.emp_no = s.emp_no
        AND to_date > CURRENT_DATE()
        AND salary < (SELECT 
            AVG(s.salary)
        FROM
            salaries s
        WHERE
            s.to_date > CURRENT_DATE());

-- 실습문제 2:
-- 현재 가장적은 평균 급여를 받고 있는 직책의 평균 급여를 구하세요.
SELECT 
    t.title, AVG(s.salary)
FROM
    (SELECT 
        *
    FROM
        titles
    WHERE
        to_date > CURRENT_DATE()) t
        JOIN
    (SELECT 
        *
    FROM
        salaries
    WHERE
        to_date > CURRENT_DATE()) s ON t.emp_no = s.emp_no
GROUP BY t.title
ORDER BY 2
LIMIT 1;

-- 2-2) where 절의 서브쿼리: 복수행
-- 복수행 연산자: in, not in, any, all

SELECT 
    a.first_name, b.salary
FROM
    employees a,
    salaries b
WHERE
    a.emp_no = b.emp_no
        AND b.to_date = '9999-01-01'
        AND (a.emp_no , b.salary) IN (SELECT 
            emp_no, salary
        FROM
            salaries
        WHERE
            to_date = '9999-01-01'
                AND salary > 50000)
ORDER BY b.salary ASC;

-- sol2)
SELECT 
    a.first_name, b.salary
FROM
    employees a,
    salaries b
WHERE
    a.emp_no = b.emp_no
        AND b.to_date = '9999-01-01'
        AND b.salary > 50000
ORDER BY b.salary ASC;

-- sol3
SELECT 
    a.first_name, b.salary
FROM
    employees a,
    salaries b
WHERE
    a.emp_no = b.emp_no
        AND b.to_date = '9999-01-01'
        AND (a.emp_no , b.salary) = ANY (SELECT 
            emp_no, salary
        FROM
            salaries
        WHERE
            to_date = '9999-01-01'
                AND salary > 50000)
ORDER BY b.salary ASC;

-- 실습문제 4 : 각 부서별로 최고 월급을 받는 직원의 이름과 월급을 출력
-- 부서번호와 부서별 최고월급 출력
SELECT 
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
GROUP BY d.dept_no;
        
SELECT 
    e.first_name, s.salary, d.dept_name
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