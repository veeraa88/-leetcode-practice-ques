/* Write your T-SQL query statement below */
with get_prev_temp as (
select *,lag(temperature) over (order by recordDate) as prev_temp,
lag(recordDate) over(order by recordDate) as prev_day
 from Weather)
  select id from get_prev_temp
  where temperature>prev_temp 
  and datediff(day,prev_day,recordDate) = 1
