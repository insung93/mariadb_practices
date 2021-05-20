-- 날짜 함수
-- curdate(), current_date()
select curdate(), current_date();

-- curtime(), current_time()
select curtime(), current_time();

-- now(), sysdate()
select now(), sysdate();
select now(), sleep(2), now(), sysdate(), sleep(2), sysdate();

-- date_format(data, format)
select date_format(now(),'%Y년 %m월 %d일 %h시 %i분 %s초') ;

-- period_deff
-- YYMM, YYYYMM
-- 근무 개월 수를 출력
select period_diff(date_format(curdate(),'%Y%m'),date_format(hire_date,'%Y%m')) 
from employees;

-- date_add(=adddate), date_sub(=subdate)
-- 날짜 date에 type(day, month, year) 형식으로 expr값을 더하거나 뺀다.
-- 각 사원들의 근무년수가 5년이 되는 날은 언제 일까요?
select first_name, hire_date, date_add(hire_date, interval 5 year)
from employees;

-- cast
select cast('2021-05-07' as date);
select cast(12345 as char(5));
select cast('12345' as unsigned);
	
-- mysql type
-- VARCHAR, CHAR, text
-- (signed, unsigned) int(integer), medium int, big int, int(11)
-- float, double
-- time, date, datetime
-- LOB(Large Object) : CLOB, BLOB

select now(), cast(now() as date), cast(now() as time);
select cast(1-2 as unsigned);
select cast(cast(1-2 as unsigned) as signed);