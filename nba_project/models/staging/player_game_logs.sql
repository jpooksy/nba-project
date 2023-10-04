WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            "PUBLIC",
            "PLAYER_GAME_LOGS"
        ) }}
),
renamed AS (
    SELECT
        SEASON_YEAR AS season_year,
        PLAYER_ID AS player_id,
        PLAYER_NAME AS player_name,
        NICKNAME AS nickname,
        TEAM_ID AS team_id,
        TEAM_ABBREVIATION AS team_abbreviation,
        TEAM_NAME AS team_name,
        GAME_ID AS game_id,
        GAME_DATE AS game_date,
        MATCHUP AS matchup,
        WL AS win_loss,
        MIN AS game_duration_mins,
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
        TOV AS turnovers,
        STL AS steals,
        BLK AS blocks,
        BLKA AS block_attempts,
        PF AS personal_fouls,
        PFD AS personal_foul_drawn,
        PTS AS points,
        PLUS_MINUS AS plus_minus,
        NBA_FANTASY_PTS AS nba_fantasy_points,
        DD2 AS double_doubles,
        TD3 AS triple_doubles,
        WNBA_FANTASY_PTS AS wnba_fantasy_points,
        GP_RANK AS games_played_rank,
        W_RANK AS wins_rank,
        L_RANK AS losses_rank,
        W_PCT_RANK AS win_pct_rank,
        MIN_RANK AS minutes_rank,
        FGM_RANK AS field_goals_made_rank,
        FGA_RANK AS field_goals_attempted_rank,
        FG_PCT_RANK AS field_goal_pct_rank,
        FG3M_RANK AS three_point_made_rank,
        FG3A_RANK AS three_point_attempted_rank,
        FG3_PCT_RANK AS three_point_pct_rank,
        FTM_RANK AS free_throws_made_rank,
        FTA_RANK AS free_throws_attempted_rank,
        FT_PCT_RANK AS free_throw_pct_rank,
        OREB_RANK AS offensive_rebounds_rank,
        DREB_RANK AS defensive_rebounds_rank,
        REB_RANK AS total_rebounds_rank,
        AST_RANK AS assists_rank,
        TOV_RANK AS turnovers_rank,
        STL_RANK AS steals_rank,
        BLK_RANK AS blocks_rank,
        BLKA_RANK AS block_attempts_rank,
        PF_RANK AS personal_fouls_rank,
        PFD_RANK AS personal_foul_drawn_rank,
        PTS_RANK AS points_rank,
        PLUS_MINUS_RANK AS plus_minus_rank,
        DD2_RANK AS double_doubles_rank,
        TD3_RANK AS triple_doubles_rank
   FROM
        source
)
SELECT
    *
FROM
    renamed