function wander:reset_values
scoreboard players set daytime wander.data 48000
scoreboard players set defeated wander.data 0
scoreboard players set health wander.data 700
bossbar set wander:health max 700
execute as @a[tag=wander.potential_target,limit=4] run scoreboard players add health wander.data 100
execute store result bossbar wander:health max run scoreboard players get health wander.data

scoreboard players set days_passed wander.data 0
title @a times 0 40 20
title @a actionbar "Survive for 2 days..."
