-- calculating financial impact by service line
select
	hospital_service,
    count(*) as total_admissions,
    sum(is_30day_readmission) as readmissions,
    round((sum(is_30day_readmission) / count(*)) * 100, 2) as readmission_rate,
    
    -- financial metrics
    round(avg(total_charges), 0) as avg_charges_per_admission,
    round(sum(case when is_30day_readmission = 1 then total_charges else 0 end), 0) 
    as total_readmission_charges,
    
    -- estimated penalty calculation --> 3% of readmission charges
    round(sum(case when is_30day_readmission = 1 then total_charges else 0 end) * 0.03, 0) 
    as estimated_cms_penalty,
    
    -- savings potential if rate reduced to 10% 
    round((sum(is_30day_readmission) - count(*) * 0.10) * avg(total_charges), 0)
    as potential_savings
from admissions
group by hospital_service
having count(*) >= 20 
order by estimated_cms_penalty desc;


-- VERIFICATION PART OR COMPLETION STAMP
select 'Queries completed successfully' as status,
	count(*) as total_records,
    min(admission_date) as earliest_date,
    max(admission_date) as latest_date
from admissions;


-- 
select database();
show tables in hospital_readmissions;