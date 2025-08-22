-- patient risk segmentation
-- i.e. pattern for multi admissions
select 
	p.patient_id,
    concat(p.first_name, ' ', p.last_name) as patient_name,
    p.insurance_type,
    count(a.admission_id) as total_admissions,
    sum(a.is_30day_readmission) as readmissions,
    max(a.admission_date) as last_admission,
    round(avg(length_of_stay), 1) as avg_los,
    case
		when count(a.admission_id) >= 4 then 'High Risk'
        when count(a.admission_id) >= 2 then 'Medium Risk'
        else 'Low Risk'
	end as risk_category
from patients p

inner join admissions a on p.patient_id = a.patient_id
group by p.patient_id, p.first_name, p.last_name, p.insurance_type
order by total_admissions desc, readmissions desc
limit 20;
