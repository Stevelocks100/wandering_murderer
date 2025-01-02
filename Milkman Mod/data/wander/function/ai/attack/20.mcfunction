execute unless block ~ ~ ~ #wander:water_ish if entity @s[tag=wander.threw_sword] run function wander:ai/animation_macro {move:'angry_run',idle:'angry_idle'}
execute unless block ~ ~ ~ #wander:water_ish unless entity @s[tag=wander.threw_sword] run function wander:ai/animation_macro {move:'angry_run_sword',idle:'angry_idle'}
execute if block ~ ~ ~ #wander:water_ish run function wander:ai/animation_macro {move:'swim',idle:'angry_idle'}
execute if entity @s[tag=wander.threw_sword] as @n[tag=aj.wander.root] run function animated_java:wander/variants/sword_ne/apply

scoreboard players remove punch wander.attack_cooldown 1
scoreboard players remove sword wander.attack_cooldown 1
execute if entity @s[tag=wander.threw_sword] run scoreboard players set sword wander.attack_cooldown 10
scoreboard players remove stew wander.attack_cooldown 1
scoreboard players remove ice wander.attack_cooldown 1


scoreboard players remove attack_cd wander.data 1

function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}

attribute @s generic.movement_speed base set 1.3

execute if entity @p[tag=wander.target,distance=0..3] run scoreboard players remove attack_cd wander.data 4

execute if entity @p[tag=wander.target,distance=0..3] if score attack_cd wander.data matches ..0 run function wander:ai/attack/attack
execute positioned ~ ~2 ~ if entity @p[tag=wander.target,distance=0..2] if score attack_cd wander.data matches ..0 run function wander:ai/attack/attack


execute unless entity @p[tag=tower.success] run tag @p[tag=wander.target] add tower.player
execute if entity @p[tag=tower.success] run function wander:ai/attack/attack_tower
execute if entity @s[tag=wander.threw_sword] if entity @n[tag=wander.sword_proj_display_landed] run scoreboard players set jump_tick wander.data -12
execute if entity @s[tag=wander.threw_sword] if entity @n[tag=wander.sword_proj_display_landed] run function wander:ai/jump/main

scoreboard players remove ice_cooldown wander.data 1

execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .x_size scan_config 10
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .y_size scan_config 5
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .z_size scan_config 10
execute if score ice_cooldown wander.data matches ..0 at @p[tag=wander.target] rotated as @p[tag=wander.target] rotated ~ 0 positioned ^ ^ ^5 positioned ~-5 ~-1 ~-5 run function scan:scan
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set ice_cooldown wander.data 20



execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score player_height wander.temp matches 6.. run scoreboard players set ai wander.data 21




scoreboard players set failed_sword_swipes wander.data 0


#data modify entity @s NoAI set value 0b