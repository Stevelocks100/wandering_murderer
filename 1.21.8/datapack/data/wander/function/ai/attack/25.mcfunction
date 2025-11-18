#execute if entity @n[tag=wander.ai] run title stevelocks100 actionbar "go after player"
execute if score jump_tick wander.data matches -11.. run return 0
execute unless block ~ ~-0.1 ~ #wander:water_ish run function wander:ai/animation_macro {move:'angry_run_sword',idle:'angry_idle'}
execute if block ~ ~-0.3 ~ #wander:water_ish run function wander:ai/animation_macro {move:'swim',idle:'swim_idle'}

execute unless entity @p[tag=wander.target] run tag @p[tag=wander.potential_target,distance=0..80] add wander.target
execute store result score player_distance wander.data run function wander:ai/jump/get_distance {target:"@p[tag=wander.target]"}
function wander:ai/pathfind_macro {target:"@p[tag=wander.target]"}

attribute @s movement_speed base set 1.2

execute if entity @s[tag=wander.jump_for_target,nbt={OnGround:1b}] run scoreboard players set ai wander.data 20
execute if entity @s[tag=wander.jump_for_target,nbt={OnGround:1b}] run tag @s remove wander.jump_for_target

execute positioned over ocean_floor unless entity @s[distance=0..2] at @s if score player_distance wander.data matches 20.. run function wander:ai/jump/to_player_init
execute positioned over ocean_floor if entity @s[distance=0..2] positioned over world_surface if entity @s[distance=0..2] at @s if score player_distance wander.data matches 20.. run function wander:ai/jump/to_player_init

execute if score player_distance wander.data matches ..10 if entity @s[nbt={OnGround:1b}] run scoreboard players set ai wander.data 20

