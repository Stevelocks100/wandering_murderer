execute unless block ~ ~-0.1 ~ #wander:water_ish if entity @s[tag=wander.threw_sword] run function wander:ai/animation_macro {move:'angry_run',idle:'angry_idle'}
execute unless block ~ ~-0.1 ~ #wander:water_ish unless entity @s[tag=wander.threw_sword] run function wander:ai/animation_macro {move:'angry_run_sword',idle:'angry_idle'}
execute if block ~ ~-0.3 ~ #wander:water_ish run function wander:ai/animation_macro {move:'swim',idle:'angry_idle'}

scoreboard players remove sword wander.attack_cooldown 1

scoreboard players remove attack_cd wander.data 1

attribute @s generic.movement_speed base set 1.1


#scoreboard players remove ice_cooldown wander.data 1
#
#execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .x_size scan_config 10
#execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .y_size scan_config 5
#execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .z_size scan_config 10
#execute if score ice_cooldown wander.data matches ..0 at @p[tag=wander.target] rotated as @p[tag=wander.target] rotated ~ 0 positioned ^ ^ ^5 positioned ~-5 ~-1 ~-5 run function scan:scan
#execute if score ice_cooldown wander.data matches ..0 run scoreboard players set ice_cooldown wander.data 20



function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}
execute if predicate wander:not_moving if score attack_cd wander.data matches ..0 if score sword wander.attack_cooldown matches ..0 unless score attack_ai wander.data matches 3 run function wander:ai/attacks/sword_swipe_init




execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if function wander:ai/underground/underground_check unless score player_height wander.temp matches -2..1 run scoreboard players set ai wander.data 20
execute unless function wander:ai/underground/underground_check run scoreboard players set ai wander.data 20



execute unless block ~ ~ ~ #wander:air_ish run function wander:ai/destory_nearby/init
execute unless block ~ ~1 ~ #wander:air_ish run function wander:ai/destory_nearby/init

