1)
select employees.EmpName,workschedule.TimeIn,workschedule.TimeOut,workschedule.Position,
Time(workschedule.TimeOut-workschedule.TimeIn) as HoursWorked from employees join workschedule 
on employees.EmpId=workschedule.EmpId where workschedule.TimeIn like '2015-02-10%';

2)
select e.EmpId, e.EmpName, time(sum(w.TimeOut-w.TimeIn)) As 'Hours', e.EmpHourlyPay As
'Pay',round(((time_to_sec(time(sum(w.TimeOut-w.TimeIn)))))*(e.EmpHourlyPay/3600),2) As 'Total Pay' 
from employees e
join workschedule w on e.EmpId=w.EmpId
where w.TimeIn between '2014-01-01 00:00:00' and '2014-12-20 23:59:59'
group by e.EmpId;

3)
select p.productid,p.ProductName,p.reorderlevel-p.unitinstock+1000 as
ReorderAmount,s.SupplierName
from products p join 
(select sp.SupplierId,sp.ProductId from productorders sp 
where sp.OrderPrice =( select min(spn.OrderPrice) from productorders spn 
where spn.productid=sp.productid))  a
on a.productid=p.ProductId
join suppliers s
on s.supplierid=a.supplierid
where p.UnitInStock<=p.ReorderLevel;

4)
select r.RestaurantLocationName,sum(z.foodsales) as FoodSales,sum(z.eventsales) as EventSales
,sum(foodsales+eventsales) as
TotalSales from
(SELECT EventLocation.LocationId, IfNull(foodorderdetails.UnitPrice, 0) as foodsales, 
IfNull(events.MenuPrice, 0) as eventsales from
(SELECT foodorderdetails.LocationId FROM foodorderdetails
UNION
SELECT events.LocationId FROM events) as eventlocation
LEFT JOIN
foodorderdetails on EventLocation.LocationId = foodorderdetails.LocationId
LEFT JOIN
events on EventLocation.LocationId = events.LocationId
 ) z join
restaurantlocations r on z.locationId=r.RestaurantLocationId
group by z.LocationId;

5)
select e.eventname,p.productname from  events e join
menudishes md on e.MenuId=md.MenuId join
dishproducts d on d.DishId=md.DishId join
products p on p.ProductId=d.ProductId where e.Eventname='Event2';

6)
select r.RestaurantLocationName,e.eventname,e.EventLocation,m.MenuType,m.MenuDescription from events e join
Menus m on m.MenuId=e.MenuId join
restaurantlocations r on r.RestaurantLocationId=e.LocationId
where e.EventDate >= now();

8)
select * from ((select hour(FoodOrderDate) as Hour,FoodOrderId,FoodOrderType,FoodOrderDate from
foodorders
where DATE(FoodOrderDate)='2014-02-24' )
union
(select hour(EventBookingDate),EventId,EventLocation,EventBookingDate from events
where DATE(EventBookingDate)='2014-02-24'
)) z order by hour(FoodOrderDate) ;