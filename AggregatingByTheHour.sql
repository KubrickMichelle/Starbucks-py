;with cte				--using a CTE to flatten our new date column so we can group by it
as

(select 
*,
dateadd(hour, datediff(hour, 0, uk_time), 0) TimeHour		--Want to group by the hour, so rounding to neareast hour
from starbucks
where translated not like 'mymemory warning%'				--Do not want to include tweets that failed to translate
	  --and sentiment <> 0
)

select 
		 avg(sentiment)				-- taking an average of sentiment score per hour
		,TimeHour

from cte
group by TimeHour
