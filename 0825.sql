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

/* 고객 컬럼 추가 */
alter table 고객 add 가입날짜 date;
