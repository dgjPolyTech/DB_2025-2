select * from 고객;
select * from 제품;
select * from 주문;

// 고객 테이블에서, 성이 김씨인 고객의 고객이름, 나이, 등급을 검색
Select 고객이름, 나이, 등급 from 고객 
where 고객이름 like '김%';

// 고객 테이블에서, 등급에 'i' 문자가 포함된 고객의 고객이름, 등급, 직업을 검색.
select 고객이름, 등급, 직업 from 고객
where 등급 like '%i%';

// 고객 테이블에서, 고객아이디에 'a' 문자가 포함된 고객의 고객아이디, 고객이름, 등급, 직업 검색
select 고객아이디, 고객이름, 등급, 직업 from 고객
where 고객아이디 like '%a%';

// 고객 테이블에서, 아이디에 a가, 등급에 i가 포함된 고객의 아이디, 이름, 등급, 직업 검색
select 고객아이디, 고객이름, 등급, 직업 from 고객
where 고객아이디 like '%a%' and 등급 like '%i%';

// 고객 테이블에서, 아이디에 a가, 등급에 i가 포함된 고객의 아이디, 이름, 등급, 직업 검색
select 고객아이디, 고객이름, 등급, 직업 from 고객
where 고객이름 like '김%' and (고객아이디 like '%a%' and 등급 like '%i%');

// 고객 테이블에서 고객아이디가 5글자인 고객의 아이디, 나이, 등급, 직업, 적립금 검색
select 고객아이디, 나이, 등급, 직업, 적립금 from 고객
where 고객아이디 like '_____';

// 고객 테이블에서 고객아이디가 5글자이고 적립금이 3000원 이상인 고객의 아이디, 나이, 등급, 직업, 적립금 검색
select 고객아이디, 나이, 등급, 직업, 적립금 from 고객
where 고객아이디 like '_____' and 적립금 >=3000 or length(고객아이디) >= 3;

// 이건 위에 조건에서, or로 아이디 길이가 3 이상인 경우로 검색한 것. length(고객아이디) 이렇게 검색
--select 고객아이디, 나이, 등급, 직업, 적립금 from 고객
--where 고객아이디 like '_____' and 적립금 >=3000 or length(고객아이디) >= 3;

// 고객테이블에서, 직업이 '사'자로 끝나는 고객의 고객이름, 직업, 등급 검색
select 고객이름, 직업, 등급 from 고객
where 직업 like '%사';

// 고객테이블에서, 직업이 '사'자로 끝나며 2글자인 고객의 고객이름, 직업, 등급 검색
select 고객이름, 직업, 등급 from 고객
where 직업 like '_사';

// 고객테이블에서 나이가 아직 입력되지 않는 고객의 고객이름, 나이를 검색하시오.
select 고객이름, 나이 from 고객 where 나이 is null;

// 고객테이블에서 나이가 입력된 고객의 고객이름, 나이를 검색하시오.
select 고객이름, 나이 from 고객 where 나이 is not null;

// 고객테이블에서 나이가 25세 미만인 고객 검색
// 입력된 값이 없는 컬럼은 비교 연산 결과가 false라서 검색이 안된다.
select 고객이름, 나이 from 고객 where 나이 is not null and 나이 < 25;

// 25세 이상인 고객
// 여기도 당연히 null이면 검색 안됨
select 고객이름, 나이 from 고객 where 나이 >= 25;

-- asc(오름차순)/desc(내림차순) 
-- asc나 desc는 null값을 포함하여 검색
-- asc로 하면, null이 "마지막에" 나옴.
select 고객이름, 나이 from 고객 order by 나이 asc;
select 고객이름, 나이 from 고객 order by 나이 desc;

-- 등급이 gold or vip인 고객의 이름, 나이, 등급, 직업을 등급 오름차순으로 정렬하여 조회
select 고객이름, 나이, 등급, 직업 from 고객 
where 등급 = 'gold' or 등급 = 'vip'
order by 등급 asc;

select * from 주문
where (주문제품 = 'p03' or 주문제품 = 'p06') and 배송지 like '%경기도%'
order by 수량 desc;

-- 주문테이블에서 수량이 10개 이상인 주문의 주문고객, 주문제품, 수량, 주문일자를 검색하시오. 
-- 단 주문 제품을 기준으로 오름차순 정렬하고, 동일 주문 제품은 수량 기준 내림차순 하시오.
-- 먼저 주문제품을 기준으로 오름차순하고, 같은 제품의 경우 수량을 기준으로 내림차순하게 된다.
select 주문고객, 주문제품, 수량, 주문일자 from 주문 
where 수량 >= 10
order by 주문제품 asc, 수량 desc;

-- 주문테이블에서 a 또는 b로 시작하고 수량이 10개 이상인 주문의 주문고객, 주문제품, 수량, 배송지를 검색하시오.
-- 다 주문고객을 기준으로 내림차순 정렬하고 동일 주문고객은 주문제품을 기준으로 내림차순 정렬하시오.
select 주문고객, 주문제품, 수량, 배송지 from 주문
where (주문고객 like 'a%' or 주문고객 like 'b%') and 수량 >= 10
order by 주문고객 desc, 주문제품 desc;

-- 집계함수(count, avg, sum 등등...)
-- (***중요***) 집계함수는 null값이 있는 컬럼의 값은 집계에서 제외한다.
-- 단, count(*)는 예외이다. 이 경우에는 null 값이어도 개수를 집계한다.

-- 제품테이블에서 단가의 평균을 검색하시오.
-- round는 round(컬럼, 소수점 자릿수) 이렇게 사용함
select round(avg(단가), 2) as 단가평균 from 제품;
-- celi = 올림 함수. 천장이라는 뜻
select ceil(avg(단가)) from 제품;
-- floor = 내림 함수. 바닥이라는 뜻
select floor(avg(단가)) from 제품;

select sum(재고량) "재고량 합계" from 제품 where 제조업체 = '한빛제과';
-- 띄어쓰기 사용 시 반드시 ""로 묶어줘야 함.
select sum(단가) "2500원 이상의 단가의 합계" from 제품 where 단가 >= 2500;

-- 고객 테이블에서 고객아이디 컬럼수 출력
select count(고객아이디) 고객수 from 고객;

-- 고객 테이블에서 나이 컬럼수 출력
select count(나이) 고객수 from 고객;
-- 여긴 null 값도 포함함.
select count(*) 고객수 from 고객;