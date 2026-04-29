# Generated with MC-Build

scoreboard players add @s wander.phase3.wall_spawn 1
execute if score @s wander.phase3.wall_spawn matches 2 run data merge entity @s {transformation:{scale:[30,250,0.1],translation:[0,125,0]},start_interpolation:1}
execute if score @s wander.phase3.wall_spawn matches 20 run data merge entity @s {transformation:{scale:[0,250,0],translation:[0,125,0]},start_interpolation:1,interpolation_duration:80}
execute if score @s wander.phase3.wall_spawn matches 150.. run kill