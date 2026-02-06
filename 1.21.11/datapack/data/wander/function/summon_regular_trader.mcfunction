summon wandering_trader ~ ~ ~ {Tags:["wander.new","wander.regular_trader"],DespawnDelay:12000}
summon trader_llama ~ ~ ~ {Tags:["wander.new","wander.regular_llama"]}
summon trader_llama ~ ~ ~ {Tags:["wander.new","wander.regular_llama"]}
execute as @e[tag=wander.new,tag=wander.regular_llama] run data modify entity @s leash.UUID set from entity @n[tag=wander.new,tag=wander.regular_trader] UUID
data modify entity @n[tag=wander.new,tag=wander.regular_trader] wander_target set value [I;0,0,0]
execute at @p[gamemode=!spectator] positioned over motion_blocking_no_leaves run summon marker ~ ~ ~ {Tags:["wander.find_ground"]}
execute store result entity @n[tag=wander.new,tag=wander.regular_trader] wander_target[0] int 1 run data get entity @n[tag=wander.find_ground] Pos[0]
execute store result entity @n[tag=wander.new,tag=wander.regular_trader] wander_target[1] int 1 run data get entity @n[tag=wander.find_ground] Pos[1]
execute store result entity @n[tag=wander.new,tag=wander.regular_trader] wander_target[2] int 1 run data get entity @n[tag=wander.find_ground] Pos[2]
kill @n[tag=wander.find_ground]
tag @e[tag=wander.regular_trader] remove wander.new
tag @e[tag=wander.regular_llama] remove wander.new
