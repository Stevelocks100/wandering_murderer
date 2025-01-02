scoreboard players set new_spawn_time wander.data 1200
execute if entity @n[tag=wander.ai] run scoreboard players set new_spawn_time wander.data 99999999
scoreboard players set @a wander.encounters 2
execute if score ai wander.data matches 1 run scoreboard players set ai wander.data 20
scoreboard players set health wander.data 999
execute if entity @n[tag=wander.ai] run scoreboard players set timer wander.data 999999
execute if score daytime wander.data matches -450..-100 unless entity @n[tag=wander.ai] run scoreboard players set daytime wander.data -501
execute if score daytime wander.data matches ..-500 run scoreboard players set hard_mode wander.data 0