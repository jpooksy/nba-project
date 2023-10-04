WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            "PUBLIC",
            "TEAMS"
        ) }}
),
renamed AS (
    SELECT
        "id" as team_id,
        "full_name" as full_name,
        "abbreviation" as abbreviation,
        "nickname" as mascot,
        "city" as city,
        "state" as state,
        "year_founded" as year_founded
    FROM
        source
)
SELECT
    *
FROM
    renamed