-- readmission analysis by primary diagnosis
-- readmission rates by diagnosis with severity analysis

select a.primary_diagnosis,
	count(*) as total_admissions,
    sum(a.is_30day_readmission) as readmissions,
    round((sum(a.is_30day_readmission)/count(*)) * 100, 2) as readmission_rate,
    round(avg(a.length_of_stay), 1) as avg_los,
    round(avg(a.total_charges), 2) as avg_charges
from admissions a
left join diagnoses d on a.primary_diagnosis = d.diagnosis_name
group by a.primary_diagnosis
having count(*) >= 10
order by readmission_rate desc;
    