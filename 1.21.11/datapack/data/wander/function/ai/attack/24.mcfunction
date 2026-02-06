#execute if entity @n[tag=wander.ai] run title stevelocks100 actionbar "go after sword"
execute if score jump_tick wander.data matches -11.. run return 0
execute unless block ~ ~-0.1 ~ #wander:water_ish if entity @s[tag=wander.threw_sword] run function wander:ai/animation_macro {move:'angry_run',idle:'angry_idle'}
execute if block ~ ~-0.3 ~ #wander:water_ish run function wander:ai/animation_macro {move:'swim',idle:'swim_idle'}

execute store result score sword_distance wander.data run function wander:ai/jump/get_distance {target:"@n[tag=wander.sword_proj_display_landed]"}
execute unless entity @n[tag=wander.sword_proj_display_landed] run function wander:ai/pathfind_macro {target:"@n[tag=wander.sword_proj_display]"}
function wander:ai/pathfind_macro {target:"@n[tag=wander.sword_proj_display_landed]"}


attribute @s movement_speed base set 1.2
execute if score timer wander.data matches ..100 run scoreboard players add timer wander.data 100

execute if score sword_distance wander.data matches 15.. positioned over ocean_floor unless entity @s[distance=0..2] at @s run function wander:ai/jump/jump_forwards
execute if score sword_distance wander.data matches 15.. positioned over ocean_floor if entity @s[distance=0..2] positioned over world_surface if entity @s[distance=0..2] at @s run function wander:ai/jump/jump_forwards

execute if entity @n[tag=wander.sword_proj_display_landed,distance=0..5] run function wander:ai/jump/pick_up
execute unless entity @n[tag=wander.sword_proj_display] run function wander:ai/jump/pick_up




execute if score @s wander.motion1 matches 0 if score sword_distance wander.data matches ..3 run scoreboard players add jump_for_sword wander.data 1
execute unless score @s wander.motion1 matches 0 run scoreboard players set jump_for_sword wander.data 0
execute if score jump_for_sword wander.data matches 13.. positioned over ocean_floor unless entity @s[distance=0..2] at @s run function wander:ai/jump/jump_upwards
execute if score jump_for_sword wander.data matches 13.. positioned over ocean_floor if entity @s[distance=0..2] positioned over world_surface if entity @s[distance=0..2] at @s run function wander:ai/jump/jump_upwards



execute if score @s wander.motion1 matches 0 unless score sword_distance wander.data matches ..3 run scoreboard players add not_moving wander.data 1
execute unless score @s wander.motion1 matches 0 if score not_moving wander.data matches 1.. run scoreboard players remove not_moving wander.data 2
execute if score not_moving wander.data matches 13.. run scoreboard players remove timer wander.data 100
execute if score not_moving wander.data matches 13.. run tag @s add wander.jump_despawn_anim
execute unless score not_moving wander.data matches 13.. run tag @s remove wander.jump_despawn_anim



execute store result score trader_y wander.temp run data get entity @s Pos[1]
execute store result score sword_y wander.temp run data get entity @n[tag=wander.sword_proj_display_landed] Pos[1]
scoreboard players operation sword_y wander.temp -= trader_y wander.temp
execute if score sword_y wander.temp matches ..-3 if score sword_distance wander.data matches ..2 run function wander:ai/jump/pick_up

execute if score sword_distance wander.data matches ..2 \
at @n[tag=wander.sword_proj_display_landed] \
positioned over ocean_floor if entity @n[tag=wander.sword_proj_display_landed,distance=0..2] \
positioned over world_surface unless entity @n[tag=wander.sword_proj_display_landed,distance=0..3] \
run function wander:ai/jump/pick_up

