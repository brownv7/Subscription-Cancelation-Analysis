--EDA
select
    cancelation_reason1,
    count(*)as num_instances,
    count(distinct subscription_id) as num_subs,
from
    public.cancelations
group by
    1;

--How many reasons a user are willing to select  are second reason when canceling.

select
    subscription_id,
    case when cancelation_reason1 is not null then 1 else 0 end as has_reason1,
    case when cancelation_reason2 is not null then 1 else 0 end as has_reason2,
    case when cancelation_reason3 is not null then 1 else 0 end as has_reason3
from
    public.cancelations;

--Metric of measuring user activity when canceling beyond the primary reason. This will show users intention past just canceling and calculate the averages.


with cancels  as (
select
    subscription_id,
    case when cancelation_reason1 is not null then 1 else 0 end as has_reason1,
    case when cancelation_reason2 is not null then 1 else 0 end as has_reason2,
    case when cancelation_reason3 is not null then 1 else 0 end as has_reason3,
    has_reason1 + has_reason2 + has_reason3 as total_reasons,
    has_reason2 + has_reason3 as additional_reasons
from
    public.cancelations
)

select
     round(avg(total_reasons),2) as avg_total_per_sub,
     round(avg(additional_reasons),2) as  avg_additional_per_sub
from
    cancels;

--view all cancelation reasons together

with cancel_subs as(
select
    subscription_id,
    cancelation_reason1 as cancelation_reason
from  
    public.cancelations

union

select
    subscription_id,
    cancelation_reason2 as cancelation_reason
from  
    public.cancelations

union

select
    subscription_id,
    cancelation_reason3 as cancelation_reason
from  
    public.cancelations
)
select
    cancelation_reason,
    count(subscription_id) as num_subs
from 
    cancel_subs
group by
    1;

--create a view for ad hoc or dashboards for making decisions for reason 1,2 or 3

create or replace view junk.all_cancelation_reasons_vbs as
select
    subscription_id,
    cancel_date,
    cancelation_reason1 as cancelation_reason,
    1 as reason_number
from  
    public.cancelations

union

select
    subscription_id,
    cancel_date,
    cancelation_reason2 as cancelation_reason,
    2 as reason_number
from  
    public.cancelations

union

select
    subscription_id,
    cancel_date,
    cancelation_reason3 as cancelation_reason,
    3 as reason_number
from  
    public.cancelations

select
    cancelation_reason,
    reason_number,
    count(subscription_id) as num_subs
from 
    junk.all_cancelation_reasons_vbs
group by
    1,2

--percentage by reason

SELECT
    cancelation_reason,
    reason_number,
    count(subscription_id) as num_subs,
    round(count(subscription_id) * 100.0 / SUM(count(subscription_id)) OVER (),2) as percentage
FROM 
    junk.all_cancelation_reasons_vbs
GROUP BY
    1,2;

--Cancelation by year
ith yearly as (
select
    date_trunc('year',cancel_date::date) as cancel_year,
    cancelation_reason,
    count(*) as num_reason
from
    junk.all_cancelation_reasons_vbs
group by
    1,2
)
select  
    cancel_year,
    cancelation_reason,
    num_reason,
    sum(num_reason) over (partition by cancel_year) as year_total,
    round(num_reason *100 / year_total,2) perc_reason_annual
from
    yearly



