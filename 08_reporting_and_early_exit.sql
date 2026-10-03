-- Examine early exit within each reporting group.

WITH grouped_participants AS (
    SELECT
        early_exit,
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
    COUNT(early_exit) AS known_exit_status,
    COUNT(*) - COUNT(early_exit) AS missing_exit_status,
    COUNT(*) FILTER (
        WHERE early_exit = 1
    ) AS early_exits,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE early_exit = 1)
        / NULLIF(COUNT(early_exit), 0),
        1
    ) AS early_exit_rate_pct
FROM grouped_participants
GROUP BY reporting_group, group_order
ORDER BY group_order;