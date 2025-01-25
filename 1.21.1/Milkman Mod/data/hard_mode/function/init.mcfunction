scoreboard players set hard_mode wander.data 1
scoreboard players set new_spawn_time wander.data 1200
scoreboard players set timer wander.data 0
scoreboard players set daytime wander.data 6000
execute as @a[tag=wander.potential_target] run scoreboard players add daytime wander.data 6000
function manhunt_goal:tick
execute if score manhunt_goal wander.data matches 1 run give @a iron_helmet
execute if score manhunt_goal wander.data matches 1 run give @a iron_chestplate
execute if score manhunt_goal wander.data matches 1 run give @a iron_leggings
execute if score manhunt_goal wander.data matches 1 run give @a iron_boots
