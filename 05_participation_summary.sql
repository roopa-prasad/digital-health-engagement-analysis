-- Summarise messaging and medication reporting

SELECT
    COUNT(*) AS total_participants,

    COUNT(num_of_msgs) AS participants_with_message_data,
    MIN(num_of_msgs) AS minimum_messages,
    MAX(num_of_msgs) AS maximum_messages,
    ROUND(AVG(num_of_msgs), 1) AS average_messages,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY num_of_msgs
    ) AS median_messages,

    COUNT(total_reports) AS participants_with_reporting_data,
    MIN(total_reports) AS minimum_reporting_days,
    MAX(total_reports) AS maximum_reporting_days,
    ROUND(AVG(total_reports), 1) AS average_reporting_days,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY total_reports
    ) AS median_reporting_days

FROM public.participants_clean;