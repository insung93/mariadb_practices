-- 수학 함수
-- abs() : 절대값
select abs(-1), abs(1);

-- mod() : 나머지 값
select mod(10,3);

-- floor(x) : x보다 작은 가장 큰 정수
select floor(3.14);

-- ceil(x) : x보다 큰 가장 작은 정수
select ceil(3.14), ceiling(3.14);

-- round(x) : x에 가장 근접한 정수 반환
-- round(x, d) : x 값 중에서 소수점 d자리에 가장 근접한 실수 반환
select round(3.14), round(3.14, 1);

-- pow(x, y), power(x, y) : x의 y제곱
select pow(2, 10), power(2, 10);

-- sign(x) : x가 양수이면 1, 음수이면 -1. 0이면 0 반환
select sign(10), sign(0), sign(-3);

-- greatest(x, y, ...), least(x, y, ...)
select greatest(10,30,70,-10), least(-10,20,50,100);
select greatest('a','c'), least('a','A');