-- 1. growth in sales revenue over the course of a year?
SELECT 
    YEAR(`invoice date`) AS year,
    SUM(`total_revenue`) AS revenue_per_year
FROM
    (SELECT 
        *, `sales quantity` * `Sales Price` AS total_revenue
    FROM
        orders) t
GROUP BY YEAR(`invoice date`)