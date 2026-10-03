-- Repeat the reporting–outcome comparison
-- among participants with early_exit = 0.

WITH grouped_participants AS (
    SELECT
        success,
        CASE
            WHEN total_reports < 60 THEN 'Under 60 days'
            WHEN total_reports < 120 THEN '60–119 days'
            ELSE '120–180 days'
        END AS reporting_group,
        CASE
            WHEN total_reports < 60 THEN 1
            WHEN total_reports < 120 THEN 2
            ELSE 3
        END AS group_order
    FROM public.participants_clean
    WHERE early_exit = 0
      AND total_reports IS NOT NULL
)

SELECT
    reporting_group,
    COUNT(*) AS participants,
    COUNT(success) AS known_outcomes,
    COUNT(*) - COUNT(success) AS unavailable_outcomes,
    SUM(success) AS successful_treatments,
    ROUND(100.0 * AVG(success), 1) AS success_rate_pct
FROM grouped_participants
GROUP BY reporting_group, group_order
ORDER BY group_order;