#recursive

scoreboard players remove raycast_limit wander.temp 1
execute unless block ~ ~ ~ #wander:motion_ish run return run function wander:spawn_search/raycast3
execute if score raycast_limit wander.temp matches 1.. positioned ^ ^ ^0.4 run function wander:spawn_search/raycast2