WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            "PUBLIC",
            "TEAM_SALARIES"
        ) }}
),
renamed AS (
    SELECT
        team as full_name,
        total_cap as total_cap,
        luxury_tax_bill as luxury_tax_bill
    FROM
        source
)
SELECT
    *
FROM
    renamed