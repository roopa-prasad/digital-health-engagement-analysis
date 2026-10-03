-- Treatment outcome summary
-- Success: 1 = successful treatment, 0 = unsuccessful treatment
-- NULL = unavailable outcome

SELECT
    COUNT(*) AS total_participants,
    COUNT(success) AS known_success_outcomes,
    COUNT(*) - COUNT(success) AS unavailable_success_outcomes,
    SUM(success) AS successful_treatments,
    ROUND(100.0 * AVG(success), 1) AS success_rate_pct
FROM public.participants_clean;