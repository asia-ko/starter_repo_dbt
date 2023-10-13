with weekday_avg as (
    select 
        weekday,
        year,
        avg(avgtemp_c) 
    from {{ref('prep_temp')}}
    group by weekday, year
)
select * 
from weekday_avg