-- Top 10 Customers on Amazon
SELECT 
    t.custkey, SUM(t.total_purchase_cost) AS total_purchase
FROM
    (SELECT 
        custkey,
            `sales quantity` * `Sales Price` AS total_purchase_cost
    FROM
        orders) t
GROUP BY t.custkey
ORDER BY total_purchase DESC
LIMIT 10
