Select customer_id, count(customer_id) as count_no_trans
from visit left join transactions 
on visit.visit_id = transactions.visit_id 
where transaction_id is null
group by customer_id