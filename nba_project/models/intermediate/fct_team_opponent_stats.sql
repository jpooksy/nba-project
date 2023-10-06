WITH team_stats AS (
    SELECT
        G1.GAME_ID,
        G1.TEAM_ID,
        G1.TEAM_NAME,
        g2.win_loss,
        G2.points,
        G2.field_goals_made,
        G2.field_goals_attempted,
        G2.field_goal_pct,
        G2.three_point_made,
        G2.three_point_attempted,
        G2.three_point_pct,
        G2.free_throws_made,
        G2.free_throws_attempted,
        G2.free_throw_pct,
        G2.offensive_rebounds,
        G2.defensive_rebounds,
        G2.total_rebounds,
        G2.assists,
        G2.steals,
        G2.blocks,
        G2.turnovers,
        G2.personal_fouls,
        G2.plus_minus
    FROM
        {{ ref('source_games') }} G1
    JOIN
        {{ ref('source_games') }} G2
        ON G1.GAME_ID = G2.GAME_ID AND G1.TEAM_ID <> G2.TEAM_ID
)
-- Select and aggregate data from the TeamStats CTE
    -- This section calculates various statistics for each team, such as total wins, losses, points, averages, etc.
SELECT
    TS.TEAM_ID AS Team_ID,
    TS.TEAM_NAME AS Team_Name,
    SUM(TS.points) AS Tot_Opp_Points,
    AVG(TS.points) AS Avg_Opp_Points,
    SUM(TS.field_goals_made) AS Tot_Opp_Field_Goals_Made,
    AVG(TS.field_goals_made) AS Avg_Opp_Field_Goals_Made,
    SUM(TS.field_goals_attempted) AS Tot_Opp_Field_Goals_Attempted,
    AVG(TS.field_goals_attempted) AS Avg_Opp_Field_Goals_Attempted,
    AVG(TS.field_goal_pct) AS Avg_Opp_Field_Goal_Percentage,
    SUM(TS.three_point_made) AS Tot_Opp_Three_Pointers_Made,
    AVG(TS.three_point_made) AS Avg_Opp_Three_Pointers_Made,
    SUM(TS.three_point_attempted) AS Tot_Opp_Three_Pointers_Attempted,
    AVG(TS.three_point_attempted) AS Avg_Opp_Three_Pointers_Attempted,
    AVG(TS.three_point_pct) AS Avg_Opp_Three_Pointers_Percentage,
    SUM(TS.free_throws_made) AS Tot_Opp_Free_Throws_Made,
    AVG(TS.free_throws_made) AS Avg_Opp_Free_Throws_Made,
    SUM(TS.free_throws_attempted) AS Tot_Opp_Free_Throws_Attempted,
    AVG(TS.free_throws_attempted) AS Avg_Opp_Free_Throws_Attempted,
    AVG(TS.free_throw_pct) AS Avg_Opp_Free_Throw_Percentage,
    SUM(TS.total_rebounds) AS Tot_Opp_Total_Rebounds,
    AVG(TS.total_rebounds) AS Avg_Opp_Total_Rebounds,
    SUM(TS.offensive_rebounds) AS Tot_Opp_Offensive_Rebounds,
    AVG(TS.offensive_rebounds) AS Avg_Opp_Offensive_Rebounds,
    SUM(TS.defensive_rebounds) AS Tot_Opp_Defensive_Rebounds,
    AVG(TS.defensive_rebounds) AS Avg_Opp_Defensive_Rebounds,
    SUM(TS.assists) AS Tot_Opp_Assists,
    AVG(TS.assists) AS Avg_Opp_Assists,
    SUM(TS.steals) AS Tot_Opp_Steals,
    AVG(TS.steals) AS Avg_Opp_Steals,
    SUM(TS.blocks) AS Tot_Opp_Blocks,
    AVG(TS.blocks) AS Avg_Opp_Blocks,
    SUM(TS.turnovers) AS Tot_Opp_Turnovers,
    AVG(TS.turnovers) AS Avg_Opp_Turnovers,
    SUM(TS.personal_fouls) AS Tot_Opp_Personal_Fouls,
    AVG(TS.personal_fouls) AS Avg_Opp_Personal_Fouls,
    SUM(TS.PLUS_MINUS) AS Tot_Opp_Plus_Minus,
    AVG(TS.PLUS_MINUS) AS Avg_Opp_Plus_Minus
FROM
    team_stats TS
GROUP BY
    TS.TEAM_ID,
    TS.TEAM_NAME
ORDER BY
    TS.TEAM_ID
