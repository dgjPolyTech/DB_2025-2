select * from 고객;
--고객테이블에 고객아이디는 strawberry, 고객이름 최유경, 나이 30세, 등급 vip, 직업 공무원, 적립금 100원인 고객의 정보 삽입
INSERT INTO 고객 VALUES('strawberry', '최유경', 30, 'vip', '공무원', 100);

-- 고객테이블에 고객아이디는 kiwi, 고객이름 김키위, 나이 25세, 등급 gold, 직업은 회사원, 적립금 500원인 고객의 정보 삽입
insert into 고객(고객아이디, 고객이름, 직업, 나이, 등급, 적립금) values('kiwi', '김키위', '학생', 23, 'silver', 500);

-- 고객테이블에 고객아이디는 grape, 고객이름 강포도, 등급 vip, 직업은 의사, 적립금 1500원인 고객의 정보 삽입
insert into 고객(고객아이디, 고객이름, 직업, 등급, 적립금) values('grape', '강포도', '의사', 'vip', 1500);

--create table 한빛제품(
--    "제품명" varchar(20) not null primary key,
--    "재고량" NUMBER, 
--    "단가" NUMBER
--);

create table 한빛제품(
    "제품명" varchar(20) not null,
    "재고량" NUMBER, 
    "단가" NUMBER,
    PRIMARY KEY(제품명)
); 

-- 서브쿼리를 통해 삽입
INSERT INTO 한빛제품(제품명, 재고량, 단가) 
                    SELECT 제품명, 재고량, 단가 FROM 제품 WHERE 제조업체 = '한빛제과';
                    
SELECT * FROM 한빛제품;

select * from 제품;
-- 데이터 업데이트(수정) 연습
-- update 테이블명 set 컬럼명=값, 컬럼명=값...
-- update문은 조건절(where)이 꼭 필요함. 조건을 안 쓰면 모든 행이 update 됨.
-- 제품 테이블에서 제품번호가 p05인 제품에 제품명을 신나라면, 가격 2000원으로 수정
update 제품 
set 제품명='신나라면', 단가=2000
where 제품번호 = 'p05';

-- 제품 테이블에서 모든 제품의 단가를 20% 인상된 금액으로 수정
update 제품
set 단가 = 단가*1.2;

select * from 주문;

-- 부속질의문(sub query) 사용
-- 정소화 고객이 주문한 제품의 주문수량을 5개로 수정.
update 주문 set 수량=5
    where 주문고객 in (select 고객아이디 from 고객 where 고객이름='정소화');
    
-- 데이터 삭제 연습(DELETE문)
-- UPDATE문과 마찬가지로, 조건절을 안 넣으면 특정 행만 삭제될 수 있음.

-- 한빛제품 테이블에서 단가가 1000원 이상 2500원 이하인 행 삭제
DELETE FROM 한빛제품 
WHERE 단가 >= 1000 AND 단가 <= 2500;

SELECT * FROM 고객;
-- 고객이름이 김키위인 고객의 정보 삭제
DELETE FROM 고객
WHERE 고객이름 = '김키위';

SELECT * FROM 한빛제품;

-- VIEW 생성하기
-- 고객테이블 등급이 VIP인 고객의 고객아이디, 고객이름, 나이, 등급으로 구성된 VIEW를 우수고객이라는 이름으로 생성
create view 우수고객(고객아이디, 고객이름, 나이, 등급)
        as select 고객아이디, 고객이름, 나이, 등급 from 고객
                                                where 등급='vip'
        with check option;
        
select * from 우수고객;

create view 업체별제품수(제조업체, 제품수)
    as select 제조업체, count(*) from 제품 
                                group by 제조업체
    with check option;
    
select * from 업체별제품수;

select * from 우수고객
        where 나이 >= 30;
        
create view 제품1(제품명, 재고량, 제조업체)
as select 제품명, 재고량, 제조업체 from 제품
with check option;

create view 제품2(제품번호, 재고량, 제조업체)
as select 제품번호, 재고량, 제조업체 from 제품
with check option;

select * from 제품2;

insert into 제품2 values('p08', 1000, '신선식품');

-- 가상 테이블 삭제
drop view 제품1;
drop view 제품2;