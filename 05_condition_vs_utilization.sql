SELECT 
    CASE 
        WHEN p.Id IN (SELECT PATIENT FROM conditions WHERE DESCRIPTION = 'Hypertension') 
        THEN 'Has Hypertension' 
        ELSE 'No Hypertension' 
    END AS patient_group,
    COUNT(DISTINCT p.Id) AS num_patients,
    ROUND(COUNT(e.Id) / COUNT(DISTINCT p.Id), 1) AS avg_encounters_per_patient,
    ROUND(AVG(e.TOTAL_CLAIM_COST), 2) AS avg_encounter_cost
FROM patients p
JOIN encounters e ON p.Id = e.PATIENT
GROUP BY patient_group;
