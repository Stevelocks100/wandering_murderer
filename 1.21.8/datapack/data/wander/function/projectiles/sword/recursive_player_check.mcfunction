execute unless block ~ ~ ~ air run tag @s add wander.sword_proj_hit_block
execute if entity @s[tag=wander.sword_proj_hit_block] run function wander:tower_collapse/tree/upwards2/init
execute as @p[tag=wander.potential_target,distance=0..5] at @s align y unless entity @s[tag=wander.sword_proj_hit_block] run function wander:tower_collapse/explode_top
execute if entity @p[tag=wander.potential_target,distance=0..5] run return run function wander:projectiles/sword/resummon_arrow
execute if entity @s[tag=wander.sword_proj_hit_block] run function wander:projectiles/sword/resummon_arrow

#execute if block ~ ~ ~ #wander:air_ish positioned ~ ~-1 ~ unless predicate wander:lone_tower positioned ~ ~-1 ~ unless predicate wander:lone_tower positioned ~ ~2 ~ run function wander:tower_collapse/explode_top

#execute if block ~ ~ ~ #wander:air_ish run return 0
#execute positioned ~ ~1 ~ run function wander:projectiles/sword/recursive_player_check
