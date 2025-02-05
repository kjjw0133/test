create table tbl_product_01(
pcode varchar2(10) not null primary key,
name varchar2(20),
cost number(10)
)

insert into tbl_product_01 values('AA01', '아메리카노', 3000);
insert into tbl_product_01 values('AA02', '에스프레소', 3500);
insert into tbl_product_01 values('AA03', '카페라떼', 4000);
insert into tbl_product_01 values('AA04', '카라멜마끼', 4500);
insert into tbl_product_01 values('AA05', '카푸치노', 5000);
insert into tbl_product_01 values('AA06', '초코롤케익', 6000);
insert into tbl_product_01 values('AA07', '녹차롤케익', 6500);
insert into tbl_product_01 values('AA08', '망고쥬스', 7000);
insert into tbl_product_01 values('AA09', '핫초코', 2500);

create table tbl_shop_01(
scode varchar2(10) not null primary key,
sname varchar2(20)
)

insert into tbl_shop_01 values('S001', '강남점');
insert into tbl_shop_01 values('S002', '강서점');
insert into tbl_shop_01 values('S003', '강동점');
insert into tbl_shop_01 values('S004', '강북점');
insert into tbl_shop_01 values('S005', '동대문점');
insert into tbl_shop_01 values('S006', '인천점');


create table tbl_salelist_01(
saleno number(10) not null primary key,
pcode varchar2(10) not null,
saledate date,
scode varchar2(10) not null,
amount number(10)
)

insert into tbl_salelist_01 values(100001,'AA01','20180902','S001', 50);
insert into tbl_salelist_01 values(100002,'AA03','20180902','S002', 40);
insert into tbl_salelist_01 values(100003,'AA04','20180902','S002', 20);
insert into tbl_salelist_01 values(100004,'AA04','20180902','S001', 30);
insert into tbl_salelist_01 values(100005,'AA05','20180902','S004', 40);
insert into tbl_salelist_01 values(100006,'AA03','20180902','S004', 30);
insert into tbl_salelist_01 values(100007,'AA01','20180902','S003', 40);
insert into tbl_salelist_01 values(100008,'AA04','20180902','S004', 10);
insert into tbl_salelist_01 values(100009,'AA01','20180902','S003', 20);
insert into tbl_salelist_01 values(100010,'AA05','20180902','S003', 30);
insert into tbl_salelist_01 values(100011,'AA01','20180902','S001', 40);
insert into tbl_salelist_01 values(100012,'AA03','20180902','S002', 50);
insert into tbl_salelist_01 values(100013,'AA04','20180902','S002', 50);
insert into tbl_salelist_01 values(100014,'AA05','20180902','S004', 20);
insert into tbl_salelist_01 values(100015,'AA01','20180902','S003', 30);



select s.saleno, s.pcode, to_char(s.saledate, 'YYYY-MM-DD') SALEDATE  , s.scode, p.name, s.amount, (p.cost * s.amount)
from tbl_product_01 p, tbl_salelist_01 s
where p.pcode = s.pcode;


select sh.scode, sh.sname, '\  ' || TO_CHAR(sum(s.amount * p.cost), '999,999,999,999') COST
from tbl_product_01 p, tbl_shop_01 sh, tbl_salelist_01 s
where p.pcode = s.pcode and sh.scode = s.scode
group by sh.scode, sh.sname;


select p.pcode as 상품코드, p.name as 상품명, '\  ' || TO_CHAR(sum(s.amount * p.cost), '999,999,999,999') as 상품별판매액
from tbl_product_01 p, tbl_salelist_01 s
where p.pcode = s.pcode
group by p.pcode, p.name;



select sh.scode, sh.sname, TO_CHAR(sum(s.amount * p.cost), '999,999,999,999') COST
from tbl_product_01 p, tbl_shop_01 sh, tbl_salelist_01 s
where p.pcode = s.pcode and sh.scode = s.scode
group by sh.scode, sh.sname;






