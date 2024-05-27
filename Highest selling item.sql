-- Which item has recorded a higher number of sales?
SELECT 
    item, SUM(`total_revenue`) AS total_sale
FROM
    (SELECT 
        *, `sales quantity` * `Sales Price` AS total_revenue
    FROM
        orders) t
GROUP BY item
ORDER BY total_sale DESC
LIMIT 10