WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            "PUBLIC",
            "PLAYERS"
        ) }}
),
renamed AS (
    SELECT
        "0" as player_id,
        "3" as last_name,
        "2" as first_name,
        "1" as full_name,
        "4" as is_active
    FROM
        source
)
SELECT
    *
FROM
    renamed