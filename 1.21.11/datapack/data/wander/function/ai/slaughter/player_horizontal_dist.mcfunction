execute store result score wander_x wander.temp run data get entity abb5e532-ba94-447e-8b50-7b463008a14c Pos[0] 1
execute store result score wander_z wander.temp run data get entity abb5e532-ba94-447e-8b50-7b463008a14c Pos[2] 1

execute store result score player_x wander.temp run data get entity @p[tag=wander.target] Pos[0] 1
execute store result score player_z wander.temp run data get entity @p[tag=wander.target] Pos[2] 1

scoreboard players operation player_x wander.temp -= wander_x wander.temp
scoreboard players operation player_z wander.temp -= wander_z wander.temp
scoreboard players set -1 wander.temp -1
execute if score player_x wander.temp matches ..-1 run scoreboard players operation player_x wander.temp *= -1 wander.temp
execute if score player_z wander.temp matches ..-1 run scoreboard players operation player_z wander.temp *= -1 wander.temp

scoreboard players operation player_x wander.temp += player_z wander.temp

return run scoreboard players get player_x wander.temp