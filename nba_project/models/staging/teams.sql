SELECT
        *
    FROM
        {{ source(
            "PUBLIC",
            "TEAMS"
        ) }}