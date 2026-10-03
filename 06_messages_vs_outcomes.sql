-- Compare treatment outcomes across message-count groups.
-- These are exploratory groups, not clinical thresholds.

WITH grouped_participants AS (
    SELECT
        success,
        CASE
            WHEN num_of_msgs IS NULL THEN 'Missing message data'
            WHEN num_of_msgs = 0 THEN '0 messages'
            WHEN num_of_msgs BETWEEN 1 AND 5 THEN '1–5 messages'
            WHEN num_of_msgs BETWEEN 6 AND 20 THEN '6–20 messages'
            ELSE '21+ messages'
        END AS message_group,
        CASE
            WHEN num_of_msgs IS NULL THEN 5
            WHEN num_of_msgs = 0 THEN 1
            WHEN num_of_msgs BETWEEN 1 AND 5 THEN 2
            WHEN num_of_msgs BETWEEN 6 AND 20 THEN 3
            ELSE 4
        END AS group_order
    FROM public.participants_clean
)

SELECT
    message_group,
    COUNT(*) AS participants,
    COUNT(success) AS known_outcomes,
    COUNT(*) - COUNT(success) AS unavailable_outcomes,
    SUM(success) AS successful_treatments,
    ROUND(100.0 * AVG(success), 1) AS success_rate_pct
FROM grouped_participants
GROUP BY message_group, group_order
ORDER BY group_order;