-- Average encounters per patient (lifetime total)
SELECT ROUND(COUNT(*) / (SELECT COUNT(*) FROM patients), 1) AS avg_encounters_per_patient
FROM encounters;

-- Average encounters per patient PER YEAR (more interpretable metric)
SELECT ROUND(
    (SELECT COUNT(*) FROM encounters) / 
    (SELECT SUM(TIMESTAMPDIFF(YEAR, BIRTHDATE, IFNULL(DEATHDATE, CURDATE()))) FROM patients)
, 2) AS avg_encounters_per_patient_per_year;

-- Encounter volume by year (shows dataset time range and trend)
SELECT YEAR(START) AS encounter_year, COUNT(*) AS total_encounters
FROM encounters
GROUP BY encounter_year
ORDER BY encounter_year;