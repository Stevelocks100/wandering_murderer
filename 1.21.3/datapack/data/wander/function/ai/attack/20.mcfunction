execute unless block ~ ~-0.1 ~ #wander:water_ish if entity @s[tag=wander.threw_sword] run function wander:ai/animation_macro {move:'angry_run',idle:'angry_idle'}
execute unless block ~ ~-0.1 ~ #wander:water_ish unless entity @s[tag=wander.threw_sword] run function wander:ai/animation_macro {move:'angry_run_sword',idle:'angry_idle'}
execute if block ~ ~-0.3 ~ #wander:water_ish run function wander:ai/animation_macro {move:'swim',idle:'angry_idle'}
execute if entity @s[tag=wander.threw_sword] as @n[tag=aj.wander.root] run function animated_java:wander/variants/sword_none/apply

scoreboard players remove punch wander.attack_cooldown 1
scoreboard players remove sword wander.attack_cooldown 1
execute if entity @s[tag=wander.threw_sword] run scoreboard players set sword wander.attack_cooldown 20
scoreboard players remove stew wander.attack_cooldown 1
scoreboard players remove ice wander.attack_cooldown 1


scoreboard players remove attack_cd wander.data 1

function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}

attribute @s movement_speed base set 1.2

execute if entity @p[tag=wander.target,distance=0..3] run scoreboard players remove attack_cd wander.data 4

execute if entity @p[tag=wander.target,distance=0..3] if score attack_cd wander.data matches ..0 run function wander:ai/attack/attack
execute positioned ~ ~2 ~ if entity @p[tag=wander.target,distance=0..2] if score attack_cd wander.data matches ..0 run function wander:ai/attack/attack

tag @s remove wander.follow_success

execute unless entity @p[tag=tower.success] run tag @p[tag=wander.target] add tower.player
execute if entity @p[tag=tower.success] run function wander:ai/attack/attack_tower
execute if entity @s[tag=wander.threw_sword] if entity @n[tag=wander.sword_proj_display_landed] run scoreboard players set jump_tick wander.data -12
execute if entity @s[tag=wander.threw_sword] if entity @n[tag=wander.sword_proj_display_landed] if entity @s[nbt={OnGround:1b}] run function wander:ai/jump/main

scoreboard players remove ice_cooldown wander.data 1

execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .x_size scan_config 10
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .y_size scan_config 5
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .z_size scan_config 10
execute if score ice_cooldown wander.data matches ..0 at @p[tag=wander.target] rotated as @p[tag=wander.target] rotated ~ 0 positioned ^ ^ ^5 positioned ~-5 ~-1 ~-5 run function scan:scan
execute if score water_check wander.temp matches 1 run function wander:ai/attacks/throw_ice_init

execute if score ice_cooldown wander.data matches ..0 run scoreboard players set ice_cooldown wander.data 20



execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score player_height wander.temp matches 6.. unless function wander:ai/underground/underground_check run scoreboard players set ai wander.data 21
execute if score dig_config wander.data matches 1 if score player_height wander.temp matches ..-1 at @p[tag=wander.target] if function wander:ai/underground/underground_check run scoreboard players set ai wander.data 22

execute unless block ~ ~ ~ #wander:motion_ish run function wander:ai/destory_nearby/init

scoreboard players set failed_sword_swipes wander.data 0



#data modify entity @s NoAI set value 0b
execute if function wander:ai/underground/underground_check unless score player_height wander.temp matches -2..1 if entity @s[nbt={OnGround:1b}] run scoreboard players remove timer wander.data 200
execute if function wander:ai/underground/underground_check if score player_height wander.temp matches -2..1 if score dig_config wander.data matches 1 run scoreboard players set ai wander.data 23

execute if entity @p[tag=wander.target,distance=40..] run tag @p[tag=wander.target] remove wander.target