-- Show detailed outcomes within reporting groups.

WITH reporting_groups AS (
    SELECT
        outcome,
        CASE
            WHEN total_reports IS NULL THEN 'Missing reporting data'
            WHEN total_reports < 60 THEN 'Under 60 days'
            WHEN total_reports < 120 THEN '60–119 days'
            ELSE '120–180 days'
        END AS reporting_group,
        CASE
            WHEN total_reports IS NULL THEN 4
            WHEN total_reports < 60 THEN 1
            WHEN total_reports < 120 THEN 2
            ELSE 3
        END AS group_order
    FROM public.participants_clean
)

SELECT
    reporting_group,
    COUNT(*) AS participants,
    COUNT(*) FILTER (
        WHERE outcome IN ('completed', 'cured')
    ) AS successful_outcomes,
    COUNT(*) FILTER (
        WHERE outcome = 'default_lost'
    ) AS lost_to_followup,
    COUNT(*) FILTER (
        WHERE outcome = 'death'
    ) AS deaths,
    COUNT(*) FILTER (
        WHERE outcome = 'failure'
    ) AS treatment_failures,
    COUNT(*) FILTER (
        WHERE outcome = 'deviation'
    ) AS protocol_deviations
FROM reporting_groups
GROUP BY reporting_group, group_order
ORDER BY group_order;