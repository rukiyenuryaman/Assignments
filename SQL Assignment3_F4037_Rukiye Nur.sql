select product_id, quantity, list_price, discount
from sale.order_item
order by product_id, discount DESC

select product_id, discount, sum(quantity) total_quantity
from sale.order_item
group by product_id, discount
order by product_id, discount

WITH T1 AS (
SELECT	product_id, discount, sum(quantity) total_quantity
FROM	SALE.order_item
GROUP BY product_id, discount
) , T2 AS(
SELECT	*, 
		FIRST_VALUE(total_quantity) OVER (PARTITION BY product_id ORDER BY discount) lower_disc_quant,
		LAST_VALUE(total_quantity) OVER (PARTITION BY product_id ORDER BY discount ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) higher_disc_quant	
FROM	T1
), T3 AS (
SELECT	DISTINCT product_id,  1.0*(higher_disc_quant - lower_disc_quant) / lower_disc_quant increase_rate
FROM	T2
) 
SELECT	product_id, 
		CASE WHEN increase_rate >= 0.05 THEN 'positive' 
			WHEN increase_rate <= - 0.05 THEN 'negative'
			ELSE 'neutral'
		END	discount_effect
FROM	T3



