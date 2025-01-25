scoreboard players set success wander.temp 0
execute positioned ~ 100 ~ run summon marker ~ ~ ~ {Tags:["wander.trader_pos"]}
execute at @p[tag=wander.target] positioned ~ 100 ~ run summon marker ~ ~ ~ {Tags:["wander.player_pos"]}
#execute as @n[tag=wander.trader_pos] at @s if entity @n[tag=wander.player_pos,distance=0..1.8] run 
scoreboard players set success wander.temp 1
kill @e[tag=wander.trader_pos]
kill @e[tag=wander.player_pos]
execute if score success wander.temp matches 1 run return 1
execute if score success wander.temp matches 0 run return 0
