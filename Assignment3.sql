Create database ExerciseDb1
use ExerciseDb1
create table CompanyInfo
(CId int primary key,
CName nvarchar(50) not null)
insert into CompanyInfo values(1,'SamSung')
insert into CompanyInfo values(2,'HP')
insert into CompanyInfo values(3,'Apple')
insert into CompanyInfo values(4,'Dell')
insert into CompanyInfo values(5,'Toshiba')
insert into CompanyInfo values(6,'Redmi')
select * from CompanyInfo

create table ProductInfo
(PId int primary key,
PName nvarchar(50) not null,
PPrice float not null,
PMDate date not null,
CId int foreign key references CompanyInfo)
select * from ProductInfo
insert into ProductInfo values(101,'Laptop','55000.90','12/12/2023',1)
insert into ProductInfo values(102,'Laptop','35000.90','12/12/2012',2)
insert into ProductInfo values(103,'Mobile','15000.90','12/03/2012',2)
insert into ProductInfo values(104,'Laptop','13500.90','12/12/2012',3)
insert into ProductInfo values(105,'Mobile','65000.90','12/12/2012',3)
insert into ProductInfo values(106,'Laptop','35000.90','12/12/2012',5)
insert into ProductInfo values(107,'Mobile','35000.90','12/01/2012',5)
insert into ProductInfo values(108,'Earpod','1000.90','12/01/2022',3)
insert into ProductInfo values(109,'Laptop','85000.90','12/12/2021',6)
insert into ProductInfo values(110,'Mobile','55000.90','12/12/2020',1)

select  C.CName , P.PName,P.PPrice ,P.PId,P.PMDate 
from CompanyInfo as C
join ProductInfo as P on P.CId = C.CId 

SELECT P.PName, C.CName
FROM ProductInfo as P
JOIN CompanyInfo as C ON P.CId = C.CId

SELECT C.CName, P.PName
FROM CompanyInfo as C
CROSS JOIN ProductInfo as P

----------------------------------------------------------------

create table product(
PId int primary key,
PQ int not null,
PPrice float not null,
Discount float)

insert into product values(1,5,'2500','2')
insert into product values(2,10,'1309.90','5')
insert into product values (3,7,'5678.89','10')

create function DiscountValue
(@PPrice float,@Discount float)
returns float
as
begin
return (select @PPrice - (@PPrice * @Discount / 100))
end

select PId , PPrice, Discount, dbo.DiscountValue(PPrice,Discount) as 'PriceAfterDiscount' from Product