with weekly_temp 
 			as (select city,
            		date_part('week', date) as week,
            		avg(avgtemp_c) as weekly_avg,
            		max(avgtemp_c) as weekly_max,
            		min(avgtemp_c) as weekly_min
            		from {{ref('prep_temp')}}                  
                    group by (city, week)
)
select * from weekly_temp 
;