--Table
drop table client;
drop table admin;
drop table product;
drop table product_order;
drop table review;
drop table mtm;

--Delete Table
delete from client;
delete from admin;
delete from product;
delete from product_order;
delete from review;
delete from mtm;
delete from cart;

--Select
select * from client;
select * from admin;
select * from product;
select * from product_order;
select * from review;
select * from mtm;

--Table
create table client(
id      varchar2(100)  not null primary key, --PK
pw 	    varchar2(100)  not null,
name    varchar2(100)  not null,
email   varchar2(100)  not null,
address varchar2(100) not null,
phone   varchar2(100)  not null
);
select * from client;

create table admin(
admin_id   varchar2(100) not null primary key, --PK
admin_name varchar2(100) not null,
admin_pw   varchar2(100) not null
);


create table product(
pNum        number       not null primary key, --PK
pName       varchar2(100) not null,
pPrice      number       not null,
pImg        varchar2(100),
pShortInfo  varchar2(200),
pDetailInfo varchar2(4000),
pCategory   varchar2(100)
);


create table product_order(
pNum      number        references product(pNum), --FK : product(pNum)
id        varchar2(100)  references client(id), --FK : client(id)
oNum      number        not null primary key, --PK
oPrice    number        not null,
cnt       number        default 1 not null,
oName     varchar2(100)  not null,
oAddress  varchar2(100) not null,
oPhone    varchar2(100),
oDate     TimeStamp     default sysdate
);
select * from product_order;


create table review(
pNum       number       references product(pNum), --FK : product(pNum)
id         varchar2(100) references client(id), --FK : client(id)
oNum       number       references product_order(oNum), --FK : product_order(oNum)
rNum       number       not null primary key, --PK
content    varchar2(4000),
rImg       varchar2(1000),
rDate      TimeStamp    default sysdate not null
);
select * from review;

create table mtm(
id      varchar2(15)   references client(id), --FK : client(id)
mNum    number         not null primary key,
mKind   varchar2(20)   not null,
title   varchar2(100)  not null,
content varchar2(4000) not null,
reply   varchar2(4000),
mDate   TimeStamp      default sysdate not null
);

create table cart(
cNum number not null primary key,
id   varchar2(100),
pNum number,
cnt  number
);

select * from cart;


drop sequence pNum_seq;
drop sequence oNum_seq;
drop sequence rNum_seq;
drop sequence mNum_seq;
drop sequence cNum_seq;

--Sequence
create sequence pNum_seq start with 1 increment by 1;
create sequence oNum_seq start with 1 increment by 1;
create sequence rNum_seq start with 1 increment by 1;
create sequence mNum_seq start with 1 increment by 1;
create sequence cNum_seq start with 1 increment by 1;

--View1
create or replace view mypage1_view
as
select c.id, p.pNum, p.pName, p.pShortInfo, p.pImg, o.oNum, o.oDate, o.oPrice, o.cnt
from CLIENT c, PRODUCT p, PRODUCT_ORDER o
where p.pNum = o.pNum and c.id = o.id;

select * from mypage1_view;

--View2
create or replace view mypage5_view
as
select c.id, p.pNum, p.pName, p.pImg, r.content, r.rDate
from CLIENT c, PRODUCT p, REVIEW r
where p.pNum = r.pNum and c.id = r.id;

drop view mypage5_view;
select * from mypage5_view;

--View3
create or replace view cart_view
as
select ct.cNum, ct.id, ct.pNum, ct.cnt, p.pImg, p.pName, p.pPrice
from cart ct, client c, product p 
where ct.id = c.id and ct.pNum = p.pNum;

drop view cart_view;
select * from cart_view;
