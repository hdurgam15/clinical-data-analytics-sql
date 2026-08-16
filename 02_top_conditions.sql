SELECT DESCRIPTION AS condition_name, COUNT(*) AS occurrence_count
FROM conditions
GROUP BY DESCRIPTION
ORDER BY occurrence_count DESC
LIMIT 10;