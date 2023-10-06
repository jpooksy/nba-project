WITH team_stats AS (
    SELECT
        G1.*
    FROM
        {{ ref('source_games') }} G1
    JOIN
        {{ ref('source_games') }} G2
        ON G1.GAME_ID = G2.GAME_ID AND G1.TEAM_ID <> G2.TEAM_ID
)
SELECT
    TS.TEAM_ID AS Team_ID,
    TS.TEAM_NAME AS Team_Name,
    SUM(CASE WHEN TS.win_loss = 'W' THEN 1 ELSE 0 END) AS TOTAL_WINS,
    SUM(CASE WHEN TS.win_loss = 'L' THEN 1 ELSE 0 END) AS TOTAL_LOSSES,
    SUM(TS.points) AS Tot_Points,
    AVG(TS.points) AS Avg_Points,
    SUM(TS.field_goals_made) AS Tot_Field_Goals_Made,
    AVG(TS.field_goals_made) AS Avg_Field_Goals_Made,
    SUM(TS.field_goals_attempted) AS Tot_Field_Goals_Attempted,
    AVG(TS.field_goals_attempted) AS Avg_Field_Goals_Attempted,
    SUM(TS.field_goal_pct) AS Tot_Field_Goal_Percentage,
    AVG(TS.field_goal_pct) AS Avg_Field_Goal_Percentage,
    SUM(TS.three_point_made) AS Tot_Three_Pointers_Made,
    AVG(TS.three_point_made) AS Avg_Three_Pointers_Made,
    SUM(TS.three_point_attempted) AS Tot_Three_Pointers_Attempted,
    AVG(TS.three_point_attempted) AS Avg_Three_Pointers_Attempted,
    AVG(TS.three_point_pct) AS Avg_Three_Pointers_Percentage,
    SUM(TS.free_throws_made) AS Tot_Free_Throws_Made,
    AVG(TS.free_throws_made) AS Avg_Free_Throws_Made,
    SUM(TS.free_throws_attempted) AS Tot_Free_Throws_Attempted,
    AVG(TS.free_throws_attempted) AS Avg_Free_Throws_Attempted,
    AVG(TS.free_throw_pct) AS Avg_Free_Throw_Percentage,
    SUM(TS.total_rebounds) AS Tot_Total_Rebounds,
    AVG(TS.total_rebounds) AS Avg_Total_Rebounds,
    SUM(TS.offensive_rebounds) AS Tot_Offensive_Rebounds,
    AVG(TS.offensive_rebounds) AS Avg_Offensive_Rebounds,
    SUM(TS.defensive_rebounds) AS Tot_Defensive_Rebounds,
    AVG(TS.defensive_rebounds) AS Avg_Defensive_Rebounds,
    SUM(TS.assists) AS Tot_Assists,
    AVG(TS.assists) AS Avg_Assists,
    SUM(TS.steals) AS Tot_Steals,
    AVG(TS.steals) AS Avg_Steals,
    SUM(TS.blocks) AS Tot_Blocks,
    AVG(TS.blocks) AS Avg_Blocks,
    SUM(TS.turnovers) AS Tot_Turnovers,
    AVG(TS.turnovers) AS Avg_Turnovers,
    SUM(TS.personal_fouls) AS Tot_Personal_Fouls,
    AVG(TS.personal_fouls) AS Avg_Personal_Fouls,
    SUM(TS.PLUS_MINUS) AS Tot_Plus_Minus,
    AVG(TS.PLUS_MINUS) AS Avg_Plus_Minus
FROM
    team_stats TS
GROUP BY
    TS.TEAM_ID,
    TS.TEAM_NAME
ORDER BY
    TS.TEAM_ID
