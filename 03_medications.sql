SELECT DESCRIPTION AS medication_name, COUNT(*) AS times_prescribed
FROM medications
GROUP BY DESCRIPTION
ORDER BY times_prescribed DESC
LIMIT 10;