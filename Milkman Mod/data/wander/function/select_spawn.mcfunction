scoreboard players set new_spawn_time wander.data 999999999

execute if entity @p[tag=wander.new_target] as @p[tag=wander.new_target] at @s rotated as @s run function wander:spawn_search/init
execute if entity @p[tag=wander.new_target] run return 1

scoreboard players set minimum_encounters wander.encounters 999
execute as @a[tag=wander.potential_target] run scoreboard players operation minimum_encounters wander.encounters < @s wander.encounters

execute as @a if score @s wander.encounters = minimum_encounters wander.encounters run tag @s add wander.new_target

execute as @r[tag=wander.new_target] at @s rotated as @s run function wander:spawn_search/init

