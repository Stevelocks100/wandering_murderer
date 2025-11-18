execute store result score current_x wander.temp run data get entity @s Pos[0] 100
execute store result score current_z wander.temp run data get entity @s Pos[2] 100

execute store result score desired_x wander.temp run data get entity @n[tag=wander.sword_proj_display_landed] Pos[0] 100
execute store result score desired_z wander.temp run data get entity @n[tag=wander.sword_proj_display_landed] Pos[2] 100

scoreboard players operation desired_x wander.temp -= current_x wander.temp
scoreboard players operation desired_z wander.temp -= current_z wander.temp

execute if score desired_x wander.temp matches ..-1 run scoreboard players operation desired_x wander.temp *= -1 wander.data
execute if score desired_z wander.temp matches ..-1 run scoreboard players operation desired_z wander.temp *= -1 wander.data

execute store result storage wander:temp distance.a float 0.01 run scoreboard players get desired_x wander.temp
execute store result storage wander:temp distance.b float 0.01 run scoreboard players get desired_z wander.temp
execute summon item_display run function wander:ai/jump/get_distance2 with storage wander:temp distance
execute store result storage wander:temp final_distance double 0.00025 run data get storage wander:temp distance.output 100