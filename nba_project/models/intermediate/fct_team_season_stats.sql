SELECT 
t1.team_id, t1.games_played, t1.wins, t1.losses, t1.win_percentage, 
t1.field_goals_made, t1.field_goals_attempted, t1.field_goal_percentage, 
t1.three_pointers_made, t1.three_pointers_attempted, t1.three_point_percentage, 
t1.free_throws_made, t1.free_throws_attempted, t1.free_throw_percentage, 
t1.offensive_rebounds, t1.defensive_rebounds, t1.total_rebounds, t1.assists, 
t1.personal_fouls, t1.steals, t1.turnovers, t1.blocks, t1.points, 
t2.year_founded, t3.total_cap, t3.luxury_tax_bill
FROM 
    {{ ref('team_year_by_year_stats') }} as t1
JOIN 
    {{ ref('teams') }} as t2
ON 
    t1.team_id = t2.team_id
JOIN 
    {{ ref('team_salaries') }} as t3
ON 
    t2.full_name = t3.full_name