execute store result score player_height wander.temp run data get entity @p[tag=tower.success] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score player_height wander.temp matches 1..9 run tp @s ~ ~ ~ facing entity @p[tag=tower.success]
execute if score player_height wander.temp matches 1..9 run function wander:ai/attacks/throw_sword_init


execute if score player_height wander.temp matches 10.. unless entity @s[tag=wander.threw_sword] run tp @s ~ ~ ~ facing entity @p[tag=tower.success]
execute if score player_height wander.temp matches 10.. unless entity @s[tag=wander.threw_sword] at @p[tag=tower.success] positioned ~ ~-2 ~ run function wander:tower_collapse/get_tower_bottom
execute if score player_height wander.temp matches 10.. unless entity @s[tag=wander.threw_sword] run scoreboard players set ai wander.data 21