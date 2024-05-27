-- Sales over a months
SELECT 
    YEAR(`invoice date`) AS year,
    DATE_FORMAT(`invoice date`, 'MMMM') AS months,
    SUM(`total_revenue`) AS revenue_over_month
FROM
    (SELECT 
        *, `sales quantity` * `Sales Price` AS total_revenue
    FROM
        orders) t
GROUP BY YEAR(`invoice date`) , DATE_FORMAT(`invoice date`, 'MMMM')
ORDER BY CASE months
    WHEN 'January' THEN 1
    WHEN 'February' THEN 2
    WHEN 'March' THEN 3
    WHEN 'April' THEN 4
    WHEN 'May' THEN 5
    WHEN 'June' THEN 6
    WHEN 'July' THEN 7
    WHEN 'August' THEN 8
    WHEN 'September' THEN 9
    WHEN 'October' THEN 10
    WHEN 'November' THEN 11
    WHEN 'December' THEN 12
    ELSE NULL
END
