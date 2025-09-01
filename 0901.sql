-- 제품 테이블 insert --
--insert into 제품 values
--                    ('p01', '그냥만두', 5000, 4500, '대한식품'),
--                    ('p02', '매운쫄면', 2500, 5500, '민국푸드'),
--                    ('p03', '쿵떡파이', 3600, 2600, '한빛제과'),
--                    ('p04', '맛난초콜릿', 1250, 2500, '한빛제과'),
--                    ('p05', '얼큰라면', 2200, 1200, '대한식품'),
--                    ('p06', '통통우동', 1000, 1550, '민국푸드'),
--                    ('p07', '달콤비스킷', 1650, 1500, '한빛제과');

insert into 제품 values ('p07', '달콤비스킷', 1650, 1500, '한빛제과');

select * from 제품;

-- 고객 테이블 insert --
insert into 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금) values('apple', '정소화', 20, 'gold', '학생', 1000);
--primary key인 고객아이디는 컬럼끼리 겹쳐서는 안됨.
insert into 고객 values('banana', '김선우', 25, 'vip', '간호사', 2500);
insert into 고객 values('carrot', '고명석', 28, 'gold', '교사', 4500);
insert into 고객 values('orange', '김용욱', 25, 'silver', '학생', 0);
insert into 고객 values('melon', '성원용', 35, 'gold', '회사원', 5000);
insert into 고객 values('peach', '오형준', null, 'gold', '교사', 4500);
insert into 고객 values('pear', '채광주', 31, 'silver', '회사원', 500);

select * from 고객;

-- 주문 테이블 insert --
insert into 주문 values('o01', 'apple', 'p03', 10, '서울시 마포구', '2022-01-01');
insert into 주문 values('o02', 'melon', 'p01', 5, '인천시 계양구', '2022-01-10');
insert into 주문 values('o03', 'banana', 'p06', 45, '경기도 부천시', '2022-01-11');
insert into 주문 values('o04', 'carrot', 'p02', 8, '부산시 금정구', '2022-02-01');
insert into 주문 values('o05', 'melon', 'p06', 36, '경기도 용인시', '2022-02-20');
insert into 주문 values('o06', 'banana', 'p01', 19, '충청북도 보은군', '2022-03-02');
insert into 주문 values('o07', 'apple', 'p03', 22, '서울시 영등포구', '2022-03-15');
insert into 주문 values('o08', 'pear', 'p02', 50, '강원도 춘천시', '2022-04-10');
insert into 주문 values('o09', 'banana', 'p04', 15, '전라남도 목포시', '2022-04-11');
insert into 주문 values('o10', 'carrot', 'p03', 20, '경기도 안양시', '2022-05-22');

select * from 주문;
select 고객아이디, 고객이름 from 고객;
                    
select 주문고객 from 주문;

select distinct 주문고객 from 주문;

-- 고객아이디, 고객이름, 등급 컬럼만 고객테이블에서 조회(검색)하시오.--
select 고객아이디, 고객이름, 등급 from 고객;

-- 주문고객, 주문제품, 배송지, 주문일자를 주문테이블에서 조회(단, 주문고객은 고객아이디, 주문제품은 제품번호로 출력)
-- as 혹은 공백문자로 출력
select 주문고객 as 고객아이디, 주문제품 제품번호, 배송지, 주문일자 from 주문;

-- 제품명, 단가를 제품 테이블에서 검색. (단가는 500원을 더하여, 조정단가라는 이름으로 검색)
-- 띄어쓰는 경우에는 쌍따옴표("")로 묶음
select 제품명, 단가+500 "조정 단가" from 제품;

select 제품명, 재고량, 단가 from 제품 where 제조업체='한빛제과';

select 고객이름, 나이, 직업 from 고객 where 직업='회사원';

select 주문제품, 수량, 주문일자
from 주문
where 주문고객 = 'apple' and 수량 >= 15;

select 고객이름, 나이, 직업
from 고객
where 나이 < 33 and 직업 = '회사원';

select 주문제품, 수량, 주문일자, 주문고객 from 주문 
where 주문고객='apple' or 수량 >= 15;

select 고객이름, 등급, 직업 from 고객 where 등급='gold' or 직업='의사';

select 나이, 등급, 직업 from 고객 where (나이 >= 20 and 나이 <= 30) and (등급 = 'gold' or 등급 = 'sliver') and 직업='학생';