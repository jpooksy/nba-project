WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            "PUBLIC",
            "GAMES"
        ) }}
),
renamed AS (
    SELECT
        SEASON_ID AS season_id,
        TEAM_ID AS team_id,
        TEAM_ABBREVIATION AS team_abbreviation,
        TEAM_NAME AS team_name,
        GAME_ID AS game_id,
        GAME_DATE AS game_date,
        MATCHUP AS matchup,
        WL AS win_loss,
        "MIN" AS game_duration_mins,
        PTS AS points,
        FGM AS field_goals_made,
        FGA AS field_goals_attempted,
        FG_PCT AS field_goal_pct,
        FG3M AS three_point_made,
        FG3A AS three_point_attempted,
        FG3_PCT AS three_point_pct,
        FTM AS free_throws_made,
        FTA AS free_throws_attempted,
        FT_PCT AS free_throw_pct,
        OREB AS offensive_rebounds,
        DREB AS defensive_rebounds,
        REB AS total_rebounds,
        AST AS assists,
        STL AS steals,
        BLK AS blocks,
        TOV AS turnovers,
        PF AS personal_fouls,
        PLUS_MINUS AS plus_minus
    FROM
        source
)
SELECT
    *
FROM
    renamed