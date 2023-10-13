with weekday_avg as (
    select 
        weekday, 
        avg(avgtemp_c) 
    from {{ref('prep_temp')}}
    group by weekday
)
select * 
from weekday_avg