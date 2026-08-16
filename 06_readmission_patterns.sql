-- Detail: individual pairs of encounters within 30 days of each other
SELECT 
    e1.PATIENT,
    e1.START AS first_encounter,
    e2.START AS second_encounter,
    DATEDIFF(e2.START, e1.START) AS days_between
FROM encounters e1
JOIN encounters e2 
    ON e1.PATIENT = e2.PATIENT 
    AND e2.START > e1.START
    AND DATEDIFF(e2.START, e1.START) <= 30
WHERE e1.PATIENT IN (SELECT Id FROM patients)
ORDER BY e1.PATIENT, e1.START;

-- Summary: what % of known patients had a rapid revisit?
SELECT 
    COUNT(DISTINCT e1.PATIENT) AS patients_with_rapid_revisit,
    (SELECT COUNT(*) FROM patients) AS total_patients,
    ROUND(COUNT(DISTINCT e1.PATIENT) / (SELECT COUNT(*) FROM patients) * 100, 1) AS pct_of_patients
FROM encounters e1
JOIN encounters e2 
    ON e1.PATIENT = e2.PATIENT 
    AND e2.START > e1.START
    AND DATEDIFF(e2.START, e1.START) <= 30
WHERE e1.PATIENT IN (SELECT Id FROM patients);