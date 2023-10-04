SELECT
        *
    FROM
        {{ source(
            "PUBLIC",
            "TEAM_SALARIES"
        ) }}