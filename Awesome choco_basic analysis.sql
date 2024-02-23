show tables;
desc sales;
desc people;
desc geo;
desc products

select * from sales;
 
select GEOID,Amount,Customers from sales; 

select SPID,PID,Amount,Boxes from sales;
 
select SPID,PID,Amount,Boxes, Amount/boxes as 'Amount per box' from sales; 

select * from sales
where Amount>500;

select count(*) from sales
where Amount>500;
 
select * from sales
where GeoID='G1'
Order by PID,Amount desc;

select * from sales
where Amount>500 and year(SaleDate)=2022;
Order by Amount desc;

select * from sales
where boxes>'0' and boxes <='100';

select * from people;

select * from sales
where Amount>'2000' and boxes <='100'
Order by Amount desc;

select * from products;

select * from sales
where Boxes<50
order by boxes asc;

select * from geo;
select * from people;
select * from products
select * from sales;


select p.SPID, p.salesperson, s.GeoID, s.PID, s.amount
from sales s
join people p on p.SPID= s.SPID;


select s.PID, pr.product, pr.category, pr.size
from  products pr
join sales s on s.PID= pr.PID;

select s.saleDate, p.salesperson, pr.product, s.amount, p.team
from sales s
join people p on p.SPID= s.SPID 
join products pr on pr.PID= s.PID;

select s.saleDate, p.salesperson, pr.product, s.amount, p.team
from sales s
join people p on p.SPID= s.SPID 
join products pr on pr.PID= s.PID
where s.amount>500
and p.team= 'Delish';

select s.saleDate, p.salesperson, pr.product, s.amount, p.team
from sales s
join people p on p.SPID= s.SPID 
join products pr on pr.PID= s.PID
and p.team= '';

select * from geo;

select s.saleDate, p.salesperson, pr.product, s.amount, g.Geo
from sales s
join people p on p.SPID= s.SPID 
join products pr on pr.PID= s.PID
join geo g on g.geoid= s.geoid
where g.geo in ('India','New zealand');
  
  select * from products;
  
 select s.SaleDate, p.Salesperson, s.amount, pr.product, g.Geo, p.team
 from sales s
 join people p on p.SPID=s.SPID
 join products pr on pr.PID=s.PID
 join geo g on g.GeoID=s.GeoID
 where g.geo in ("India", "New Zealand")
 and s.amount>500
 and p.team=''
 order by s.saleDate;
 
select s.saleDate, p.salesperson, pr.product, s.amount, g.Geo, p.Team
from sales s
join people p on p.SPID= s.SPID 
join products pr on pr.PID= s.PID
join geo g on g.geoid= s.geoid
where s.amount<500 
and g.geo in ('India','New zealand') 
and p.team= ''
order by saleDate;

select * from products

select p.team, pr.category, sum(s.boxes) as 'Sum of Boxes', sum(s.amount) as 'Sum of Amount'
from sales s
join people p on p.spid= s.spid
join products pr on pr.pid= s.pid
group by p.team, pr.category
order by  p.team, pr.category;


