WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            "PUBLIC",
            "PLAYER_SALARIES_OUTPUT"
        ) }}
),
renamed AS (
    SELECT
        "full_name" as full_name,
        "first_name" as first_name,
        "last_name" as last_name,
        "2022-23" as "2022-23_salary",
        "2023-24" as "2023-24_salary",
        "2024-25" as "2024-25_salary",
        "2025-26" as "2025-26_salary",
        "2026-27" as "2026-27_salary"
    FROM
        source
)
SELECT
    *
FROM
    renamed