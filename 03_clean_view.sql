CREATE OR REPLACE VIEW public.participants_clean AS
SELECT
    TRIM(id) AS id,
    NULLIF(NULLIF(LOWER(TRIM(gender)), 'n/a'), '')
        AS gender,
    TRIM(age)::INTEGER AS age,
    LOWER(TRIM(outcome)) AS outcome,

    NULLIF(NULLIF(NULLIF(
        LOWER(TRIM(success)),
        'not available'), 'n/a'), '')::INTEGER
        AS success,

    NULLIF(NULLIF(NULLIF(
        LOWER(TRIM(lost_to_followup)),
        'not available'), 'n/a'), '')::INTEGER
        AS lost_to_followup,

    NULLIF(NULLIF(NULLIF(
        LOWER(TRIM(num_of_msgs)),
        'not available'), 'n/a'), '')::INTEGER
        AS num_of_msgs,

    NULLIF(NULLIF(NULLIF(
        LOWER(TRIM(requests_for_help)),
        'not available'), 'n/a'), '')::INTEGER
        AS requests_for_help,

    NULLIF(NULLIF(NULLIF(
        LOWER(TRIM(total_reports)),
        'not available'), 'n/a'), '')::INTEGER
        AS total_reports,

    NULLIF(NULLIF(NULLIF(
        LOWER(TRIM(non_adherent_28)),
        'not available'), 'n/a'), '')::INTEGER
        AS non_adherent_28,

    NULLIF(NULLIF(NULLIF(
        LOWER(TRIM(exited_treatment_before_180days_)),
        'not available'), 'n/a'), '')::INTEGER
        AS early_exit,

    TRIM(deviation)::INTEGER AS protocol_deviation

FROM public.participants_raw;