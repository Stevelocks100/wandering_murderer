execute if entity @s[predicate=wander:on_ground] run tag @s remove wander.jump_for_sword
execute if block ~ ~ ~ #wander:water_blocks run tag @s remove wander.jump_for_sword
execute if block ~ ~-1 ~ #wander:water_blocks run tag @s remove wander.jump_for_sword

execute if entity @s[tag=wander.jump_for_sword] run return 0

execute unless block ~ ~-0.1 ~ #wander:water_blocks if entity @s[tag=wander.threw_sword] if block ~ ~2.5 ~ #wander:can_pass if block ~ ~3.5 ~ #wander:can_pass run function wander:ai/anim_states/angry_no_sword
execute unless block ~ ~-0.1 ~ #wander:water_blocks unless entity @s[tag=wander.threw_sword] if block ~ ~2.5 ~ #wander:can_pass if block ~ ~3.5 ~ #wander:can_pass run function wander:ai/anim_states/angry_sword
execute unless block ~ ~-0.1 ~ #wander:water_blocks unless block ~ ~2.5 ~ #wander:can_pass run function wander:ai/anim_states/sneak
execute unless block ~ ~-0.1 ~ #wander:water_blocks unless block ~ ~3.5 ~ #wander:can_pass run function wander:ai/anim_states/sneak

execute if block ~ ~-0.3 ~ #wander:water_blocks run function wander:ai/anim_states/swim

scoreboard players remove sword wander.attack_cooldown 1
scoreboard players remove throw_sword wander.attack_cooldown 1
scoreboard players remove throw_whey wander.attack_cooldown 1

execute if predicate {"condition":"minecraft:random_chance","chance":0.08} unless score whey_count wander.data matches 10.. run scoreboard players add whey_count wander.data 1


scoreboard players remove attack_cd wander.data 1

attribute @s movement_speed base set 1.2

execute as @n[tag=wander.tower_bottom] at @s facing entity abb5e532-ba94-447e-8b50-7b463008a14c feet rotated ~ 0 positioned ^ ^ ^2 run tp @n[tag=wander.tower_bottom_target] ~ ~ ~

scoreboard players remove ice_cooldown wander.data 1

execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .x_size scan_config 10
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .y_size scan_config 5
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .z_size scan_config 10
execute if score ice_cooldown wander.data matches ..0 at @p[tag=wander.target] rotated as @p[tag=wander.target] rotated ~ 0 positioned ^ ^ ^5 positioned ~-5 ~-1 ~-5 run function wander:scan/scan
execute if score water_check wander.temp matches 1.. run function wander:ai/attacks/throw_ice_init
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set ice_cooldown wander.data 20


execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":15}} at @p[tag=wander.target] run function wander:tower_collapse/get_tower_bottom
execute if entity @n[tag=wander.tower_bottom_target] run function wander:ai/pathfind_macro {target:'@n[tag=wander.tower_bottom_target]'}

execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":15}} \
unless entity @n[tag=wander.tower_bottom_target] \
if entity @s[tag=!wander.threw_sword] \
if score throw_sword wander.attack_cooldown matches ..0 \
unless score attack_ai wander.data matches 3 \
as @p[tag=wander.target] at @s \
unless function wander:on_happy_ghast \
as abb5e532-ba94-447e-8b50-7b463008a14c at @s \
if predicate {"condition":"minecraft:random_chance","chance":0.4} \
run return run \
scoreboard players set ai wander.data 22

execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":50}} \
unless entity @n[tag=wander.tower_bottom_target] \
if entity @s[tag=!wander.threw_sword] \
if score throw_sword wander.attack_cooldown matches ..0 \
unless score attack_ai wander.data matches 3 \
as @p[tag=wander.target] at @s \
unless function wander:on_happy_ghast \
as abb5e532-ba94-447e-8b50-7b463008a14c at @s \
run function wander:ai/attacks/throw_sword_init




execute if entity @s[tag=wander.threw_sword] run function wander:ai/pathfind_macro {target:'@n[tag=wander.sword_proj_display_landed]'}


execute if entity @s[tag=wander.threw_sword] if entity @n[tag=wander.sword_proj_display_landed] run scoreboard players set ai wander.data 24
#execute if entity @s[tag=wander.threw_sword] if entity @n[tag=wander.sword_proj_display_landed] if entity @s[predicate=wander:on_ground] run function wander:ai/jump/main


#execute unless entity @n[tag=wander.tower_bottom_target,distance=0..2.7] at @p[tag=wander.target] positioned ~ ~-2 ~ run function wander:tower_collapse/get_tower_bottom
execute unless entity @s[tag=wander.threw_sword] if entity @n[tag=wander.tower_bottom_target,distance=0..2.7] if score sword wander.attack_cooldown matches ..0 run rotate @s facing entity @n[tag=wander.tower_bottom]
execute unless entity @s[tag=wander.threw_sword] if entity @n[tag=wander.tower_bottom_target,distance=0..2.7] if score sword wander.attack_cooldown matches ..0 unless score attack_ai wander.data matches 3 run function wander:ai/attacks/sword_swipe_init


execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score player_height wander.temp matches -10..3 run scoreboard players set ai wander.data 20
execute if entity @p[tag=wander.target,distance=30..] run scoreboard players set ai wander.data 25

execute unless entity @n[type=happy_ghast,distance=0..7] as @p[tag=wander.target] at @s if function wander:on_happy_ghast as abb5e532-ba94-447e-8b50-7b463008a14c at @s run function wander:ai/attacks/throw_whey_init
execute if entity @n[type=happy_ghast,distance=0..7] unless entity @s[tag=wander.threw_sword] if score sword wander.attack_cooldown matches ..0 unless score attack_ai wander.data matches 3 run function wander:ai/attacks/sword_swipe_init

execute if entity @n[type=#wander:scares_traders,distance=0..17] run function wander:ai/attacks/throw_whey_init

execute if function wander:ai/underground/underground_check run scoreboard players set ai wander.data 20


execute unless entity @s[tag=wander.threw_sword] if score failed_sword_swipes wander.data matches 3.. if score throw_sword wander.attack_cooldown matches ..0 unless score attack_ai wander.data matches 3 as @p[tag=wander.target] at @s unless function wander:on_happy_ghast as abb5e532-ba94-447e-8b50-7b463008a14c at @s run function wander:ai/attacks/throw_sword_init
execute unless entity @s[tag=wander.threw_sword] if score failed_sword_swipes wander.data matches 3.. if score throw_sword wander.attack_cooldown matches ..0 unless score attack_ai wander.data matches 3 as @p[tag=wander.target] at @s unless function wander:on_happy_ghast as abb5e532-ba94-447e-8b50-7b463008a14c at @s if predicate {"condition":"minecraft:random_chance","chance":0.4} run scoreboard players set ai wander.data 22

execute if block ~ ~ ~ #minecraft:ice run function wander:ai/destroy_nearby/init

scoreboard players set break_out wander.data 0