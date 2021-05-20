-- 테이블 보기
show tables;

-- 테이블 만들기
create table pet (
	name	varchar(20),
    owner	varchar(20),
    species	varchar(20),
    gender	char(1),
    birth	DATE,
    death	DATE );
-- schema 확인
desc pet;

-- 조회
select * from pet;
select name, owner, species, gender, birth, death
from pet;

-- 테이블 삭제하기
drop table pet;

-- 데이터 넣기(생성)
insert into pet values('Fluffy','Harold','cat','f','1999-02-04',NULL);

-- 데이터 삭제(delete)
delete from pet;
-- 전체 삭제되기 때문에 where문을 꼭 넣어줌
delete from pet where name='Fluffy';

-- 데이터 수정
update pet set death = null where death = '0000-00-00';

-- 사용 데이터
-- Fluffy	Harold	cat		f	1993-02-04	\N
-- Claws	Gwen	cat		m	1994-03-17	\N
-- Buffy	Harold	dog		f	1989-05-13	\N
-- Fang		Benny	dog		m	1990-08-27	\N
-- Bowser	Diane	dog		m	1979-08-31	1995-07-29
-- Chirpy	Gwen	bird	f	1998-09-11	\N
-- Whistler	Gwen	bird	\N	1997-12-09	\N
-- Slim		Benny	snake	m	1996-04-29	\N




-- 조회 연습1 : where 
-- 1990년 이후에 태어난 아이들은?
select * from pet where birth > '1990-12-31';

-- Gwen과 함께 사는 아이들은?
select * from pet where owner='Gwen';

-- null 다루기 1
-- 살아있는 애들은?
select * from pet where death is null;
-- 죽은 애들은?
select * from pet where death is not null;

-- like 검색(패턴 매칭)
-- 이름이 b로 시작하는 아이들은?
select * from pet where name like 'b%';

-- 이름이 b로 시작하는 아이들 중 이름이 6글자인 애들은?
select * from pet where name like 'b_____';

-- 집계(통계) 함수
-- 총 개체수
select count(*) from pet;
-- null은 제외하고 카운트
select count(death) from pet;
select count(*) from pet where death is not null;
-- 집계함수에는 다른칼럼을 넣으면 x
-- ex) select name, count(*) from pet;

-- order by
-- 어린순으로 정렬
select * from pet order by birth desc, name asc;