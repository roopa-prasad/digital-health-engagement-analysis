-- Check whether messaging and reporting data
-- are missing for the same participants.

WITH data_availability AS (
    SELECT
        success,
        CASE
            WHEN num_of_msgs IS NULL
             AND total_reports IS NULL
                THEN 'Both missing'
            WHEN num_of_msgs IS NULL
                THEN 'Messages missing only'
            WHEN total_reports IS NULL
                THEN 'Reports missing only'
            ELSE 'Both available'
        END AS availability_group
    FROM public.participants_clean
)

SELECT
    availability_group,
    COUNT(*) AS participants,
    COUNT(success) AS known_outcomes,
    COUNT(*) - COUNT(success) AS unavailable_outcomes,
    SUM(success) AS successful_treatments,
    ROUND(100.0 * AVG(success), 1) AS success_rate_pct
FROM data_availability
GROUP BY availability_group
ORDER BY availability_group;