
function wander:projectiles/tick
execute if entity @s[tag=wander.whey_proj_display,predicate=!wander:is_mounted] run function wander:projectiles/whey/hit

execute if entity @s[tag=wander.sword_proj_display,tag=!wander.sword_proj_display_landed] unless predicate wander:riding_arrow run tag @s add wander.sword_proj_display_landed

execute if entity @s[tag=wander.ice_proj_display] unless entity @n[tag=wander.ice_proj,distance=0..1,type=arrow] run function wander:projectiles/ice/convert_nearby_water
execute if entity @s[tag=wander.ice_proj_display] unless entity @n[tag=wander.ice_proj,distance=0..1,type=arrow] run kill @s



execute if entity @s[tag=wander.tower_bottom] run function wander:tower_player_distance


scoreboard players add @s[tag=wander.jenga_checked] wander.temp 1
kill @s[tag=wander.jenga_checked,scores={wander.temp=3..}]
scoreboard players add @s[tag=wander.tower_collapse] wander.temp 1
kill @s[tag=wander.tower_collapse,scores={wander.temp=3..}]


execute if entity @s[tag=wander.cutout] run function wander:cutout/tick


execute if entity @s[tag=wander.sandbag] run function wander:sandbags/tick

execute unless score bad_omen wander.data matches 1 run scoreboard players add @s[tag=wander.bad_omen_fire] wander.gunpowder_timer 1
execute unless score bad_omen wander.data matches 1 if predicate {"condition":"minecraft:random_chance","chance":0.25} run scoreboard players add @s[tag=wander.bad_omen_fire] wander.gunpowder_timer 1



execute if entity @s[tag=wander.bad_omen_fire,scores={wander.gunpowder_timer=200..}] at @s if block ~ ~ ~ fire run setblock ~ ~ ~ air strict
execute if entity @s[tag=wander.bad_omen_fire,scores={wander.gunpowder_timer=200..}] at @s unless block ~ ~ ~ fire run kill

