scoreboard players set hard_mode wander.data 1
scoreboard players set hard_mode_defeated wander.data 0
scoreboard players set new_spawn_time wander.data 1200
scoreboard players set timer wander.data 0
scoreboard players set daytime wander.data 100
scoreboard players set health wander.data 1000
bossbar set wander:health max 1000
execute as @a[tag=wander.potential_target,limit=4] run scoreboard players add daytime wander.data 3000
execute as @a[tag=wander.potential_target] run scoreboard players add health wander.data 400
execute store result bossbar wander:health max run scoreboard players get health wander.data
