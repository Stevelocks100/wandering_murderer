execute store result score credit_method wander.data run random value 1..3

scoreboard players set minimum_encounters wander.encounters 999
execute as @a[tag=wander.potential_target,sort=random] run scoreboard players operation minimum_encounters wander.encounters < @s wander.encounters

execute as @a[sort=random] if score @s wander.encounters = minimum_encounters wander.encounters run tag @s add wander.highest_encounters



scoreboard players set highest_damage_dealt wander.data 999
execute as @a[tag=wander.potential_target,sort=random] run scoreboard players operation highest_damage_dealt wander.data < @s wander.trader_damage_dealt

execute as @a[sort=random] if score @s wander.trader_damage_dealt = highest_damage_dealt wander.data run tag @s add wander.highest_damage_dealt


#wander.last_hit


tag @a remove wander.kill_credit

execute if entity @p[tag=wander.sneak] run tag @p[tag=wander.sneak] add wander.kill_credit
execute if entity @p[tag=wander.sneak] run return run tag @p[tag=wander.sneak] remove wander.sneak

execute if score credit_method wander.data matches 1 run tag @r[tag=wander.highest_encounters] add wander.kill_credit
execute if score credit_method wander.data matches 2 run tag @r[tag=wander.highest_damage_dealt] add wander.kill_credit
execute if score credit_method wander.data matches 3 run tag @r[tag=wander.last_hit] add wander.kill_credit

tag @a remove wander.highest_encounters
tag @a remove wander.highest_damage_dealt
tag @a remove wander.last_hit