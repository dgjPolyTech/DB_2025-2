/* 고객 테이블 생성 SQL문 */
CREATE TABLE 고객 (
    고객아이디 VARCHAR(20) NOT NULL,
    고객이름 VARCHAR(10) NOT NULL,
    나이 INT, 
    등급 VARCHAR(10) NOT NULL,
    직업 VARCHAR(20),
    적립금 INT DEFAULT 0,
    PRIMARY KEY(고객아이디)
);

/* 제품 테이블 생성 SQL문 */
CREATE TABLE 제품(
    제품번호 VARCHAR(5) NOT NULL,
    제품명 VARCHAR(20),
    재고량 INT,
    단가 INT,
    제조업체 VARCHAR(20),
    PRIMARY KEY(제품번호),
    CHECK(재고량>=0 AND 재고량<=10000)
);
/* CHAR은 배정된 크기를 다 사용해야함. VARCHAR는 다 사용하지 않아도 됨. */

create table 주문(
    주문번호 varchar(5) not null,
    주문고객 varchar(20),
    주문제품 varchar(5),
    수량 int,
    배송지 varchar(30),
    주문일자 date, 
    primary key(주문번호),
    foreign key(주문고객) references 고객(고객아이디),
    foreign key(주문제품) references 제품(제품번호)
);

create table 배송업체(
    업체번호 varchar(5) not null primary key,
    업체명 varchar(20),
    주소 varchar(100),
    전화번호 varchar(20)
);

/* 새로운 유저 만들고 권한 부여 하는 문구. */
create user c##test identified by 1234;
grant dba, connect, resource to c##test; 

/* alter = 특정 테이블의 구조를 수정 */
/* 고객 컬럼 추가 */
alter table 고객 add 가입날짜 date;

/* 고객에서 가입날짜 컬럼 삭제  */
alter table 고객 
                drop column 가입날짜;
                
/* 고객 테이블 제약조건(check) 추가 */
/* 나이가 20 이상인 고객만 추가 */
alter table 고객
                add constraint check_age check(나이>=20);

/* 제약조건 삭제 */
alter table 고객
                drop constraint check_age;
                
/* 배송업체 테이블 삭제 */
drop table 배송업체;

-- 고객 테이블에 행 삽입(추가)
-- 고객(컬럼명들)에서 컬럼명끼리 순서는 바꿔도 됨. 값을 순서에 맞춰서 쓰기만 하면 됨)
-- 지금처럼 모든 컬럼에 값들을 "순서대로" 넣는 상황에서는 (컬럼명들) 생략이 가능함.  
insert into 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금) values('apple', '정소화', 20, 'gold', '학생', 1000);

--primary key인 고객아이디는 컬럼끼리 겹쳐서는 안됨.
insert into 고객 values('banana', '김선우', 25, 'vip', '간호사', 2500);
insert into 고객 values('carrot', '고명석', 28, 'gold', '교사', 4500);

insert into 고객 values('orange', '김용욱', 25, 'silver', '학생', 0);
insert into 고객 values('melon', '성원용', 35, 'gold', '회사원', 5000);
insert into 고객 values('peach', '오형준', null, 'gold', '교사', 4500);
insert into 고객 values('pear', '채광주', 31, 'silver', '회사원', 500);

select * from 고객;