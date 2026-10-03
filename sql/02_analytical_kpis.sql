-- 1. Regional Immunization Coverage & On-Time Adherence
SELECT 
    c.clinic_region,
    c.city,
    COUNT(v.record_id) AS total_scheduled,
    COUNT(CASE WHEN v.status IN ('Completed', 'Overdue Completed') THEN 1 END) AS administered_doses,
    ROUND(
        COUNT(CASE WHEN v.status IN ('Completed', 'Overdue Completed') THEN 1 END)::numeric / 
        NULLIF(COUNT(v.record_id), 0) * 100, 1
    ) AS coverage_rate_pct,
    ROUND(
        COUNT(CASE WHEN v.status = 'Completed' THEN 1 END)::numeric / 
        NULLIF(COUNT(CASE WHEN v.status IN ('Completed', 'Overdue Completed') THEN 1 END), 0) * 100, 1
    ) AS on_time_adherence_pct
FROM Dim_Clinics c
LEFT JOIN Fact_Vaccinations v ON c.clinic_region = v.clinic_region
GROUP BY c.clinic_region, c.city
ORDER BY coverage_rate_pct DESC;

-- 2. Cohort Non-Compliance / Missed Rate by Age Group
SELECT 
    patient_age_group,
    COUNT(record_id) AS total_scheduled,
    COUNT(CASE WHEN status = 'Missed' THEN 1 END) AS missed_appointments,
    ROUND(
        COUNT(CASE WHEN status = 'Missed' THEN 1 END)::numeric / 
        COUNT(record_id) * 100, 1
    ) AS missed_rate_pct
FROM Fact_Vaccinations
GROUP BY patient_age_group
ORDER BY missed_rate_pct DESC;

-- 3. Adverse Event Following Immunization (AEFI) Rate by Vaccine
SELECT 
    vaccine_type,
    COUNT(CASE WHEN status IN ('Completed', 'Overdue Completed') THEN 1 END) AS doses_given,
    COUNT(CASE WHEN adverse_reaction_reported = 'Yes' THEN 1 END) AS reported_reactions,
    ROUND(
        COUNT(CASE WHEN adverse_reaction_reported = 'Yes' THEN 1 END)::numeric / 
        NULLIF(COUNT(CASE WHEN status IN ('Completed', 'Overdue Completed') THEN 1 END), 0) * 100, 2
    ) AS aefi_rate_pct
FROM Fact_Vaccinations
GROUP BY vaccine_type
HAVING COUNT(CASE WHEN status IN ('Completed', 'Overdue Completed') THEN 1 END) > 0
ORDER BY aefi_rate_pct DESC;
