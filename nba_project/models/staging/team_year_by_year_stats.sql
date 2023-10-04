WITH source AS (
    SELECT 
        * 
    FROM 
        {{ source("PUBLIC","TEAM_YEAR_BY_YEAR_STATS") }}
),
renamed AS (
    SELECT
        team_id AS team_id,
        team_city AS team_city,
        team_name AS team_name,
        year AS year,
        gp AS games_played,
        wins AS wins,
        losses AS losses,
        win_pct AS win_percentage,
        conf_rank AS conference_rank,
        div_rank AS division_rank,
        po_wins AS playoff_wins,
        po_losses AS playoff_losses,
        conf_count AS conference_count,
        div_count AS division_count,
        nba_finals_appearance AS nba_finals_appearance,
        fgm AS field_goals_made,
        fga AS field_goals_attempted,
        fg_pct AS field_goal_percentage,
        fg3m AS three_pointers_made,
        fg3a AS three_pointers_attempted,
        fg3_pct AS three_point_percentage,
        ftm AS free_throws_made,
        fta AS free_throws_attempted,
        ft_pct AS free_throw_percentage,
        oreb AS offensive_rebounds,
        dreb AS defensive_rebounds,
        reb AS total_rebounds,
        ast AS assists,
        pf AS personal_fouls,
        stl AS steals,
        tov AS turnovers,
        blk AS blocks,
        pts AS points,
        pts_rank AS points_rank
    from 
        source
)
SELECT 
    * 
FROM 
    renamed
