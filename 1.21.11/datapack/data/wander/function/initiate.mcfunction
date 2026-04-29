function wander:reset_values
scoreboard players set @a[distance=0..20] wander.encounters -2
scoreboard players set daytime wander.data 192000
scoreboard players set defeated wander.data 0
scoreboard players set health wander.data 700
scoreboard players set bad_omen wander.data 0
bossbar set wander:health max 700
execute as @a[tag=wander.potential_target,limit=6] run scoreboard players add health wander.data 100
execute store result score player_count wander.data if entity @a[tag=wander.potential_target]
execute if score player_count wander.data matches 15.. run scoreboard players add health wander.data 1000
execute if score player_count wander.data matches 25.. run scoreboard players add health wander.data 1000

execute store result bossbar wander:health max run scoreboard players get health wander.data

scoreboard players set 33 wander.data 33
scoreboard players set 100 wander.data 100
scoreboard players operation 33%health wander.data = health wander.data
scoreboard players operation 33%health wander.data *= 33 wander.data
scoreboard players operation 33%health wander.data /= 100 wander.data
scoreboard players operation 66%health wander.data = 33%health wander.data
scoreboard players operation 66%health wander.data += 33%health wander.data


scoreboard players set days_passed wander.data 0
title @a times 0 40 20
title @a actionbar "Survive for 8 days..."
