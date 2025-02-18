execute unless block ~ ~-0.1 ~ #wander:water_ish if entity @s[tag=wander.threw_sword] run function wander:ai/animation_macro {move:'angry_run',idle:'angry_idle'}
execute unless block ~ ~-0.1 ~ #wander:water_ish unless entity @s[tag=wander.threw_sword] run function wander:ai/animation_macro {move:'angry_run_sword',idle:'angry_idle'}
execute if block ~ ~-0.3 ~ #wander:water_ish run function wander:ai/animation_macro {move:'swim',idle:'swim_idle'}

scoreboard players remove sword wander.attack_cooldown 1
scoreboard players remove throw_sword wander.attack_cooldown 1

scoreboard players remove attack_cd wander.data 1

attribute @s generic.movement_speed base set 1.2

execute as @n[tag=wander.tower_bottom] at @s facing entity @n[tag=wander.ai] feet rotated ~ 0 positioned ^ ^ ^2 run tp @n[tag=wander.tower_bottom_target] ~ ~ ~

scoreboard players remove ice_cooldown wander.data 1

execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .x_size scan_config 10
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .y_size scan_config 5
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .z_size scan_config 10
execute if score ice_cooldown wander.data matches ..0 at @p[tag=wander.target] rotated as @p[tag=wander.target] rotated ~ 0 positioned ^ ^ ^5 positioned ~-5 ~-1 ~-5 run function scan:scan
execute if score water_check wander.temp matches 1 run function wander:ai/attacks/throw_ice_init
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set ice_cooldown wander.data 20


execute unless entity @n[tag=wander.tower_bottom_target] at @p[tag=wander.target] run function wander:tower_collapse/get_tower_bottom
execute if entity @n[tag=wander.tower_bottom_target] run function wander:ai/pathfind_macro {target:'@n[tag=wander.tower_bottom_target]'}
execute unless entity @n[tag=wander.tower_bottom_target] if entity @s[tag=!wander.threw_sword] if score throw_sword wander.attack_cooldown matches ..0 unless score attack_ai wander.data matches 3 run function wander:ai/attacks/throw_sword_init

execute if entity @s[tag=wander.threw_sword] run function wander:ai/pathfind_macro {target:'@n[tag=wander.sword_proj_display_landed]'}




#execute unless entity @n[tag=wander.tower_bottom_target,distance=0..2.7] at @p[tag=wander.target] positioned ~ ~-2 ~ run function wander:tower_collapse/get_tower_bottom
execute if entity @n[tag=wander.tower_bottom_target,distance=0..2.7] if score sword wander.attack_cooldown matches ..0 run tp @s ~ ~ ~ facing entity @n[tag=wander.tower_bottom]
execute if entity @n[tag=wander.tower_bottom_target,distance=0..2.7] if score sword wander.attack_cooldown matches ..0 unless score attack_ai wander.data matches 3 run function wander:ai/attacks/sword_swipe_init


execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score player_height wander.temp matches -10..3 run scoreboard players set ai wander.data 20

execute if function wander:ai/underground/underground_check run scoreboard players set ai wander.data 20

execute unless entity @s[tag=wander.threw_sword] if score failed_sword_swipes wander.data matches 3.. if score throw_sword wander.attack_cooldown matches ..0 unless score attack_ai wander.data matches 3 run function wander:ai/attacks/throw_sword_init

execute if block ~ ~ ~ #minecraft:ice run function wander:ai/destroy_nearby/init

scoreboard players set break_out wander.data 0