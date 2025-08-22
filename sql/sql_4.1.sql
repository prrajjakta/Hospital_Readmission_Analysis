-- calculating the overall 30 day readmission rate
select 
	count(*) as total_admissions,
    sum(is_30day_readmission) as readmissions_30day,
    round((sum(is_30day_readmission) / count(*)) * 100, 2)
as readmission_rate_percent,
	round(avg(length_of_stay)) as avg_length_of_stay,
    round(avg(total_charges)) as avg_charges
from admissions;
select * from admissions;