-- What item is being sold frequently in each quarter?
 select 
 new_table.quarter,
 new_table.item,
 new_table.qurter_revenue
 from 
  (
    select 
  t.quarter,
  t.item,
  sum(t.total_revenue) as qurter_revenue,
  dense_rank() over (partition by t.quarter order by sum(t.total_revenue) desc) as rank_1
from 
  (
    select
  *,
  `sales quantity`*`Sales Price` as total_revenue,
  case
    when date_format(`invoice date`,'MMMM') IN ('January','February','March') THEN 'Q1'
    when date_format(`invoice date`,'MMMM') IN ('April','May','June') THEN 'Q2'
    when date_format(`invoice date`,'MMMM') IN ('July','August','September') THEN 'Q3'
    when date_format(`invoice date`,'MMMM') IN ('October','November','December') THEN 'Q4'
   else null end as quarter
from 
  orders
  )t 
group by 
  t.quarter,
  t.item
  )new_table 
where 
  new_table.rank=1
  