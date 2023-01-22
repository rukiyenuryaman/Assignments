--1.

select c.customer_id, c.first_name, c.last_name, pro.product_name
  --case pro.product_name
	 -- when 'Polk Audio - 50 W Woofer - Black' then 'YES'
	 -- else 'NO'
 -- end as other_product
from product.product pro
join sale.order_item oi
on pro.product_id=oi.product_id
join sale.orders o 
on oi.order_id=o.order_id
join sale.customer c 
on c.customer_id=o.customer_id
where c.customer_id IN(
		select c.customer_id
		from product.product pro
		join sale.order_item oi
		on pro.product_id=oi.product_id
		join sale.orders o 
		on oi.order_id=o.order_id
		join sale.customer c 
		on c.customer_id=o.customer_id
		where pro.product_name =  '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD')

--Soruyu istenilen þekilde çözemediðim için en azýndan baþta verilen ürünü satýn almýþ müþteriler arasýndan,
--diðer ürünü de satýn alanlarýn listesini getirmek istedim.

select c.customer_id, c.first_name, c.last_name, pro.product_name
from product.product pro
join sale.order_item oi
on pro.product_id=oi.product_id
join sale.orders o 
on oi.order_id=o.order_id
join sale.customer c 
on c.customer_id=o.customer_id
where pro.product_name='Polk Audio - 50 W Woofer - Black'
and c.customer_id IN(
		select c.customer_id
		from product.product pro
		join sale.order_item oi
		on pro.product_id=oi.product_id
		join sale.orders o 
		on oi.order_id=o.order_id
		join sale.customer c 
		on c.customer_id=o.customer_id
		where pro.product_name =  '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD')



--2.
CREATE TABLE ECommerce (	Visitor_ID INT IDENTITY (1, 1) PRIMARY KEY,	Adv_Type VARCHAR (255) 
NOT NULL,	Action1 VARCHAR (255) NOT NULL);
INSERT INTO ECommerce (Adv_Type, Action1)VALUES ('A', 'Left'),('A', 'Order'),('B', 'Left'),('A', 'Order'),('A', 'Review'),('A', 'Left'),('B', 'Left'),('B', 'Order'),('B', 'Review'),('A', 'Review');