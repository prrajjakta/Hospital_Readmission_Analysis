-- MONTHLY READMISSION TRENDS
with monthly as(
	select 
		year(admission_date) as admission_year,
		month(admission_date) as admission_month,
		monthname(admission_date) as month_name,
		count(*) as total_admissions,
		sum(is_30day_readmission) as readmissions,
		round((sum(is_30day_readmission)/count(*))*100, 2) as readmission_rate
	from admissions
	where admission_date >= '2023-01-01'
	group by year(admission_date), month(admission_date), monthname(admission_date)
)
-- 3 MONTH AVERAGE
select
	admission_year,
    admission_month,
    month_name,
    total_admissions,
    readmissions,
    readmission_rate,
    round(avg(readmission_rate)	over (order by admission_year, admission_month
		rows between 2 preceding and current row), 2)  as rolling_3month_rate
from monthly
order by admission_year, admission_month;