SELECT 
    p1.player_id,
    p1.player_name,
    p2."2022_23_salary",
    SUM(p1.mins_played) AS total_mins_played,
    p2."2022_23_salary" / SUM(p1.mins_played) AS salary_per_minute_played,
    p2."2022_23_salary" / SUM(CASE WHEN p1.mins_played > 0 THEN 1 ELSE 0 END) AS salary_per_game_played,
    SUM(CASE WHEN p1.mins_played > 0 THEN 1 ELSE 0 END) AS games_played,
    SUM(CASE WHEN p1.mins_played = 0 THEN 1 ELSE 0 END) AS games_missed,
    SUM(p1.field_goals_made) AS total_field_goals_made,
    SUM(p1.field_goals_attempted) AS total_field_goals_attempted,
    CASE 
        WHEN SUM(p1.field_goals_attempted) = 0 THEN 0
        {# ELSE SUM(p1.field_goals_made) * 1.0 / SUM(p1.field_goals_attempted) #}
    END AS avg_field_goal_pct,
    SUM(p1.three_point_made) AS total_three_point_made,
    SUM(p1.three_point_attempted) AS total_three_point_attempted,
    CASE 
        WHEN SUM(p1.three_point_attempted) = 0 THEN 0
        ELSE SUM(p1.three_point_made) * 1.0 / SUM(three_point_attempted)
    END AS avg_three_point_pct,
    SUM(p1.free_throws_made) AS total_free_throws_made,
    SUM(p1.free_throws_attempted) AS total_free_throws_attempted,
    CASE 
        WHEN SUM(p1.free_throws_attempted) = 0 THEN 0
        ELSE SUM(p1.free_throws_made) * 1.0 / SUM(p1.free_throws_attempted)
    END AS avg_free_throw_pct,
    SUM(p1.offensive_rebounds) AS total_offensive_rebounds,
    SUM(p1.defensive_rebounds) AS total_defensive_rebounds,
    SUM(p1.total_rebounds) AS total_rebounds,
    SUM(p1.assists) as total_assists,
    SUM(p1.assists) * 1.0 / SUM(CASE WHEN p1.mins_played > 0 THEN 1 ELSE 0 END) AS AVG_ASSISTS_PER_GAME,
    SUM(p1.turnovers) AS total_turnovers,
    SUM(p1.turnovers) * 1.0 / SUM(CASE WHEN p1.mins_played > 0 THEN 1 ELSE 0 END) AS AVG_TURNOVERS_PER_GAME,
    SUM(p1.steals) AS total_steals,
    SUM(p1.blocks) AS total_blocks,
    SUM(p1.block_attempts) AS total_block_attempts,
    SUM(p1.personal_fouls) AS total_personal_fouls,
    SUM(p1.personal_foul_drawn) AS total_personal_foul_drawn,
    SUM(p1.points) AS total_points,
    SUM(p1.points) * 1.0 / SUM(CASE WHEN p1.mins_played > 0 THEN 1 ELSE 0 END) AS avg_points_per_game,
    SUM(p1.plus_minus) as total_plus_minus,
    AVG(CASE WHEN p1.mins_played > 0 THEN p1.plus_minus ELSE NULL END) as average_plus_minus
FROM 
    {{ ref('source_player_game_logs') }} as p1
JOIN
    {{ ref('source_player_salaries') }} as p2
ON
    p1.player_name = p2.full_name
GROUP BY 
    p1.player_id, p1.player_name, p2."2022_23_salary"