-- Compare message groups within medication-reporting groups.
-- Exploratory categories, not clinical thresholds.

WITH participation_groups AS (
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
        END AS reporting_order,
        CASE
            WHEN num_of_msgs <= 5 THEN '0–5 messages'
            ELSE '6+ messages'
        END AS message_group,
        CASE
            WHEN num_of_msgs <= 5 THEN 1
            ELSE 2
        END AS message_order
    FROM public.participants_clean
    WHERE num_of_msgs IS NOT NULL
      AND total_reports IS NOT NULL
)

SELECT
    reporting_group,
    message_group,
    COUNT(*) AS participants,
    COUNT(success) AS known_outcomes,
    COUNT(*) - COUNT(success) AS unavailable_outcomes,
    SUM(success) AS successful_treatments,
    ROUND(100.0 * AVG(success), 1) AS success_rate_pct
FROM participation_groups
GROUP BY
    reporting_group,
    reporting_order,
    message_group,
    message_order
ORDER BY reporting_order, message_order;