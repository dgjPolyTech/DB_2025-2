-- 고명석 고객이 주문한 제품의 고객아이디, 제품명을 검색하시오.
select * from 고객;
select * from 제품;
select * from 주문;

-- 고명석 고객이 주문한 제품의 고객아이디, 제품명ㅇ, 단가를 검색하시오.
select c.고객아이디, p.제품명, p.단가
from 고객 c, 주문 o, 제품 p
where c.고객이름 = '고명석' and c.고객아이디 = o.주문고객 and p.제품번호 = o.주문제품;

-- 나이가 30세 이상인 고객이 주문한 제품의 주문제품과 주문일자를 검색하시오.
-- 자연 조인(내츄럴 조인)
select 주문제품, 주문일자 from 고객, 주문
where 나이 >= 30 and 고객아이디=주문고객;

-- 내부 조인(inner 조인): 두 테이블이 공통으로 갖고 있는 데이터만 가져온다.
select 주문제품, 주문일자 from 고객 inner join 주문 on 고객아이디=주문고객
where 나이>=30;

-- 외부 조인(outer 조인)
-- 주문하지 않은 고객도 포함해서 고객이름과 주문제품, 주문일자를 검색하시오.
-- 왼쪽 외부 조인(left outer 조인): 왼쪽 테이블의 데이터는 다 가져오고, 오른쪽에 없는 데이터는 null 인채로 가져온다.
-- 왼쪽 테이블에 "없는" 데이터를 찾음.
select 고객이름, 주문제품, 주문일자
from 고객 c left outer join 주문 o
on c.고객아이디 = o.주문고객;

-- 오른쪽 외부 조인
select 고객이름, 주문제품, 주문일자
from 주문 o right outer join 고객 c
on c.고객아이디 = o.주문고객;

-- Sub Query
-- 달콤비스킷을 생산한 제조업체가 만든 제품들의 제품명과 단가를 검색하시오.
select 제품명, 단가 
from 제품 
where 제조업체 = (select 제조업체 from 제품 where 제품명='달콤비스킷'); 

select * from 주문;
select * from 제품;

-- 주문테이블에서 쿵떡파이를 주문한 주문고객, 주문제품, 수량을 검색하시오.
select 주문고객, 주문제품, 수량 
from 주문
where 주문제품 = (select 제품번호 from 제품 where 제품명 = '쿵떡파이');

-- 고객 데이터베이스에서 적립금이 가장 많은 고객의 고객이름과 적립금을 검색
select 고객이름, 적립금 from 고객
where 적립금 = (select max(적립금) from 고객);

-- 고객 데이터베이스에서 적립금이 가장 적은 고객의 고객이름과 적립금을 검색
select 고객이름, 적립금 from 고객
where 적립금 = (select min(적립금) from 고객);

-- 다중행 SubQuery
-- 다중행 subQuery는 비교 연산자(=, <, >) 사용 불가
-- banana 고객이 주문한 제품의 제품번호, 제품명, 제조업체를 검색하시오.
select 제품번호, 제품명, 제조업체 
from 제품
where 제품번호 in (select 주문제품 from 주문 where 주문고객 = 'banana');
-- banana 고객이 주문한 제품"들"에 해당하는 제품번호의 제품들을 기준으로 나오게 된다.

select * from 고객;
select * from 주문;

-- 김씨성을 가진 고객의 고객아이디, 나이, 적립금, 주문한 제품명, 단가를 검색하시오.
select 고객아이디, 나이, 적립금, 제품명, 단가
from 고객 c, 제품 p, 주문 o
where c.고객아이디 = o.주문고객 and p.제품번호 = o.주문제품
and c.고객이름 in (select 고객이름 from 고객 where 고객이름 like '김%');


select 주문번호, 주문제품 from 주문;

-- banana 고객이 주문하지 않은 제품의 제품명, 제조업체 검색
select 제품번호, 제품명, 제조업체 from 제품 
where 제품번호 not in (select 주문제품 from 주문 where 주문고객 = 'banana');

-- ALL 연산자 사용: "모든" 항목 이런 내용 있으면 ALL 쓰라는 거임.
-- 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체를 검색하시오.
select 제품명, 단가, 제조업체 from 제품 where 제조업체 = '대한식품';

select 제품명, 단가, 제조업체 from 제품 where 단가 > ALL(
    select 단가 from 제품 where 제조업체 = '대한식품'
);

-- 2022년 3월 15일에 제품을 주문한 고객의 고객이름을 검색해보자.(결과가 1명)
select 고객이름 from 고객 where 고객아이디 = (select 주문고객 from 주문 where 주문일자 = '2022-01-01');

-- 2022년 3월 15일에 제품을 주문한 고객의 고객이름을 검색해보자.(결과가 1명)
select 고객이름 from 고객 where not Exists(select 주문고객 from 주문 where 주문일자 = '2022-01-01' and 주문고객=고객아이디);

