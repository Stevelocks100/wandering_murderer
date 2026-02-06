$execute unless entity $(target) run return run scoreboard players set jump_tick wander.data -12
execute store result score current_x wander.temp run data get entity @s Pos[0] 100
execute store result score current_z wander.temp run data get entity @s Pos[2] 100

$execute store result score desired_x wander.temp run data get entity $(target) Pos[0] 100
$execute store result score desired_z wander.temp run data get entity $(target) Pos[2] 100

scoreboard players operation desired_x wander.temp -= current_x wander.temp
scoreboard players operation desired_z wander.temp -= current_z wander.temp

execute if score desired_x wander.temp matches ..-1 run scoreboard players operation desired_x wander.temp *= -1 wander.data
execute if score desired_z wander.temp matches ..-1 run scoreboard players operation desired_z wander.temp *= -1 wander.data

execute store result storage wander:temp distance.a float 0.01 run scoreboard players get desired_x wander.temp
execute store result storage wander:temp distance.b float 0.01 run scoreboard players get desired_z wander.temp
execute summon item_display run function wander:ai/jump/get_distance2 with storage wander:temp distance
$data modify storage wander:temp jump.target set value "$(target)"
execute store result storage wander:temp jump.final_distance double 0.00025 run data get storage wander:temp distance.output 100
return run data get storage wander:temp distance.output

