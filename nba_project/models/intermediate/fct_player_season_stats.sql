SELECT 
    player_id,
    player_name,
    SUM(mins_played) AS total_mins_played,
    SUM(CASE WHEN mins_played > 0 THEN 1 ELSE 0 END) AS games_played,
    SUM(CASE WHEN mins_played = 0 THEN 1 ELSE 0 END) AS games_missed,
    SUM(field_goals_made) AS total_field_goals_made,
    SUM(field_goals_attempted) AS total_field_goals_attempted,
    CASE 
        WHEN SUM(field_goals_attempted) = 0 THEN 0
        ELSE SUM(field_goals_made) * 1.0 / SUM(field_goals_attempted)
    END AS AVG_FIELD_GOAL_PCT,
    SUM(three_point_made) AS total_three_point_made,
    SUM(three_point_attempted) AS total_three_point_attempted,
    CASE 
        WHEN SUM(three_point_attempted) = 0 THEN 0
        ELSE SUM(three_point_made) * 1.0 / SUM(three_point_attempted)
    END AS AVG_THREE_POINT_PCT,  -- Changed the alias here
    SUM(free_throws_made) AS total_free_throws_made,
    SUM(free_throws_attempted) AS total_free_throws_attempted,
    CASE 
        WHEN SUM(free_throws_attempted) = 0 THEN 0
        ELSE SUM(free_throws_made) * 1.0 / SUM(free_throws_attempted)
    END AS AVG_FREE_THROW_PCT,
    SUM(offensive_rebounds) AS total_offensive_rebounds,
    SUM(defensive_rebounds) AS total_defensive_rebounds,
    SUM(total_rebounds) AS total_rebounds,
    SUM(assists) AS total_assists,
    SUM(assists) * 1.0 / SUM(CASE WHEN mins_played > 0 THEN 1 ELSE 0 END) AS AVG_ASSISTS_PER_GAME,  -- Added this line
    SUM(turnovers) AS total_turnovers,
    SUM(turnovers) * 1.0 / SUM(CASE WHEN mins_played > 0 THEN 1 ELSE 0 END) AS AVG_TURNOVERS_PER_GAME,  -- Added this line
    SUM(steals) AS total_steals,
    SUM(blocks) AS total_blocks,
    SUM(block_attempts) AS total_block_attempts,
    SUM(personal_fouls) AS total_personal_fouls,
    SUM(personal_foul_drawn) AS total_personal_foul_drawn,
    SUM(points) AS total_points,
    SUM(points) * 1.0 / SUM(CASE WHEN mins_played > 0 THEN 1 ELSE 0 END) AS AVG_POINTS_PER_GAME  -- Added this line
    
FROM 
    {{ ref('player_game_logs') }}
GROUP BY 
    player_id, player_name
